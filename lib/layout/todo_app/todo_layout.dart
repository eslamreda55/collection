import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:udemy_flutter/shared/components/components.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/shared/cubit/cubit.dart';
import 'package:udemy_flutter/shared/cubit/states.dart';
import 'package:udemy_flutter/shared/cubit/states.dart';
import 'package:udemy_flutter/shared/cubit/states.dart';
import 'package:udemy_flutter/shared/cubit/states.dart';

// ignore: must_be_immutable
class HomeLayout extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var timeController = TextEditingController();
  var titleController = TextEditingController();
  var dateController = TextEditingController();

  //AppCubit cubit = AppCubit.get(context);

  //Future<String> getname() async => 'Eslam Elhawy';

  @override
  Widget build(BuildContext context) {
    //AppCubit cubit = AppCubit.get(context);
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer <AppCubit,AppStates>(
        listener: (context, state) {
          if (state is AppInsertDatabaseState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentIndex]),
            ),
            body: Center(
              child: ConditionalBuilder(
                condition: state is! AppGetDatabaseLoadingState,
                builder: (context) => cubit.screens[cubit.currentIndex],
                fallback: (context) =>
                    Center(child: CircularProgressIndicator()),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isBottomShowing) {
                  if (formKey.currentState.validate()) {
                    cubit.insertDatabase(
                      title: titleController.text,
                      time: timeController.text,
                      date: dateController.text,
                    );
                    // cubit.insertDatabase(
                    //   date: dateController.text,
                    //   time: timeController.text,
                    //   title: titleController.text,
                    // ).then((value) {
                    //   getDataFromDatabase(database).then((value) {
                    //     Navigator.pop(context);
                    //     setState(() {
                    //       isBottomShowing = false;
                    //       favicon = Icons.edit;
                    //       tasks = value;
                    //       print(tasks);
                    //     });
                    //   });
                    // });
                  }
                } else {
                  scaffoldKey.currentState
                      .showBottomSheet(
                        (context) => Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(20.0),
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                defaultFormField(
                                  controller: titleController,
                                  type: TextInputType.text,
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return ('Please Insert The Title');
                                    }
                                    return null;
                                  },
                                  prefixIcon: Icons.text_fields,
                                  label: 'Title',
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                defaultFormField(
                                  controller: timeController,
                                  type: TextInputType.datetime,
                                  onTab: () {
                                    showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then((value) {
                                      timeController.text =
                                          value.format(context).toString();
                                    }).catchError((onError) {
                                      print('error is ${onError.toString()}');
                                    });
                                  },
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return ('Please Insert The Time');
                                    }
                                    return null;
                                  },
                                  prefixIcon: Icons.watch_later_outlined,
                                  label: 'Time',
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                defaultFormField(
                                  controller: dateController,
                                  type: TextInputType.text,
                                  onTab: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2021-06-01'),
                                    ).then((value) {
                                      dateController.text =
                                          DateFormat.yMMMd().format(value);
                                    });
                                  },
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return ('Please Insert The Date');
                                    }
                                    return null;
                                  },
                                  prefixIcon: Icons.calendar_today_outlined,
                                  label: 'Date',
                                ),
                              ],
                            ),
                          ),
                        ),
                        elevation: 20.0,
                      )
                      .closed
                      .then((value) {
                    cubit.changeBtSheetState(
                      isShow: false,
                      icon: Icons.edit,
                    );
                  });
                  cubit.changeBtSheetState(
                    isShow: true,
                    icon: Icons.add,
                  );
                }
              },
              child: Icon(
                cubit.favicon,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.check_circle_outline),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.archive_outlined),
                  label: 'Archived',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
