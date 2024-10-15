import 'package:flutter/material.dart';
import 'package:self_chat/presentation/screens/auth/sign_in_screen.dart';
import 'package:self_chat/presentation/screens/auth/sign_up_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLogin = true;

  void _toggleAuthMode() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLogin ? 'Login' : 'Sign Up'),
      ),
      body: Center(
        child: _isLogin ? const SignInScreen() : const SignUpScreen(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_isLogin
                ? "Don't have an account?"
                : "Already have an account?"),
            TextButton(
              onPressed: _toggleAuthMode,
              child: Text(_isLogin ? 'Sign Up' : 'Login'),
            ),
          ],
        ),
      ),
    );
  }
}
