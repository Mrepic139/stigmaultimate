from flask import Flask, request, jsonify
from collections import defaultdict
import time

app = Flask(__name__)

queues = defaultdict(list)      # command queue per target
results = defaultdict(dict)     # command results

@app.route('/')
def index():
    return "ANS-SS Server is running."

@app.route('/command', methods=['POST'])
def command():
    """WinForms sends code here."""
    data = request.get_json()
    if not data or 'code' not in data:
        return jsonify({'error': 'Missing code'}), 400
    target = data.get('target', 'default')
    code = data['code']
    cmd_id = str(time.time_ns())
    queues[target].append({'id': cmd_id, 'code': code})
    return jsonify({'status': 'queued', 'id': cmd_id})

@app.route('/poll', methods=['GET'])
def poll():
    """Roblox poller gets next command."""
    target = request.args.get('target', 'default')
    last_id = request.args.get('last', '')
    q = queues.get(target, [])
    found = False
    for cmd in q:
        if not found and cmd['id'] == last_id:
            found = True
            continue
        if found:
            return jsonify(cmd)
    return jsonify({})

@app.route('/result', methods=['POST'])
def result():
    """Roblox sends execution result."""
    data = request.get_json()
    if not data or 'id' not in data:
        return jsonify({'error': 'Missing id'}), 400
    target = data.get('target', 'default')
    cmd_id = data['id']
    result = data.get('result', 'done')
    results[target][cmd_id] = result
    # Remove from queue
    q = queues.get(target, [])
    queues[target] = [c for c in q if c['id'] != cmd_id]
    return jsonify({'status': 'ok'})

@app.route('/result/<cmd_id>', methods=['GET'])
def get_result(cmd_id):
    target = request.args.get('target', 'default')
    res = results.get(target, {}).get(cmd_id)
    return jsonify({'found': res is not None, 'result': res})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
