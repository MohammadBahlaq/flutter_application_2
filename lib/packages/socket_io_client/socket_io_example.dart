import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketIoExample extends StatefulWidget {
  const SocketIoExample({super.key});

  @override
  State<SocketIoExample> createState() => _SocketIoExampleState();
}

class _SocketIoExampleState extends State<SocketIoExample> {
  late TextEditingController textEditingController;

  late io.Socket socket;
  List<String> messages = [];

  @override
  void initState() {
    textEditingController = TextEditingController();

    socket = io.io(
      'http://192.168.1.160:3009',
      io.OptionBuilder()
          .setTransports(["websocket"])
          // .disableAutoConnect() //Optional
          // .setQuery({"auth": "flutter_client"}) //Optional
          .build(),
    );

    socket.connect();

    socket.onConnect((_) {
      print('connect');
    });

    socket.on('chat', (data) {
      log("data: $data");

      if (data is String) {
        log(messages.toString());

        messages.add(data);
        setState(() {});
      }
    });

    socket.onDisconnect((_) => print('disconnect'));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home page")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) =>
                  ListTile(title: Text(messages[index])),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: textEditingController,
              decoration: InputDecoration(border: OutlineInputBorder()),
              onFieldSubmitted: (text) {
                socket.emit('chat', text);

                textEditingController.clear();
              },
            ),
          ),
        ],
      ),
    );
  }
}
