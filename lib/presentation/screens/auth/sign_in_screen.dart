import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:self_chat/domain/usecases/auth/sign_in_user.dart';

class SignInScreen extends StatefulWidget {
  final SignInUser signInUser; // Injecting the use case

  const SignInScreen({super.key, required this.signInUser});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _errorMessage;

  Future<void> _login() async {
    try {
      final user = await widget.signInUser(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
      if (user != null) {
        if (kDebugMode) {
          print('Logged in as ${user.email} (${user.id}) as ${user.username}');
        }
      } else {
        if (kDebugMode) {
          print('Failed to login');
        }
      }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            onPressed: _login,
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
