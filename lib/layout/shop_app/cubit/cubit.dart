
import 'package:flutter/material.dart';
import 'package:udemy_flutter/layout/shop_app/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/models/user/shop_app/categories_model.dart';
import 'package:udemy_flutter/models/user/shop_app/change_favourites_model.dart';
import 'package:udemy_flutter/models/user/shop_app/favorites_model.dart';
import 'package:udemy_flutter/models/user/shop_app/home_model.dart';
import 'package:udemy_flutter/models/user/shop_app/login_model.dart';
import 'package:udemy_flutter/modules/shop_app/categories/categories_screen.dart';
import 'package:udemy_flutter/modules/shop_app/favourites/favourites_screen.dart';
import 'package:udemy_flutter/modules/shop_app/products/products.dart';
import 'package:udemy_flutter/modules/shop_app/settings/settings_screen.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/shared/network/end_points.dart';
import 'package:udemy_flutter/shared/network/remote/dio_helper.dart';

class ShopCubit extends Cubit<ShopStates>{
  ShopCubit() : super(ShopIntialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex=0;
  List<Widget> bottomScreens=[
    ProductsScreen(),
    CategoriesScreen(),
    FavouritesScreen(),
    SettingScreen()
  ];

  void changebottom(int index)
  {
    currentIndex=index;
    emit(ShopChangeBtNavState());
  }

  HomeClassModel homeModel;

  Map<int , bool> favorites={};

  void getHomeData()
  {
    emit(ShopLoadingHomeDataState());

    DioHelper.getData(
      url: HOME_DATA ,
      token: token,
      ).then((value) {
      homeModel=HomeClassModel.fromJson(value.data);
      homeModel.data.products.forEach((element) 
      {
        favorites.addAll({
          element.id : element.inFavorites,
        });
       });
       print(favorites.toString());
      emit(ShopSuccessHomeDataState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorHomeDataState());
    });
  } 

  CategoriesModel categoryModel;
  void getCategoriesData()
  {

    DioHelper.getData(
      url: GET_CATEGORIES ,
      token: token,
      ).then((value) {
      categoryModel=CategoriesModel.fromJson(value.data);
      emit(ShopSuccessCategoriesDataState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorCategoriesDataState());
    });
  } 

  FavoritesModel favouritesModel;
  void getFavouritesData()
  {
    emit(ShopLoadingGetFavoritesDataState());
    DioHelper.getData(
      url: FAVOURITES ,
      token: token,
      ).then((value) {
      favouritesModel=FavoritesModel.fromJson(value.data);
      emit(ShopSuccessGetFavoritesDataState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorGetFavoritesDataState());
    });
  } 

ChangeFavoritesModel changeFavouritesModel;

  void changeFavourites(int productId)
  {
    favorites[productId] = !favorites[productId];
    emit(ShopChangeFavoritesDataState());

    DioHelper.postData(
      url: FAVOURITES,
      data:
      {
        'product_id' : productId,
      } ,
      token: token,
       ).then((value)
        {
          changeFavouritesModel=ChangeFavoritesModel.fromJson(value.data);
         // print(value.data);
          if(!changeFavouritesModel.status)
          {
            favorites[productId] = !favorites[productId];
          }else
          {
            getFavouritesData();
          }
          
          emit(ShopSuccessChangeFavoritesDataState(changeFavouritesModel));
        }).catchError((error)
        {
          favorites[productId] = !favorites[productId];
          print(error.toString());
          emit(ShopErrorChangeFavoritesDataState());
        });
  }
   ShopLoginModel userModel;
  void getUserData()
  {
    emit(ShopLoadingUserDataState());
    DioHelper.getData(
      url: PROFIL ,
      token: token,
      ).then((value) {
      userModel=ShopLoginModel.fromJson(value.data);
      print(userModel.data.phone);
      emit(ShopSuccessUserDataState(userModel));
    }).catchError((error){
      printFullText(error.toString());
      emit(ShopErrorUserDataState());
    });
  } 

  void updateUserData({
    @required String name,
    @required String email,
    @required String phone,
  })
  {
    emit(ShopLoadingUpdateUserDataState());
    DioHelper.putData(
      url: UPDATE_PROFIL ,
      token: token, 
      data:
       {
         'name':name,
         'email':email,
         'phone':phone,
       },
      ).then((value) {
      userModel=ShopLoginModel.fromJson(value.data);
      print(userModel.data.phone);
      emit(ShopSuccessUpdateUserDataState(userModel));
    }).catchError((error){
      printFullText(error.toString());
      emit(ShopErrorUpdateUserDataState());
    });
  } 
}


