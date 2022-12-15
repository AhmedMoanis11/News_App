import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app222/moduels/buildTask.dart';
import 'package:new_app222/layout/cubit.dart';
import 'package:new_app222/layout/states.dart';

class SearchSc extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Cubitsc,NewStates>(
      listener: (context,state)
      {

      },builder: (context,state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Search'
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: TextEditingController(),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                  ),
                 onFieldSubmitted: (value)
                  {
                    Cubitsc.get(context).GetSearch(value);
                  },
                ),
              ),
             Expanded(
               child: SizedBox(
                 height: 720,
                 width: double.infinity,
                 child: ListView.separated(itemBuilder: (context,index)
                     {
                       return BuildTask(Cubitsc.get(context).Search[index], context);
                     }, separatorBuilder: (context,index)
                     {
                       return Container(
                         width: 7.0,
                         height: 7.0,
                         color: Colors.grey,
                       );
                     }
                     ,itemCount:Cubitsc.get(context).Search.length),
               ),
             ),
            ],
          ),
        );
    }
    );
  }
}
