import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 15.0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://scontent-hbe1-1.xx.fbcdn.net/v/t1.6435-9/134690694_2778211969082867_1661990642101561757_n.jpg?_nc_cat=103&ccb=1-3&_nc_sid=174925&_nc_ohc=AgPws7giGD8AX_QbnCt&_nc_ht=scontent-hbe1-1.xx&oh=816f1250d63cf3f6120c9f08ec0400db&oe=60BDFCF7'),
              radius: 20.0,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'chats',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22.0,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: CircleAvatar(
                radius: 18.0,
                backgroundColor: Colors.blue[100],
                child: Icon(
                  Icons.camera_enhance_outlined,
                  size: 17.0,
                  color: Colors.black,
                )),
            onPressed: () {},
          ),
          IconButton(
            icon: CircleAvatar(
              backgroundColor: Colors.blue[100],
              radius: 18.0,
              child: Icon(
                Icons.edit,
                size: 17,
                color: Colors.black,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text('Search'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                height: 100.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index)=>buildStoryItems(),
                  itemCount: 10,
                  separatorBuilder: (context, index)=>SizedBox(width: 15.0,),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index)=>buildChatItems(),
                separatorBuilder: (context, index)=>SizedBox(height:12.0),
                itemCount: 15,
                )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildChatItems()=>
   Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(
                  'https://scontent-hbe1-1.xx.fbcdn.net/v/t1.18169-9/12376375_1693389770898431_4932470743842552042_n.jpg?_nc_cat=108&ccb=1-3&_nc_sid=19026a&_nc_ohc=cj6mLt3RmowAX_0czka&_nc_ht=scontent-hbe1-1.xx&oh=962eeb99735bc8fd761a1c1ea8e3f5c2&oe=60BDCBD4'),
            ),
            CircleAvatar(
              radius: 7.0,
            ),
          ],
        ),
        SizedBox(
          width: 15.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Eslam Reda Elsayed',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Hello Mr.Eslam Elhawy Hello Mr.Eslam Elhawy Hello Mr.Eslam Elhawy',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
                  Text(
                    '.1:30 pm',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  

  Widget buildStoryItems()=>
     Container(
      width: 55.0,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                    'https://scontent-hbe1-1.xx.fbcdn.net/v/t1.6435-9/115806389_2641705852733480_7009697816905554621_n.jpg?_nc_cat=109&ccb=1-3&_nc_sid=8bfeb9&_nc_ohc=ld6Sj_N8qSsAX-m6PhS&_nc_ht=scontent-hbe1-1.xx&oh=4e2f94e9de1e01c97bbf9793dd376e27&oe=60BC8984'),
              ),
              CircleAvatar(
                radius: 7.0,
              ),
            ],
          ),
          SizedBox(
            height: 6.0,
          ),
          Text(
            'Eslam Elhawy Eslam Elhawy',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  
}
