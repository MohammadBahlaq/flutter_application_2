const express = require("express");
const http = require("http");
const { Server } = require("socket.io");
const app = express();
const server = http.createServer(app);
const io = new Server(server, {
    cors: { origin: "*" }
});
io.on("connection", (socket) => {
    console.log("Client connected:", socket.id);
    socket.on("chat", (data) => {
        console.log("Received:", data);
        io.emit("chat", data);   // broadcast to everyone (A → B, B → A)
    });
    // Handle disconnect event
    socket.on("disconnect", (reason) => {
        console.log(`Client disconnected: ${socket.id}, reason: ${reason}`);
    });
    // Optional: handle socket errors
    socket.on("error", (error) => {
        console.error(`Socket error from client ${socket.id}:`, error);
    });
});
server.listen(3009, () => console.log("Server listening on 3009"));