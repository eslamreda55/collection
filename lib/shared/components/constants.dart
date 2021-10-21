//https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=API_KEY

//https://newsapi.org/v2/everything?q=tesla&apiKey=7db2b261d772400ba9ade18d100454fc

import 'package:udemy_flutter/modules/shop_app/login/shop_login_screen.dart';
import 'package:udemy_flutter/shared/components/components.dart';
import 'package:udemy_flutter/shared/network/local/cashe_helper.dart';

void signOut(context)
{
   CasheHelper.removeData(key: 'token').then((value) 
            {
              if(value)
              {
                navigateAndFinish(context, ShopLoginScreen(),);
              }
            }
            );
}

void printFullText(String text)
{
  final pattern=RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match)=>print(match.group(0)));
}

String token='';