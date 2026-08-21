const express = require('express');
const cors = require('cors');
const app = express();

app.use(cors());
app.use(express.json());

let commands = [];
let gameLogs = [];
const WHITELIST_ACCOUNT = "YourWhitelistAccount"; // CHANGE THIS

// lua poller calls this
app.post('/poll', (req, res) => {
    const { username, jobId, gameId, placeId } = req.body;
    
    gameLogs.push({ username, jobId, gameId, placeId, timestamp: new Date().toISOString() });
    console.log(`[LOG] ${username} | ${jobId}`);
    
    const userCommands = commands.filter(cmd => 
        cmd.target.toLowerCase() === username.toLowerCase() || 
        cmd.target.toLowerCase() === 'all'
    );
    
    const deliveredIds = userCommands.map(c => c.id);
    commands = commands.filter(c => !deliveredIds.includes(c.id));
    
    res.json({ commands: userCommands, whitelistAccount: WHITELIST_ACCOUNT });
});

// C# GUI sends commands here
app.post('/add_command', (req, res) => {
    const { target, code } = req.body;
    if (!target || !code) return res.status(400).json({ error: 'missing' });
    
    commands.push({ id: Date.now().toString(), target, code, timestamp: new Date().toISOString() });
    console.log(`[CMD] ${target}`);
    res.json({ success: true });
});

app.get('/logs', (req, res) => res.json(gameLogs));
app.get('/pending', (req, res) => res.json({ count: commands.length }));

app.listen(process.env.PORT || 3000, () => console.log('Running'));
