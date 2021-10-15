
// import 'package:flutter/material.dart';
// import 'package:udemy_flutter/shared/components/components.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   var emailController = TextEditingController();
//   var passwordController = TextEditingController();
//   var formKey = GlobalKey<FormState>();

//   bool isPassword = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: mainColor,
//       appBar: AppBar(
//         backgroundColor: buttonColor,
//         title: Text(
//           'LOGIN',
//           style: TextStyle(
//               color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: SingleChildScrollView(
//           child: Form(
//             key: formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Login to enjoy',
//                   style: TextStyle(
//                     fontSize: 30,
//                     color: Colors.blueGrey[600],
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 40.0,
//                 ),
//                 faultFormText(
//                   isObscureText: false,
//                   controller: emailController,
//                   keyboardType: TextInputType.emailAddress,
//                   validator: (String value) {
//                     if (value.isEmpty) {
//                       return 'check email field';
//                     } else {
//                       if (emailController.text !=
//                           "abdalla.taarek@gmail.com") {
//                         return 'email not Correct';
//                       }
//                     }
//                   },
//                   labelText: 'email',
//                   prefixIcon: Icons.email,
//                 ),
//                 SizedBox(
//                   height: 16.0,
//                 ),
//                 faultFormText(
//                     controller: passwordController,
//                     keyboardType: TextInputType.visiblePassword,
//                     validator: (String value) {
//                       if (value.isEmpty) {
//                         return 'check password field';
//                       } else {
//                         if (passwordController.text !=
//                             "123456") {
//                           return 'password not Correct';
//                         }
//                       }
//                     },
//                     labelText: "password",
//                     prefixIcon: Icons.lock,
//                     suffixIcon:
//                         isPassword ? Icons.visibility : Icons.visibility_off,
//                     isObscureText: isPassword,
//                     suffixPressed: () {
//                       setState(() {
//                         isPassword = !isPassword;
//                       });
//                     }),
//                 SizedBox(
//                   height: 32.0,
//                 ),
//                 defaultButton(
//                   function: () {
//                     if (formKey.currentState.validate()) {
//                       Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => BmiCalculator()));
//                     }
//                   },
//                   text: "login",
//                   backgrounColor: buttonColor,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "if you don't have accounr ?",
//                       style: TextStyle(
//                         color: Colors.blueGrey[400],
//                         fontSize: 14,
//                       ),
//                     ),
//                     TextButton(
//                       onPressed: () {},
//                       child: Text(
//                         'register now !',
//                         style: TextStyle(
//                           color: Colors.blueGrey[600],
//                           fontSize: 14,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }