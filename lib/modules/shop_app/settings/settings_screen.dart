import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/shop_app/cubit/cubit.dart';
import 'package:udemy_flutter/layout/shop_app/cubit/states.dart';
import 'package:udemy_flutter/modules/shop_app/register/cuibt/cubit.dart';
import 'package:udemy_flutter/shared/components/components.dart';
import 'package:udemy_flutter/shared/components/constants.dart';

class SettingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var formKey= GlobalKey<FormState>();
    var nameController =TextEditingController();
    var emailController =TextEditingController();
    var phoneController =TextEditingController();
    return BlocConsumer<ShopCubit , ShopStates>(
      listener:(context, state){ },
      builder: (context, state)
      {

        var model = ShopCubit.get(context).userModel;
        nameController.text = model.data.name;
        emailController.text = model.data.email;
        phoneController.text = model.data.phone;

      return ConditionalBuilder(
        condition: ShopCubit.get(context).userModel != null,
        builder: (context) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                children: 
                [
                  if(state is ShopLoadingUpdateUserDataState) 
                  LinearProgressIndicator(),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultFormField(
                    controller: nameController,
                    type: TextInputType.name,
                    validate: (String value)
                    {
                      if(value.isEmpty)
                      {
                        return 'name must not be empty';
                      }
                      return null;
                    }, 
                    prefixIcon: Icons.person, 
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
                      if(value.isEmpty)
                      {
                        return 'email must not be empty';
                      }
                      return null;
                    }, 
                    prefixIcon: Icons.email_outlined, 
                    label: 'EmailAddress',
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultFormField(
                    controller: phoneController,
                    type: TextInputType.phone,
                    validate: (String value)
                    {
                      if(value.isEmpty)
                      {
                        return 'phone must not be empty';
                      }
                      return null;
                    }, 
                    prefixIcon: Icons.phone_android_sharp, 
                    label: 'Phone',
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    defaultButton(
                      onPressed: ()
                      {
                        if(formKey.currentState.validate())
                        {
                          ShopCubit.get(context).updateUserData(
                          name: nameController.text ,
                          email: emailController.text, 
                          phone: phoneController.text,
                          );
                        }
                        return null;
                        
                      }, 
                      text: 'UPDATE',
                      ),
                    SizedBox(
                      height: 25.0,
                    ),
                    defaultTextButton(
                      onPressed: ()
                      {
                        signOut(context);
                      }, 
                      text: 'LOGOUT',
                      ),
                ],
              ),
            ),
          ),
        ),
        fallback: (context) => Center(child: CircularProgressIndicator()),
      );
      }
    );
  }
}