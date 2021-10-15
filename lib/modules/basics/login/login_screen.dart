import 'package:flutter/material.dart';
import 'package:udemy_flutter/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  defaultFormField(
                    controller: emailController,
                    label: 'Email Adress',
                    prefixIcon: Icons.email_outlined,
                    type: TextInputType.emailAddress,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'Enter Your Email Adress';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 11.0,
                  ),
                  defaultFormField(
                    controller: passwordController,
                    isPassword: isPassword,
                    sufix:  isPassword? Icons.visibility_sharp : Icons.visibility_off,
                    sufixOnPressed: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    label: 'Email Adress',
                    prefixIcon: Icons.lock,
                    type: TextInputType.visiblePassword,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your Password';
                      }
                    },
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  defaultButton(
                    text: 'login',
                    isUpperCase: true,
                    raduis: 12.0,
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        print(emailController.text);
                        print(passwordController.text);
                      }
                    },
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?'),
                      SizedBox(
                        width: 3.0,
                      ),
                      TextButton(onPressed: () {}, child: Text('Register Now')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
