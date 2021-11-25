

import 'package:udemy_flutter/models/user/shop_app/login_model.dart';
import 'package:udemy_flutter/models/user/shop_app/change_favourites_model.dart';



abstract class ShopStates{}

class ShopIntialState extends ShopStates{}

class ShopChangeBtNavState extends ShopStates{}

class ShopLoadingHomeDataState extends ShopStates{}

class ShopSuccessHomeDataState extends ShopStates{}

class ShopErrorHomeDataState extends ShopStates{
  // final String error;

  // ShopErrorHomeDataState(this.error);

}

class ShopSuccessCategoriesDataState extends ShopStates{}

class ShopErrorCategoriesDataState extends ShopStates{}

class ShopChangeFavoritesDataState extends ShopStates{}

class ShopSuccessGetFavoritesDataState extends ShopStates{}

class ShopErrorChangeFavoritesDataState extends ShopStates{}

class ShopLoadingGetFavoritesDataState extends ShopStates{}

class ShopSuccessChangeFavoritesDataState extends ShopStates
{
  final ChangeFavoritesModel  model;

  ShopSuccessChangeFavoritesDataState(this.model);

  }

class ShopErrorGetFavoritesDataState extends ShopStates{}


class ShopLoadingUserDataState extends ShopStates{}

class ShopSuccessUserDataState extends ShopStates
{
  final ShopLoginModel  loginmodel;

  ShopSuccessUserDataState(this.loginmodel);
}

class ShopErrorUserDataState extends ShopStates{}

class ShopLoadingUpdateUserDataState extends ShopStates{}

class ShopSuccessUpdateUserDataState extends ShopStates
{
  final ShopLoginModel  loginmodel;

  ShopSuccessUpdateUserDataState(this.loginmodel);
}

class ShopErrorUpdateUserDataState extends ShopStates{}






