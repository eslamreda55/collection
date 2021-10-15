import 'package:flutter/material.dart';
import 'package:udemy_flutter/models/user/user_model.dart';


// ignore: must_be_immutable
class UsersScreen extends StatelessWidget {
  List<UserModel> users = [
    UserModel(
      id: 1,
      age: 23,
      name: 'John',
      phone: 00000222221,
    ),
    UserModel(
      id: 2,
      age: 26,
      name: 'max',
      phone: 11111222221,
    ),
    UserModel(
      id: 3,
      age: 28,
      name: 'Anne',
      phone: 88888222221,
    ),
    UserModel(
      id: 4,
      age: 27,
      name: 'Eslam',
      phone: 99977222221,
    ),
    UserModel(
      id: 1,
      age: 23,
      name: 'John',
      phone: 00000222221,
    ),
    UserModel(
      id: 2,
      age: 26,
      name: 'max',
      phone: 11111222221,
    ),
    UserModel(
      id: 3,
      age: 28,
      name: 'Anne',
      phone: 88888222221,
    ),
    UserModel(
      id: 4,
      age: 27,
      name: 'Eslam',
      phone: 99977222221,
    ),
    UserModel(
      id: 1,
      age: 23,
      name: 'John',
      phone: 00000222221,
    ),
    UserModel(
      id: 2,
      age: 26,
      name: 'max',
      phone: 11111222221,
    ),
    UserModel(
      id: 3,
      age: 28,
      name: 'Anne',
      phone: 88888222221,
    ),
    UserModel(
      id: 4,
      age: 27,
      name: 'Eslam',
      phone: 99977222221,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => buildUserItem(users[index]),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 15.0,
          ),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.blueGrey[100],
          ),
        ),
        itemCount: users.length,
      ),
    );
  }

  Widget buildUserItem(UserModel users) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              child: Text(
                '${users.id}',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              width: 15.0,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${users.name}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${users.phone}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
