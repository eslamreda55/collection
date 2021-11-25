

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/models/user/shop_app/search_model.dart';
import 'package:udemy_flutter/modules/shop_app/search/cubit/states.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/shared/network/remote/dio_helper.dart';
import 'package:udemy_flutter/shared/network/end_points.dart';

class SearchCubit extends Cubit<SearchStates>{
  SearchCubit() : super(SearchIntialState());
  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel searchModel;
  void search(String text)
  {
    emit(SearchLoadingState());
    DioHelper.postData(
      url: SEARCH, 
      token: token,
      data: 
      {
        'text':text ,
      },
      
      ).then((value) 
      {
        searchModel=SearchModel.fromJson(value.data);
        emit(SearchSuccessState());
      }).catchError((error)
      {
        print(error.toString());
        emit(SearchErrorState());
      });
  }
}