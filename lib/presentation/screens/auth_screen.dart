import 'package:flutter/material.dart';
import 'package:self_chat/domain/usecases/auth/sign_in_user.dart';
import 'package:self_chat/domain/usecases/auth/sign_up_user.dart';
import 'package:self_chat/domain/usecases/user/add_user.dart';
import 'package:self_chat/presentation/screens/auth/sign_in_screen.dart';
import 'package:self_chat/presentation/screens/auth/sign_up_screen.dart';

class AuthScreen extends StatelessWidget {
  final SignInUser signInUser;
  final SignUpUser signUpUser;
  final AddUser addUser;

  const AuthScreen({
    super.key,
    required this.signInUser,
    required this.signUpUser,
    required this.addUser,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authentication'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignInScreen(signInUser: signInUser),
                  ),
                );
              },
              child: const Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SignUpScreen(signUpUser: signUpUser, addUser: addUser),
                  ),
                );
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
