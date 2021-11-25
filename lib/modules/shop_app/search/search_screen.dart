import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/shop_app/cubit/cubit.dart';
import 'package:udemy_flutter/modules/shop_app/search/cubit/cubit.dart';
import 'package:udemy_flutter/modules/shop_app/search/cubit/states.dart';
import 'package:udemy_flutter/shared/components/components.dart';

class SearchScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(BuildContext context) => SearchCubit(),
      child: BlocConsumer<SearchCubit , SearchStates>(
        listener: (context , state)
        {

        },
        builder: (context , state) 
        {
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    defaultFormField(
                      controller: searchController, 
                      type: TextInputType.text, 
                      validate: (String value)
                      {
                        if(value.isEmpty)
                        {
                          return 'please enter text to search';
                        }
                        return null;
                      }, 
                      onsubmited: (String text)
                      {
                        SearchCubit.get(context).search(text);
                      },
                      prefixIcon: Icons.search, 
                      label: 'Search'
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      if(state is SearchLoadingState)
                      LinearProgressIndicator(),
                      if(state is SearchSuccessState)
                      Expanded(
                        child: ListView.separated(
                          itemCount: SearchCubit.get(context).searchModel.data.data.length,
                          separatorBuilder: (BuildContext context, int index) => myDivider(),
                          itemBuilder: (BuildContext context, int index) => buildListProduct(SearchCubit.get(context).searchModel.data.data[index] , context ,isOldPrice: false),
                        ),
                      ),
                  ],
                ),
              ),
            ) ,
          );
        },
        ),

    );
  }
}