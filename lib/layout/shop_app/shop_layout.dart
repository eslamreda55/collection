import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:udemy_flutter/shared/components/components.dart';
import 'package:udemy_flutter/shared/network/local/cashe_helper.dart';
import 'package:udemy_flutter/modules/shop_app/login/shop_login_screen.dart';


class ShopLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Salla',
          ),
      ),
      body: TextButton(
        onPressed: ()
        {
          CasheHelper.removeData(key: 'token').then((value) 
          {
            if(value)
            {
              navigateAndFinish(context, ShopLoginScreen(),);
            }
          }
          );
        },
       child: Text(
         'SIGN OUT',
         ),
         ),
    );
  }
}