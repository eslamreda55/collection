import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/shop_app/cubit/cubit.dart';
import 'package:udemy_flutter/layout/shop_app/cubit/states.dart';
import 'package:udemy_flutter/models/user/shop_app/categories_model.dart';
import 'package:udemy_flutter/shared/components/components.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<ShopCubit , ShopStates>(
         listener:(context, states){},
         builder: (context, states) => ListView.separated(
          itemCount: ShopCubit.get(context).categoryModel.data.data.length,
          separatorBuilder: (BuildContext context, int index) => myDivider(),
          itemBuilder: (BuildContext context, int index) => buildCategoryItem(ShopCubit.get(context).categoryModel.data.data[index]),
        ),
         ),
    );
  }

  Widget buildCategoryItem(DataModel model)=>
  Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: 
          [
            Image(
              image: NetworkImage(model.image),
              height: 80.0,
              width: 80.0,
            ),
            SizedBox(
              width: 20.0,
            ),
            Text(
              model.name,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios_rounded
              ),
          ],
        ),
      );
}