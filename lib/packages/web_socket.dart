import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketPage extends StatefulWidget {
  const WebSocketPage({super.key});

  @override
  State<WebSocketPage> createState() => _WebSocketPageState();
}

class _WebSocketPageState extends State<WebSocketPage> {
  WebSocketChannel webSocketChannel = IOWebSocketChannel.connect(
    "wss://ws.postman-echo.com/raw",
  );

  ScrollController scrollController = ScrollController();
  TextEditingController textEditingController = TextEditingController();

  List<String> messages = [];

  @override
  void initState() {
    // Timer.periodic(
    //   Duration(seconds: 1),
    //   (timer) => webSocketChannel.sink.add("${DateTime.now()}"),
    // );
    // webSocketChannel.stream.listen(
    //   (event) {
    //     log(event.toString());
    //   },
    //   onDone: () {
    //     log("Done");
    //   },
    //   onError: (error) {
    //     log("Error: $error");
    //   },
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home page")),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: webSocketChannel.stream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }

                if (snapshot.connectionState == ConnectionState.active) {
                  messages.add(snapshot.data);

                  return ListView.builder(
                    controller: scrollController,
                    itemCount: messages.length,
                    itemBuilder: (context, index) =>
                        ListTile(title: Text(messages[index])),
                  );
                }

                return SizedBox();
              },
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: textEditingController,
              decoration: InputDecoration(border: OutlineInputBorder()),
              onFieldSubmitted: (text) {
                webSocketChannel.sink.add(text);

                textEditingController.clear();
              },
            ),
          ),
        ],
      ),
    );
  }
}
