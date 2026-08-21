// === EXECUTION RESULT ===
app.post('/result', (req, res) => {
    const { commandId, username, output } = req.body;
    console.log(`[RESULT] ${username} | ${commandId} | ${output}`);
    
    // Optional: log to discord
    sendToDiscord(`**[EXECUTION RESULT]**\n👤 User: ${username}\n🆔 Command: ${commandId}\n📝 Output: ${output}`);
    
    res.json({ success: true });
});
