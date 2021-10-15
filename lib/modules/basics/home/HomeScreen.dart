import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
        leading: Icon(Icons.menu),
        title:Text('Enjoy Test'),
        actions: [
          IconButton(
            icon:Icon(Icons.access_alarm_outlined),
           onPressed: (){print("adfsdf");}),
          IconButton(
            icon:Icon(Icons.notification_important_rounded),
           onPressed: () { print('dfaxczx'); },),
          IconButton(
            icon: Icon(Icons.add), 
          onPressed: () {  },),
        ],
      ),
      body:Column(
        children: 
        [
         
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(topStart:Radius.circular(50.0)),  
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image(
                    image:
                     NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5NAF5QQx55cwvvSODXX9xOXIL9t7cdsozsg&usqp=CAU'),
                     width:200.0 ,
                     height:200.0,
                     fit: BoxFit.cover,
                     ),
                     Container(
                       width:200.0 ,
                       color: Colors.blue[900],
                       padding: EdgeInsets.symmetric(vertical: 10.0,),
                       child: Text(
                         'This is Lion',
                         textAlign: TextAlign.center,
                         style:TextStyle(
                           fontSize:20.0,
                           fontWeight: FontWeight.bold,
                         ),
                         ),
                     ),
                ],
              ),
            ),
          ),
         
        ],
      ),
       
             
          
          
          
            
            
              
        
    );
  }
}
