import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/shop_app/shop_layout.dart';
import 'package:udemy_flutter/modules/shop_app/login/cuibt/cubit.dart';
import 'package:udemy_flutter/modules/shop_app/login/cuibt/states.dart';
import 'package:udemy_flutter/modules/shop_app/register/cuibt/cubit.dart';
import 'package:udemy_flutter/modules/shop_app/register/cuibt/states.dart';
import 'package:udemy_flutter/shared/components/components.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/shared/network/local/cashe_helper.dart';

class ShopRegisterScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var nameController=TextEditingController();
  var phoneController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit , ShopRegisterStates>(
        listener:(context,state) 
        {
          if(state is ShopRegisterSuccessStates)
          {
            if(state.loginModel.status)
            {
              print(state.loginModel.message);
              print(state.loginModel.data.token);
              showToast(
              text: state.loginModel.message,
              state: toastState.SUCCESS,
              );

              CasheHelper.saveData(
                key: 'token',
                 value: state.loginModel.data.token)
                 .then((value) {
                   token=state.loginModel.data.token;
                   navigateAndFinish(context, ShopLayout(),);
                 });

            }else
            {
              print(state.loginModel.message);

              showToast(
              text: state.loginModel.message,
              state: toastState.ERROR,
              );
            }
          }
        } ,
        builder:(context , state)
        {
          return Scaffold(
          appBar: AppBar(
            title: Text("REGISTER"),
          ),
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
                              'REGISTER',
                              style: Theme.of(context).textTheme.headline4.copyWith(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Register low to browse our hot offers',
                              style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            defaultFormField(
                              controller: nameController,
                              type: TextInputType.name,
                                validate: (String value)
                                {
                                  if(value.isEmpty){
                                    return 'name must not to be empty';
                                  }
                                },
                                prefixIcon: Icons.person_add_alt,
                                  label: 'User Name',
                                  ),
                                  SizedBox(
                                    height: 20.0,
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
                                    isPassword: ShopRegisterCubit.get(context).isPassword,
                                    onsubmited: (value)
                                    {
                                     
                                    },
                                    prefixIcon: Icons.lock_open,
                                    sufix:ShopRegisterCubit.get(context).suffix,
                                    sufixOnPressed:()
                                    {
                                      ShopRegisterCubit.get(context).changeSuffixPassword();
                                    } ,
                                    label: 'Password',
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  defaultFormField(
                              controller: phoneController,
                              type: TextInputType.phone,
                                validate: (String value)
                                {
                                  if(value.isEmpty){
                                    return 'phone must not to be empty';
                                  }
                                },
                                prefixIcon: Icons.phone,
                                  label: 'Phone Number',
                                  ),
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                ConditionalBuilder(
                                  condition:state is! ShopRegisterLoadingStates ,
                                   builder: (context)=> defaultButton(
                                    onPressed: ()
                                    {
                                      if(formKey.currentState.validate())
                                      {
                                      ShopRegisterCubit.get(context).userRegister(
                                        email: emailController.text,
                                         password: passwordController.text,
                                         name: nameController.text,
                                         phone: phoneController.text,
                                         );
                                      }
                                    },
                                    text: 'REGISTER',
                                    isUpperCase: true,
                                    ),
                                   fallback: (context)=>Center(child: CircularProgressIndicator()),
                                   ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        );
        }
      ),
    );
  }
}