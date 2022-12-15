import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app222/layout/cubit.dart';
import 'package:new_app222/layout/states.dart';

import 'buildTask.dart';

class Business extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Cubitsc,NewStates>(
      listener: (context,state)
      {

      },
      builder: (context,state)
      {
        return ListView.separated(
            itemBuilder: (context,index)
        {
          return BuildTask(Cubitsc.get(context).business[index],context);
        }, separatorBuilder:(context,index)
        {
          return Container(
            width: 1.0,
            height:1.0 ,
            color: Colors.grey.shade300,
          );
        }, itemCount:Cubitsc.get(context).business.length);

      },
    );
  }
}
