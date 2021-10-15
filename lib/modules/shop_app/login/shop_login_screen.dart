import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/modules/shop_app/login/cuibt/cubit.dart';
import 'package:udemy_flutter/modules/shop_app/login/cuibt/states.dart';
import 'package:udemy_flutter/modules/shop_app/register/shop_register_screen.dart';
import 'package:udemy_flutter/shared/components/components.dart';
import 'package:udemy_flutter/shared/styles/colors.dart';

// ignore: must_be_immutable
class ShoLoginScreen extends StatelessWidget {

  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(BuildContext context)=>ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit,ShopLoginStates>
      ( 
        listener: (context,state){},
        builder:(context , state){
        return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: 
                      [
                        Text(
                          'LOGIN',
                          style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'login low to browse our hot offers',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                            validate: (String value)
                            {
                              if(value.isEmpty){
                                return 'email must not to be empty';
                              }
                            },
                            prefixIcon: Icons.email,
                              label: 'Email Address',
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              defaultFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                            validate: (String value)
                            {
                              if(value.isEmpty){
                                return 'password is too short';
                              }
                            },
                            prefixIcon: Icons.lock_open,
                            sufix: Icons.remove_red_eye_rounded,
                            sufixOnPressed:(){} ,
                            label: 'Password',
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                            ConditionalBuilder(
                              condition:state is! ShopLoginLoadingStates ,
                               builder: (context)=> defaultButton(
                                onPressed: ()
                                {
                                  if(formKey.currentState.validate())
                                  {
                                  ShopLoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                     password: passwordController.text,
                                     );
                                  }
                                },
                                text: 'LOGIN',
                                isUpperCase: true,
                                background: defaultColor,
                                ),
                               fallback: (context)=>Center(child: CircularProgressIndicator()),
                               ),
                               
                              SizedBox(
                                height: 15.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: 
                                [
                                  Text('Don\'t have an account?'),
                                  defaultTextButton(
                                    onPressed: ()
                                    {
                                      navigateTo(context, ShopRegisterScreen(),);
                                    },
                                    text: 'Register Now' ,
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      );
  }
}