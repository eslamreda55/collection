import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:udemy_flutter/layout/news_app/cubit/cubit.dart';
import 'package:udemy_flutter/layout/news_app/cubit/states.dart';
import 'package:udemy_flutter/layout/shop_app/cubit/cubit.dart';
import 'package:udemy_flutter/modules/news_app/webview_screen/webview_screen.dart';
import 'package:udemy_flutter/shared/styles/colors.dart';


Widget defaultButton({
  double width = double.infinity,
  Color background = defaultColor,
  @required Function onPressed,
  @required String text,
  bool isUpperCase = false,
  double raduis = 0.0,
  Null Function() function,
}) =>
    Container(
      width: width,
      height: 40.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(raduis),
        color: background,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );


Widget defaultTextButton({
  @required Function onPressed,
  @required String text,
})
=>TextButton(
  onPressed: onPressed,
  child: Text(text.toUpperCase()),
          // style: TextStyle(
          //   color:defaultColor,
          // ),
  );

  void showToast({
      @required String text,
      @required toastState state,
      
    })=>
     Fluttertoast.showToast(
      msg:text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 4,
      backgroundColor: chooseToastColor(state) ,
      textColor: Colors.white,
      fontSize: 16.0
      );

  enum toastState{SUCCESS,ERROR,WARNING}

  
  Color chooseToastColor(toastState state)
  {
    Color color;

    switch(state)
    {
      case toastState.SUCCESS:
      color= Colors.green;
      break;
      case toastState.ERROR:
        color= Colors.red;
        break;
      case toastState.WARNING:
        color= Colors.yellowAccent;
        break;
    }
    return color;

  }
      
Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  @required Function validate,
  @required IconData prefixIcon,
  @required String label,
  bool isPassword = false,
  //bool isClickable = false,
  IconData sufix,
  String hintText,
  Function onsubmited,
  Function onchange,
  Function onTab,
  Function sufixOnPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      validator: validate,
      obscureText: isPassword,
      //enabled:isClickable,
      onFieldSubmitted: onsubmited,
      onChanged: onchange,
      onTap: onTab,
      decoration: InputDecoration(
        suffixIcon: sufix != null
            ? IconButton(
                onPressed: sufixOnPressed,
                icon: Icon(sufix),
              )
            : null,
        prefixIcon: Icon(prefixIcon),
        labelText: label,
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );

Widget buildTaskItem(Map model) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40.0,
            child: Text('${model['time']}'),
          ),
          SizedBox(
            width: 20.0,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${model['title']}',
                style: TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${model['date']}',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ],
      ),
    );

Widget myDivider() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        color: Colors.grey[300],
        height: 1.0,
      ),
    );

Widget buildArticleItem( article,  context) => 
InkWell(
      onTap: () {
        navigateTo(context,WebViewScreen(article['url']));
      },
      child: 
      Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          children: [
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage('${article['urlToImage']}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Container(
                height: 100.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget articleBuilder(list , context,{isSearch = false}) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index], context),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: 15,
      ),
      fallback:(context)=> isSearch ? Container() : (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );



void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
  context,
   MaterialPageRoute(
        builder: (context) => widget,
      ), 
   (route) => false,

   );

Widget buildListProduct(model ,context , {bool isOldPrice = true})=>
  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 100.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
                   children: 
                   [
                     Stack( 
                       alignment: AlignmentDirectional.bottomStart,
                       children: [
                         Image(
                           image: NetworkImage(model.image),
                           height: 100.0,
                           width: 100.0,
                           ),
                           if(model.discount !=0 && isOldPrice)
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
                     SizedBox(
                       width: 20.0,
                     ),
                       Expanded(
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
                         Spacer(),
                         Row(
                           children: 
                           [
                             Text(
                           model.price.toString(),
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
                         if(model.discount != 0 && isOldPrice)
                         Text(
                           model.oldPrice.toString(),
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
                 ),
      ),
    );





// Widget project(context , isSearch)
// { 

//   if (isSearch==true)
//   {
//     return Container();

//   }else
//   {
//     return Center(
//         child: CircularProgressIndicator(),
//       );
//    }
// }
