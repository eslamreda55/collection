import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/models/user/shop_app/login_model.dart';
import 'package:udemy_flutter/modules/shop_app/register/cuibt/states.dart';
import 'package:udemy_flutter/shared/network/end_points.dart';
import 'package:udemy_flutter/shared/network/remote/dio_helper.dart';


class ShopRegisterCubit extends Cubit<ShopRegisterStates>
{
  ShopRegisterCubit() : super(ShopRegisterIntialStates());

  ShopLoginModel loginModel;


  static ShopRegisterCubit get(context) => BlocProvider.of(context);
  
  void userRegister({
    @required String email,
    @required String password,
    @required String name,
    @required String phone,

  })
  {

    emit(ShopRegisterLoadingStates());

    DioHelper.postData(
      url: REGISTER , 
      data:
      {
        'email':email,
        'password':password,
        'name':name,
        'phone':phone,
        
      },
      ).then((value)
      {
        print(value.data);
        loginModel=ShopLoginModel.fromJson(value.data);
        emit(ShopRegisterSuccessStates(loginModel));
      }).catchError((error)
      {
        print(error.toString());
        emit(ShopRegisterErrorStates(error.toString()));
      });
  }

  IconData suffix= Icons.remove_red_eye_rounded;

  bool isPassword=true;

  void changeSuffixPassword()
  {
    
    isPassword = !isPassword;

    suffix= isPassword ?  Icons.remove_red_eye_rounded : Icons.visibility_off_outlined ;
    emit(ShopRegisterChangePasswordVisibilityStates());
  }
}