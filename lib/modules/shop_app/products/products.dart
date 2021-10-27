import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/shop_app/cubit/cubit.dart';
import 'package:udemy_flutter/layout/shop_app/cubit/states.dart';
import 'package:udemy_flutter/models/user/shop_app/home_model.dart';
import 'package:udemy_flutter/shared/styles/colors.dart';

class ProductsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit , ShopStates>(
        listener: (context , state) {},
         builder: (context , state) 
         {
           var model = ShopCubit.get(context).homeModel;
           return ConditionalBuilder(
             condition: model != null,
              builder:(context)=> builderWidget(model),
              fallback:(context) => Center(child: CircularProgressIndicator()) ,
              );
         },
         );
    
  }

  Widget builderWidget(HomeClassModel model) => SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Column(
      children: 
      [
        CarouselSlider(
          items:model.data.banners.map((e) => Image(
              image: NetworkImage('${e.image}'),
              width: double.infinity,
              fit: BoxFit.cover,
              )
               ).toList(), 
          options: CarouselOptions(
            height: 250.0,
            initialPage: 1,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(seconds: 1),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,
            viewportFraction: 1,
          ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            //color: Colors.grey[300],
            child: GridView.count(
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              childAspectRatio: 1/1.68,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              children:List.generate(
                model.data.products.length,
               (index) => buildGridProduct(model.data.products[index]),
               ),
              
              ),
          ),

      ],
    ),
  );

  Widget buildGridProduct(Products model)
  {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
               children: 
               [
                 Stack(
                   alignment: AlignmentDirectional.bottomStart,
                   children: [
                     Image(
                       image: NetworkImage(model.image),
                       width: double.infinity,
                       height: 200.0,
                       ),
                       if(model.discount !=0)
                       Container(
                         color:  Colors.red,
                         padding: EdgeInsets.symmetric(
                           horizontal: 5.0,
                         ),
                         child: Text(
                           'DISCOUNT',
                           style: TextStyle(
                             fontSize: 9.0,
                              color: Colors.white,
                           ),
                           ),
                       ),
                   ],
                 ),
                   Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: 
                       [
                         Text(
                       model.name,
                       maxLines: 2,
                       overflow: TextOverflow.ellipsis,
                       style: TextStyle(
                         fontSize: 13.0
                       ),
                     ),
                     Row(
                       children: 
                       [
                         Text(
                       '${model.price}',
                       maxLines: 2,
                       overflow: TextOverflow.ellipsis,
                       style: TextStyle(
                         fontSize: 13.0,
                         color: defaultColor,
                       ),
                     ),
                     SizedBox(
                       width: 7.0,
                     ),
                     if(model.discount != 0)
                     Text(
                       '${model.oldPrice}',
                       style: TextStyle(
                         fontSize: 10.0,
                         color: Colors.grey,
                         decoration: TextDecoration.lineThrough,
                       ),
                     ),
                     Spacer(),
                     IconButton(
                       icon:Icon(
                         Icons.favorite_border,
                         ), 
                       onPressed: ()
                       {

                       }
                       ),
                       ],
                     ),
                       ],
                     ),
                   ),
               ],
             );
  }
  
 
}