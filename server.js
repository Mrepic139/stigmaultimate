const express = require('express');
const app = express();
app.use(express.json());

// In-memory store (use Redis/DB for production)
const scripts = {};

// Store a script for a target player
app.post('/script', (req, res) => {
    const { target, script } = req.body;
    if (!target || !script) {
        return res.status(400).send('Missing target or script');
    }
    scripts[target] = script;
    console.log(`[Store] Script for ${target} (${script.length} bytes)`);
    res.send('OK');
});

// Poll for a pending script (deletes after delivery)
app.get('/poll', (req, res) => {
    const target = req.query.target;
    if (!target) {
        return res.status(400).send('Missing target');
    }
    const script = scripts[target];
    if (script) {
        delete scripts[target];
        console.log(`[Poll] Delivered script to ${target}`);
        res.send(script);
    } else {
        res.status(404).send('No script');
    }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Render backend running on port ${PORT}`));
