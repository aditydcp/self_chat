import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_chat/domain/entities/message.dart';
import 'package:self_chat/presentation/viewmodels/chatroom_viewmodel.dart';
import 'package:self_chat/presentation/widgets/message_widget.dart';

class ChatroomScreen extends StatefulWidget {
  final String chatroomId;
  final String personaId;

  const ChatroomScreen(
      {super.key, required this.chatroomId, required this.personaId});

  @override
  _ChatroomScreenState createState() => _ChatroomScreenState();
}

class _ChatroomScreenState extends State<ChatroomScreen> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Load messages when the screen is first initialized
    Provider.of<ChatroomViewModel>(context, listen: false)
        .loadMessages(widget.chatroomId);
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    final newMessage = Message(
      id: '', // Firestore will handle ID
      chatroomId: widget.chatroomId,
      personaId: widget.personaId,
      timestamp: DateTime.now(),
      content: _messageController.text,
    );

    Provider.of<ChatroomViewModel>(context, listen: false)
        .sendMessage(newMessage);

    _messageController.clear(); // Clear input after sending
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chatroom'),
      ),
      body: Column(
        children: [
          // Chat message list
          Expanded(
            child: Consumer<ChatroomViewModel>(
              builder: (context, chatroomViewModel, child) {
                if (chatroomViewModel.messages.isEmpty) {
                  return const Center(child: Text('No messages yet.'));
                }

                return ListView.builder(
                  itemCount: chatroomViewModel.messages.length,
                  itemBuilder: (context, index) {
                    final message = chatroomViewModel.messages[index];
                    final isMe = message.personaId == widget.personaId;
                    return MessageWidget(
                      message: message,
                      isMe: isMe,
                    );
                  },
                );
              },
            ),
          ),

          // Message input field and send button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your message',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}
