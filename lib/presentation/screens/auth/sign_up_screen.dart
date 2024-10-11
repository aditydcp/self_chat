import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:self_chat/domain/usecases/auth/sign_up_user.dart';
import 'package:self_chat/domain/usecases/user/add_user.dart';

class SignUpScreen extends StatefulWidget {
  final SignUpUser signUpUser;
  final AddUser addUser;

  const SignUpScreen(
      {super.key, required this.signUpUser, required this.addUser});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _errorMessage;

  Future<void> _signUp() async {
    try {
      final user = await widget.signUpUser(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
      if (user != null) {
        await widget.addUser(user);
      } else {
        if (kDebugMode) {
          print('Failed to login');
        }
      }
      // Handle success (e.g., navigate to login or home screen)
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            if (_errorMessage != null)
              Text(_errorMessage!, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signUp,
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
