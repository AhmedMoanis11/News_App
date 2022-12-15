import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app222/layout/cubit.dart';
import 'package:new_app222/moduels/search.dart';
import 'package:new_app222/layout/states.dart';

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Cubitsc,NewStates>(
      listener: (context,state)
      {

      },
      builder: (context,state)
      {
        return  Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                'BBC',
                style: TextStyle(
                  backgroundColor: Colors.black,
                ),

              ),
            ),
            actions: [
              IconButton(onPressed: ()
                  {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>SearchSc()
                      )
                    );

                  }, icon:Icon(
                Icons.search,
              ), ),
              IconButton(onPressed: ()
                  {
                   Cubitsc.get(context).ChangeMode();


                  }, icon:Icon(
                Icons.dark_mode_rounded,
              ), ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: Cubitsc.get(context).currentindex,
            onTap: (index)
            {
              Cubitsc.get(context).ChangeBottomState(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.business_outlined,
                ),
                label: 'Business',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.sports_volleyball_rounded,
                ),
                label: 'Sports',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.science,
                ),
                label: 'Science',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: 'Settings',
              ),
            ],
          ),
          body: Cubitsc.get(context).Screen[Cubitsc.get(context).currentindex],
        );
      },
    );
  }
}
