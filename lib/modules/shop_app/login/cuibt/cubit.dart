import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/models/user/shop_app/login_model.dart';
import 'package:udemy_flutter/modules/shop_app/login/cuibt/states.dart';
import 'package:udemy_flutter/shared/cubit/states.dart';
import 'package:udemy_flutter/shared/network/end_points.dart';
import 'package:udemy_flutter/shared/network/remote/dio_helper.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>
{
  ShopLoginCubit() : super(ShopLoginIntialStates());

  ShopLoginModel loginModel;


  static ShopLoginCubit get(context) => BlocProvider.of(context);
  
  void userLogin({
    @required String email,
    @required String password,

  })
  {

    emit(ShopLoginLoadingStates());

    DioHelper.postData(
      url: LOGIN , 
      data:
      {
        'email':email,
        'password':password,
      },
      ).then((value)
      {
        print(value.data);
        loginModel=ShopLoginModel.fromJson(value.data);
        emit(ShopLoginSuccessStates(loginModel));
      }).catchError((error)
      {
        print(error.toString());
        emit(ShopLoginErrorStates(error.toString()));
      });
  }

  IconData suffix= Icons.remove_red_eye_rounded;

  bool isPassword=true;

  void changeSuffixPassword()
  {
    
    isPassword = !isPassword;

    suffix= isPassword ?  Icons.remove_red_eye_rounded : Icons.visibility_off_outlined ;
    emit(ShopChangePasswordVisibilityStates());
  }
}