import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_chat/data/datasources/message/message_data_source_firestore.dart';
import 'package:self_chat/data/datasources/user/user_data_source_firestore.dart';
import 'package:self_chat/data/repositories/message_repository.dart';
import 'package:self_chat/data/repositories/user_repository.dart';
import 'package:self_chat/domain/usecases/message/add_message.dart';
import 'package:self_chat/domain/usecases/message/fetch_messages.dart';
import 'package:self_chat/domain/usecases/user/fetch_user.dart';
import 'package:self_chat/domain/usecases/user/sign_up_user.dart';
import 'package:self_chat/firebase_options.dart';
import 'package:self_chat/presentation/viewmodels/chatroom_viewmodel.dart';
import 'package:self_chat/presentation/screens/chatroom_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize database
    final db = FirebaseFirestore.instance;

    // Initialize datasources
    final messageDataSource = MessageDataSourceFirestore(db);
    final userDataSource = UserDataSourceFirestore(db);

    // Initialize your repositories and use cases here
    final messageRepository = MessageRepository(messageDataSource);
    final userRepository = UserRepository(userDataSource);

    final fetchMessages = FetchMessages(messageRepository);
    final addMessage = AddMessage(messageRepository);

    final signUpUser = SignUpUser(userRepository);
    final fetchUser = FetchUser(userRepository);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ChatroomViewModel(
            fetchMessages: fetchMessages,
            addMessage: addMessage,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Self Chat App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ChatroomScreen(
          chatroomId: '1', // Example chatroom ID
          personaId: '123', // Example persona ID
        ),
      ),
    );
  }
}
