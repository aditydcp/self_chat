import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_chat/data/datasources/auth/auth_data_source_firebase.dart';
import 'package:self_chat/data/datasources/message/message_data_source_firestore.dart';
import 'package:self_chat/data/datasources/user/user_data_source_firestore.dart';
import 'package:self_chat/data/repositories/auth_repository.dart';
import 'package:self_chat/data/repositories/message_repository.dart';
import 'package:self_chat/data/repositories/user_repository.dart';
import 'package:self_chat/domain/usecases/auth/sign_in_user.dart';
import 'package:self_chat/domain/usecases/auth/sign_out_user.dart';
import 'package:self_chat/domain/usecases/auth/sign_up_user.dart';
import 'package:self_chat/domain/usecases/message/add_message.dart';
import 'package:self_chat/domain/usecases/message/fetch_messages.dart';
import 'package:self_chat/domain/usecases/user/fetch_user.dart';
import 'package:self_chat/domain/usecases/user/add_user.dart';
import 'package:self_chat/firebase_options.dart';
import 'package:self_chat/presentation/screens/auth_screen.dart';
import 'package:self_chat/presentation/screens/chatroom_screen.dart';
import 'package:self_chat/presentation/viewmodels/chatroom_viewmodel.dart';

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
    final auth = FirebaseAuth.instance;

    // Initialize datasources
    final authDataSourceFirebase = AuthDataSourceFirebase(auth);

    final messageDataSource = MessageDataSourceFirestore(db);
    final userDataSource = UserDataSourceFirestore(db);

    // Initialize your repositories and use cases here
    final authRepository = AuthRepository(authDataSourceFirebase);

    final signInUser = SignInUser(authRepository);
    final signUpUser = SignUpUser(authRepository);
    final signOutUser = SignOutUser(authRepository);

    final messageRepository = MessageRepository(messageDataSource);
    final userRepository = UserRepository(userDataSource);

    final fetchMessages = FetchMessages(messageRepository);
    final addMessage = AddMessage(messageRepository);

    final addUser = AddUser(userRepository);
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
          home: StreamBuilder<User?>(
              stream: auth.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  User? user = snapshot.data;
                  if (user == null) {
                    return AuthScreen(
                      signInUser: signInUser,
                      signUpUser: signUpUser,
                      addUser: addUser,
                    );
                  } else {
                    return ChatroomScreen(
                      chatroomId: '1',
                      personaId: '123',
                      signOutUser: signOutUser,
                    );
                  }
                }

                return const Center(child: CircularProgressIndicator());
              })),
    );
  }
}
