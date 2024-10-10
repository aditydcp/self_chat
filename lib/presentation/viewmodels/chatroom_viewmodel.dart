import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:self_chat/domain/entities/message.dart';
import 'package:self_chat/domain/usecases/message/fetch_messages.dart';
import 'package:self_chat/domain/usecases/message/add_message.dart';

class ChatroomViewModel extends ChangeNotifier {
  final FetchMessages fetchMessages;
  final AddMessage addMessage;

  List<Message> messages = [];

  ChatroomViewModel({required this.fetchMessages, required this.addMessage});

  void loadMessages(String chatroomId) {
    fetchMessages(chatroomId).listen((fetchedMessages) {
      if (kDebugMode) {
        print("Messages fetched: $fetchedMessages");
      } // Add logging to debug
      messages = fetchedMessages;
      notifyListeners();
    }, onError: (error) {
      if (kDebugMode) {
        print("Error fetching messages: $error");
      }
    });
  }

  Future<void> sendMessage(Message message) async {
    if (kDebugMode) {
      print("Sending message: ${message.content}");
    }
    await addMessage(message);
  }
}
