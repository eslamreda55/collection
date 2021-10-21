import 'package:flutter/material.dart';
import 'package:udemy_flutter/layout/shop_app/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/models/user/shop_app/home_model.dart';
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

  HomeModel homeModel;
  void getHomeData()
  {
    emit(ShopLoadingHomeDataState());

    DioHelper.getData(
      url: Home,
      token: token,
      ).then((value) {

      homeModel=HomeModel.fromJson(value.data);
      printFullText(homeModel.data.banners[0].image);
      print(homeModel.status);
      printFullText(homeModel.toString());

      emit(ShopSuccessHomeDataState());
    }).catchError((error){
      emit(ShopErrorHomeDataState(error.toString()));
    });
  }
}