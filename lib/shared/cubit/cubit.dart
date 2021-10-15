import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:udemy_flutter/modules/todo_app/archived_tasks/archived_tasks_screen.dart';
import 'package:udemy_flutter/modules/todo_app/done_tasks/done_tasks_screen.dart';
import 'package:udemy_flutter/modules/todo_app/new_tasks/new_tasks_screen.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/shared/cubit/states.dart';
import 'package:udemy_flutter/shared/network/local/cashe_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];

  List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBtNavBar());
  }

  Database database;
  List<Map> tasks = [];

  void createDatabase() {
    openDatabase(
      'ToDo.db',
      version: 1,
      onCreate: (database, version) async {
        print('DataBase Is Created');
        await database
            .execute(
                'CREATE TABLE tasks (id INTEGER PRIMARY KEY , title TEXT , date TEXT , time TEXT , status TEXT)')
            .then((value) {
          print('table created successfully');
        }).catchError((onError) {
          print('Error is ${onError.toString()}');
        });
      },
      onOpen: (database) {
        getDataFromDatabase(database).then((value) {
          tasks = value;
          print(tasks);
          emit(AppGetDatabaseState());
        });
        print('DataBase Is Opened');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  insertDatabase({
    @required String title,
    @required String time,
    @required String date,
  }) async {
    // ignore: missing_return
    await database.transaction((txn) {
      txn
          .rawInsert(
        'INSERT INTO tasks (title , date , time , status) VALUES("$title","$date","$time","hello MR.Eslam")',
      )
          .then((value) {
        print('$value Inserted Success');
        emit(AppInsertDatabaseState());
        getDataFromDatabase(database).then((value) {
          tasks = value;
          print(tasks);
          emit(AppGetDatabaseState());
        });
      }).catchError((onError) {
        print('Error is ${onError.toString()}');
      });
    });
  }

  Future<List<Map>> getDataFromDatabase(database) async {
    emit(AppGetDatabaseLoadingState());
    return await database.rawQuery('SELECT * FROM tasks');
  }

  IconData favicon = Icons.edit;
  bool isBottomShowing = false;

  void changeBtSheetState({
    @required bool isShow,
    @required IconData icon,
  }) {
    isBottomShowing = isShow;
    favicon = icon;
    emit(AppChangeBtSheetState());
  }

  bool isDark = false;

  void changeAppMode({bool fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeThemeModeState());
    } else {
      isDark = !isDark;
      CasheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeThemeModeState());
      });
    }
  }
}
