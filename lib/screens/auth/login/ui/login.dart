import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_pod/components/signin_button.dart';
import 'package:space_pod/screens/auth/login/bloc/auth_log_bloc.dart';
import 'package:space_pod/screens/auth/singup/bloc/auth_sign_bloc.dart';
import 'package:space_pod/screens/auth/singup/ui/signup.dart';
import 'package:space_pod/screens/home/ui/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passController = TextEditingController();
    AuthLogBloc authLogBloc = AuthLogBloc();

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            return BlocListener<AuthLogBloc, AuthLogState>(
              listener: (context, state) {
                if (state is AuthLogSuccessState) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => MyHomePage(
                            authLogBloc: AuthLogBloc(),
                          )));
                }
                if (state is AuthLogErrorState) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.error)));
                }

              },
              child: BlocBuilder<AuthLogBloc, AuthLogState>(
                builder: (context, state) {
                  if (state is AuthLogLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.grey.shade600,
                      ),
                    );
                  }
                  if (state is AuthLogInitial) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          const Icon(
                            Icons.lock,
                            size: 100,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          const Text('Welcome Back'),
                          const SizedBox(
                            height: 25,
                          ),
                          TextFieldController(
                            controller: emailController,
                            emailControll: true,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFieldController(
                              controller: passController, emailControll: false),
                          const SizedBox(
                            height: 10,
                          ),
                          const TextActionClick(
                            displayText: 'Forgot Password?',
                            ActionText: 'Click Here',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          MySignInButton(
                            text: 'Sign In',
                            onTap: () {
                              authLogBloc.add(SignInButtonClickedEvent(
                                  email: emailController.text,
                                  password: passController.text));
                            },
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    thickness: 0.5,
                                    color: Colors.grey[400],
                                  ),
                                ),
                                const Text(
                                  "Or Sign In with",
                                ),
                                Expanded(
                                  child: Divider(
                                    thickness: 0.5,
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 29,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Image.asset(
                                  'assets/google.png',
                                  height: 40,
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Container(
                                child: Image.asset(
                                  'assets/apple.png',
                                  height: 40,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 55),
                            child: TextActionClick(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BlocProvider(
                                      create: (context) => AuthSignBloc(),
                                      child: const SignUpPage(),
                                    ),
                                  ),
                                );
                              },
                              displayText: 'Dont have an account?',
                              ActionText: 'Click Here',
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (state is AuthLogErrorState) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.error)));
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          const Icon(
                            Icons.lock,
                            size: 100,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          const Text('Welcome Back'),
                          const SizedBox(
                            height: 25,
                          ),
                          TextFieldController(
                            controller: emailController,
                            emailControll: true,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFieldController(
                              controller: passController, emailControll: false),
                          const SizedBox(
                            height: 10,
                          ),
                          const TextActionClick(
                            displayText: 'Forgot Password?',
                            ActionText: 'Click Here',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          MySignInButton(
                            text: 'Sign In',
                            onTap: () {
                              authLogBloc.add(SignInButtonClickedEvent(
                                  email: emailController.text,
                                  password: passController.text));

                              emailController.clear();
                              passController.clear();
                            },
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    thickness: 0.5,
                                    color: Colors.grey[400],
                                  ),
                                ),
                                const Text(
                                  "Or Sign In with",
                                ),
                                Expanded(
                                  child: Divider(
                                    thickness: 0.5,
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 29,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Image.asset(
                                  'assets/google.png',
                                  height: 40,
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Container(
                                child: Image.asset(
                                  'assets/apple.png',
                                  height: 40,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 55),
                            child: TextActionClick(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BlocProvider(
                                      create: (context) => AuthSignBloc(),
                                      child: const SignUpPage(),
                                    ),
                                  ),
                                );
                              },
                              displayText: 'Dont have an account?',
                              ActionText: 'Click Here',
                            ),
                          ),
                        ],
                      ),
                    );

                  }
                  else{
                    return Container();
                  }
                },
              ),
            );
          }),
    );
  }
}

class TextActionClick extends StatelessWidget {
  const TextActionClick({
    super.key,
    required this.ActionText,
    required this.displayText,
    this.onTap,
  });

  final String displayText;
  final String ActionText;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(displayText),
            Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Text(
                ActionText,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldController extends StatelessWidget {
  const TextFieldController({
    super.key,
    required this.controller,
    required this.emailControll,
  });

  final TextEditingController controller;
  final bool emailControll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade200,
            labelText: emailControll ? "Email" : "Password",
            suffixIcon: emailControll
                ? const Icon(Icons.email)
                : const Icon(Icons.password),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400))),
      ),
    );
  }
}
