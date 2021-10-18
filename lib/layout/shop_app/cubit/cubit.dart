import 'package:udemy_flutter/layout/shop_app/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopCubit extends Cubit<ShopStates>{
  ShopCubit() : super(ShopIntialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex=0;
}