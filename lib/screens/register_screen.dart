import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                      'assets/images/undraw_authentication_fsn5.svg',
                      height: 150.0,
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: const [
                        AutofillHints.email,
                        AutofillHints.newUsername,
                      ],
                      controller: emailField,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        label: const Text('New email'),
                        prefixIcon: const Icon(Icons.email_outlined),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      obscureText: isObscurePassword,
                      autofillHints: const [AutofillHints.newPassword],
                      controller: passwordField,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        label: const Text('New password'),
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
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(15.0),
                      ),
                      onPressed: () async {
                        final message = await AuthService().createAccount(
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
                        Navigator.popUntil(context, (route) => route.isFirst);
                      },
                      child: const Text('Register'),
                    ),
                    const SizedBox(height: 10.0),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(15.0),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Already have an account? Login here'),
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
