import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/shop_app/cubit/cubit.dart';
import 'package:udemy_flutter/layout/shop_app/cubit/states.dart';
import 'package:udemy_flutter/modules/shop_app/search/search_screen.dart';
import 'package:udemy_flutter/shared/components/components.dart';
import 'package:udemy_flutter/shared/network/local/cashe_helper.dart';
import 'package:udemy_flutter/modules/shop_app/login/shop_login_screen.dart';


class ShopLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit , ShopStates>(
      listener: (context , state){},
      builder: (context , state)
      {
        var cubit=ShopCubit.get(context);
        return  Scaffold(
        appBar: AppBar(
          title: Text(
            'Salla',
            ),
            actions: 
            [
              IconButton(
                icon: Icon(Icons.search), 
                onPressed:()
                {
                  navigateTo(context, SearchScreen());
                } ,
                )
            ],
        ),
        body:cubit.homeModel == null ? Center (child: CircularProgressIndicator()) : 
        cubit.bottomScreens[cubit.currentIndex],
        
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index)
          {
            cubit.changebottom(index);
          },
          currentIndex:cubit.currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category_rounded),
              label: 'categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'favourit',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'settings',
            ),
          ],
          ),
        
      );
      },
    );
  }
}