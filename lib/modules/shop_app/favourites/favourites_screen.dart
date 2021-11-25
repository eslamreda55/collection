import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/shop_app/cubit/cubit.dart';
import 'package:udemy_flutter/layout/shop_app/cubit/states.dart';
import 'package:udemy_flutter/models/user/shop_app/favorites_model.dart';
import 'package:udemy_flutter/shared/components/components.dart';
import 'package:udemy_flutter/shared/styles/colors.dart';

class FavouritesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<ShopCubit , ShopStates>(
         listener:(context, state){},
         builder: (context, state)
          {
            return ConditionalBuilder(
              condition: state is! ShopLoadingGetFavoritesDataState,
               builder: (context) =>ListView.separated(
                itemCount: ShopCubit.get(context).favouritesModel.data.data.length,
                separatorBuilder: (BuildContext context, int index) => myDivider(),
                itemBuilder: (BuildContext context, int index) => buildListProduct(ShopCubit.get(context).favouritesModel.data.data[index].product ,context),
                 ),
                 fallback:(context) => Center(child: CircularProgressIndicator()),
               );
            }
         ),
    );
  }
  }