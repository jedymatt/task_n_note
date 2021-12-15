// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_n_note/screens/home_screen.dart';
import 'package:task_n_note/screens/register_screen.dart';
import 'package:task_n_note/services/auth_service.dart';

import '../app.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailField = TextEditingController();
  final passwordField = TextEditingController();
  bool isObscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: AutofillGroup(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SvgPicture.asset(
                      'assets/images/undraw_welcome_cats_thqn.svg',
                      height: 150.0,
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: const [
                        AutofillHints.username,
                        AutofillHints.email,
                      ],
                      controller: emailField,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        label: const Text('Email'),
                        prefixIcon: const Icon(Icons.email_outlined),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      obscureText: isObscurePassword,
                      autofillHints: const [AutofillHints.password],
                      controller: passwordField,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        label: const Text('Password'),
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isObscurePassword = !isObscurePassword;
                            });
                          },
                          icon: Icon(
                            isObscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    ElevatedButton(
                      child: const Text('Login'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(15.0),
                      ),
                      onPressed: () async {
                        final message = await AuthService().signIn(
                          email: emailField.text,
                          password: passwordField.text,
                        );

                        if (message != 'success') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(message),
                            ),
                          );

                          return;
                        }
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const App(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10.0),
                    OutlinedButton(
                      child: const Text('Sign in with Google Account'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(15.0),
                      ),
                      onPressed: () async {
                        final String message =
                            await AuthService().signInWithGoogle();

                        if (message != 'success') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(message),
                            ),
                          );

                          return;
                        }
                      },
                    ),
                    const SizedBox(height: 10.0),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(15.0),
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      ),
                      child: const Text('New user? Register here'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailField.dispose();
    passwordField.dispose();

    super.dispose();
  }
}
