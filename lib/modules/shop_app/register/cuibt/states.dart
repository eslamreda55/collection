
import 'package:udemy_flutter/models/user/shop_app/login_model.dart';

abstract class ShopRegisterStates {} 

class ShopRegisterIntialStates extends ShopRegisterStates {} 

class ShopRegisterLoadingStates extends ShopRegisterStates {} 

class ShopRegisterSuccessStates extends ShopRegisterStates
{
  final ShopLoginModel loginModel;

  ShopRegisterSuccessStates(this.loginModel);
} 

class ShopRegisterErrorStates extends ShopRegisterStates {

  final String error;

  ShopRegisterErrorStates(this.error);
  } 

  class ShopRegisterChangePasswordVisibilityStates extends ShopRegisterStates {} 