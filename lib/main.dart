import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:new_app222/shared/Cashe_Helper.dart';
import 'package:new_app222/layout/cubit.dart';
import 'package:new_app222/shared/dio.dart';
import 'package:new_app222/layout/mainApp.dart';
import 'package:new_app222/layout/states.dart';

import 'shared/BlocObserver.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CasheHelper.init();
  bool? isdark=CasheHelper.GetDataa(Key: 'isdark');
  runApp( MyApp(isdark));


}

class MyApp extends StatelessWidget {
  final bool? IsDark;

   const MyApp( this.IsDark);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>Cubitsc()..GetBusiness()..ChangeMode(
        Modeon: IsDark,
      ),
      child: BlocConsumer<Cubitsc,NewStates>(
        listener: (context,state)
        {

        },
        builder: (context,state)
        {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            darkTheme: ThemeData(
              appBarTheme: AppBarTheme(
                backgroundColor:HexColor('#2C3539'),
                backwardsCompatibility: false,
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('#2C3539'),
                  statusBarIconBrightness: Brightness.light,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
                elevation: 0.0,
              ),


              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.red.shade900,
                  unselectedItemColor: Colors.grey,
                  backgroundColor: HexColor('#2C3539')


              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              scaffoldBackgroundColor: HexColor('#2C3539'),


            ),
            themeMode: Cubitsc.get(context).isDark?ThemeMode.dark:ThemeMode.light,
            theme: ThemeData(
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              appBarTheme: AppBarTheme(
                backgroundColor: Colors.white,
                backwardsCompatibility: false,
                iconTheme: IconThemeData(
                  color: Colors.red.shade900,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.red.shade900,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
                elevation: 0.0,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.red.shade900,




              ),
            ),
            home: MainApp(),
          );
        },
      ),
    );
  }
}
