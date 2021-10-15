import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/modules/shop_app/login/cuibt/states.dart';
import 'package:udemy_flutter/shared/cubit/states.dart';
import 'package:udemy_flutter/shared/network/end_points.dart';
import 'package:udemy_flutter/shared/network/remote/dio_helper.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>
{
  ShopLoginCubit() : super(ShopLoginIntialStates());


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
        emit(ShopLoginSuccessStates());
      }).catchError((error)
      {
        emit(ShopLoginErrorStates(error.toString()));
      });
  }
}