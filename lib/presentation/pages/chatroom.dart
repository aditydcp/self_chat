import 'package:flutter/material.dart';
import 'package:self_chat/data/model/chatroom.dart';
import 'package:self_chat/data/model/message.dart';
import 'package:self_chat/data/model/persona.dart';

class ChatroomScreen extends StatefulWidget {
  const ChatroomScreen(
      {super.key, required this.chatroom, required this.activePersona});

  final Chatroom chatroom;
  final Persona activePersona;

  @override
  State<ChatroomScreen> createState() => _ChatroomScreenState();
}

class _ChatroomScreenState extends State<ChatroomScreen> {
  String _tempMessage = '';
  final List<Message> _messages = <Message>[];
  final TextEditingController _messagerController = TextEditingController();

  void setMessage(String message) {
    setState(() {
      _tempMessage = message;
    });
  }

  void sendMessage() {
    setState(() {
      _messages.add(Message(
          timestamp: DateTime.now(),
          message: _tempMessage,
          sender: widget.activePersona));
      _tempMessage = '';
      _messagerController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.chatroom.name),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            children: [
              Column(
                children: _messages.map((message) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      children: [
                        Text(message.sender.name),
                        Text(message.message),
                        Text(message.timestamp.toString())
                      ],
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: _messagerController,
                    decoration:
                        const InputDecoration(hintText: 'Enter message'),
                    onChanged: (value) {
                      setMessage(value);
                    },
                    onSubmitted: (value) {
                      sendMessage();
                    },
                  )),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      sendMessage();
                    },
                  )
                ],
              )
            ],
          ),
        )));
  }

  @override
  void dispose() {
    _messagerController.dispose();
    super.dispose();
  }
}
