import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:space_pod/components/signin_button.dart';
import 'package:space_pod/screens/auth/singup/ui/signup.dart';
import 'package:space_pod/screens/home/ui/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Icon(
              Icons.lock,
              size: 100,
            ),
            const SizedBox(
              height: 50,
            ),
            Text('Welcome Back'),
            const SizedBox(
              height: 25,
            ),
            TextFieldController(
              controller: emailController,
              emailControll: true,
            ),
            SizedBox(
              height: 20,
            ),
            TextFieldController(
                controller: passController, emailControll: false),
            SizedBox(
              height: 10,
            ),
            TextActionClick(
              displayText: 'Forgot Password?',
              ActionText: 'Click Here',
            ),
            const SizedBox(
              height: 20,
            ),
            MySignInButton(
              text: 'Sign In',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              },
            ),

            SizedBox(
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

                  Text(

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

            SizedBox(
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

                SizedBox(

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

            SizedBox(

              height: 50,

            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 55),
              child: TextActionClick(


                onTap: () {

                  Navigator.push(context,

                      MaterialPageRoute(builder: (context) => SignUpPage()));

                },

                displayText: 'Dont have an account?',

                ActionText: 'Click Here',

              ),
            ),

          ],

        ),

      ),

    );

  }

}

class TextActionClick extends StatelessWidget {
  const TextActionClick({
    required this.ActionText,
    required this.displayText,
    this.onTap,
  });

  final String displayText;
  final String ActionText;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
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
                  style: TextStyle(
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
            suffixIcon:
                emailControll ? Icon(Icons.email) : Icon(Icons.password),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400))),
      ),
    );
  }
}
