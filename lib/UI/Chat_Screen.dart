import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gpt/UI/QA%20page.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = [];

  void _addMessage(String message) {
    setState(() {
      _messages.insert(0, message);
    });
    _controller.clear();
  }

  Widget _buildMessageList() {
    return ListView.builder(
      reverse: true,
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_messages[index]),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Chat Gpt'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FloatingActionButton.extended(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => QA()));
              },
              label: const Text('Add'),
              icon: const Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: _buildMessageList()),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Colors.black),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _controller,
                onSubmitted: _addMessage,
                decoration: InputDecoration.collapsed(hintText: 'Message Gpt'),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () => _addMessage(_controller.text),
            ),
          ],
        ),
      ),
    );
  }
}
