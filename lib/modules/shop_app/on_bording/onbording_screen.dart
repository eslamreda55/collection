import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:udemy_flutter/modules/shop_app/login/shop_login_screen.dart';
import 'package:udemy_flutter/shared/components/components.dart';
import 'package:udemy_flutter/shared/styles/colors.dart';

class BoardingModel
{
  final String image;
  final String title;
  final String body;

  BoardingModel({
    @required this.image, 
    @required this.title, 
    @required this.body
    });
}

// ignore: must_be_immutable
class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();
  bool isLast=false;

  List<BoardingModel> boarding =[
    BoardingModel(
      image: 'assets/images/onbording1.jpg',
     title: 'On Bord1 title',
      body: 'On Bord1 body',
      ),
       BoardingModel(
      image: 'assets/images/onbording2.jpg',
     title: 'On Bord2 title',
      body: 'On Bord2 body',
      ),
       BoardingModel(
      image: 'assets/images/onbording3.jpg',
     title: 'On Bord3 title',
      body: 'On Bord3 body',
      )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: 
        [
          defaultTextButton(
            onPressed:()
            {
               navigateAndFinish(context, ShoLoginScreen(),);
            },
             text: 'SKIP',
             ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                onPageChanged: (int index)
                {
                  if(index==boarding.length-1)
                  {
                    setState(() {
                        isLast=true;               
                    });
                  }else
                  {
                    setState(() {
                      isLast=false;                    
                     });
                  }
                },
                controller: boardController,
                itemBuilder: (context , index) => buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
                height: 30.0,
                ),
             Row(
              children: 
              [
                SmoothPageIndicator(
                  controller: boardController,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.blue,
                    activeDotColor: defaultColor,
                    dotHeight: 10.0,
                    dotWidth: 10.0,
                    spacing: 5.0,
                    expansionFactor: 4.0,
                    
                  ),
                   count: boarding.length,

                   ),
                Spacer(),
                FloatingActionButton(
                  child: Icon(Icons.arrow_forward_ios),
                  onPressed: ()
                  {
                    if(isLast)
                    {
                      navigateAndFinish(context, ShoLoginScreen(),);
                    }else
                    {
                       boardController.nextPage(
                      duration: Duration(
                        milliseconds: 500,
                      ),
                       curve: Curves.fastLinearToSlowEaseIn,
                       );
                    } 
                  }
                  ),
              ],
            ),
          ],
        ),
      ),
     
      
    );
  }

  Widget buildBoardingItem(BoardingModel model) => 
  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: 
        [
         Expanded(
           child: Image(
             image: AssetImage('${model.image}'),
             ),
         ),
           SizedBox(
             height: 30.0,
           ),
           Text(
             '${model.title}',
             style: TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 25.0,
             ),
             ),
             SizedBox(
             height: 25.0,
           ),
           Text(
             '${model.body}',
             style: TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 14.0,
             ),
             ),
              SizedBox(
               height: 30.0,
              ),
        ],
      );
}
