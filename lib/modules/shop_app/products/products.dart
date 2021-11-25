
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/shop_app/cubit/cubit.dart';
import 'package:udemy_flutter/layout/shop_app/cubit/states.dart';
import 'package:udemy_flutter/models/user/shop_app/categories_model.dart';
import 'package:udemy_flutter/models/user/shop_app/home_model.dart';
import 'package:udemy_flutter/shared/components/components.dart';
import 'package:udemy_flutter/shared/styles/colors.dart';


class ProductsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit , ShopStates>(
        listener: (context , state) 
        {
          if(state is ShopSuccessChangeFavoritesDataState)
          {
            if(!state.model.status)
            {
              showToast(
                text: state.model.message,
                 state: toastState.ERROR,
                 );
            }else 
            {
              showToast(
                text: state.model.message,
                 state: toastState.SUCCESS,
                 );
            }
          }
        },
         builder: (context , state) 
         {
           //var model = ShopCubit.get(context).homeModel;
           //var categoriesModel= ShopCubit.get(context).categoriesModel;
           return ConditionalBuilder(
             condition: ShopCubit.get(context).homeModel != null &&
              ShopCubit.get(context).categoryModel != null ,
              builder:(BuildContext context)=> builderWidget(ShopCubit.get(context).homeModel , ShopCubit.get(context).categoryModel ,context),
              fallback:(BuildContext context) => Center(child: CircularProgressIndicator(),) ,
              );
         },
         );
    
  }

  Widget builderWidget(HomeClassModel model , CategoriesModel categoryModel ,context) => SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'categories',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  Container(
                    height: 100.0,
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context , index)=>buildCategoryItem(categoryModel.data.data[index]),
                       separatorBuilder:(context , index)=> SizedBox(width: 10.0,),
                       itemCount: categoryModel.data.data.length,
                      ),
                  ),
                SizedBox(
                  height: 22.0,
                ),
                Text(
                  'New products',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
              ],
            ),
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
               (index) => buildGridProduct(model.data.products[index],context),
               ),
              
              ),
          ),

      ],
    ),
  );

  Widget buildCategoryItem(DataModel model)=>
   Container(
            height: 100.0,
            width: 100.0,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: 
              [
                Image(
                  image: NetworkImage(model.image),
                  height: 100.0,
                  width: 100.0,
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.7),
                    width: double.infinity,
                    child: Text(
                      model.name,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white
                      ),
                      ),
                  ),
              ],
            ),
          );

  Widget buildGridProduct(Product model , context)
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
                       '${model.price.round()}',
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
                       '${model.oldPrice.round()}',
                       style: TextStyle(
                         fontSize: 10.0,
                         color: Colors.grey,
                         decoration: TextDecoration.lineThrough,
                       ),
                     ),
                     Spacer(),
                     IconButton(
                       icon:CircleAvatar(
                         radius: 15.0,
                         backgroundColor:ShopCubit.get(context).favorites[model.id] ? Colors.red : Colors.grey,
                         child: Icon(
                           Icons.favorite_border,
                           color: Colors.white,
                           ),
                       ), 
                       onPressed: ()
                       {
                         ShopCubit.get(context).changeFavourites(model.id);
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