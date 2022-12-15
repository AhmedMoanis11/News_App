import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app222/shared/Cashe_Helper.dart';
import 'package:new_app222/moduels/business.dart';
import 'package:new_app222/shared/dio.dart';
import 'package:new_app222/moduels/science.dart';
import 'package:new_app222/moduels/settings.dart';
import 'package:new_app222/moduels/sports.dart';
import 'package:new_app222/layout/states.dart';

class Cubitsc extends Cubit<NewStates> {
  Cubitsc() : super(IntialStates());

  static Cubitsc get(context) => BlocProvider.of(context);
  var currentindex = 0;
  List<Widget> Screen = [
    Business(),
    Sports(),
    Science(),
    Settinge(),
  ];
  List<dynamic> business = [];

  void GetBusiness() {
    emit(LoadingBus());
    DioHelper.GetDataDio(Url: 'v2/top-headlines', queries: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '09a9b39d43b94bfbaddf8af4c7114c3f',
    }).then((value) {
      business = value.data['articles'];
      print(business[1]['title']);
      emit(getdataBus());
    });
  }

  List<dynamic> Sportss = [];

  void GetSports() {
    emit(LoadingSp());
    DioHelper.GetDataDio(Url: 'v2/top-headlines', queries: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': '09a9b39d43b94bfbaddf8af4c7114c3f',
    }).then((value) {
      Sportss = value.data['articles'];
      print(Sportss[1]['title']);
      emit(getdataSp());
    });
  }

  List<dynamic> Sciencee = [];

  void GetScience() {
    emit(LoadingSet());
    DioHelper.GetDataDio(Url: 'v2/top-headlines', queries: {
      'country': 'eg',
      'category': 'science',
      'apiKey': '09a9b39d43b94bfbaddf8af4c7114c3f',
    }).then((value) {
      Sciencee = value.data['articles'];
      print(Sciencee[1]['title']);
      emit(getdataSet());
    });
  }

  void ChangeBottomState(index) {
    currentindex = index;

    if (index == 0) {
      GetBusiness();
    } else if (index == 1) {
      GetSports();
    } else if (index == 2) {
      GetScience();
    }
    emit(ChangeBottom());
  }

  bool isDark = false;

  void ChangeMode({bool? Modeon}) {
    if (Modeon != null) {
      isDark = Modeon;
      CasheHelper.PutDataa(Key: 'isDark', value: isDark).then((value) {
        emit(ChangeDarkMode());
      });
    } else {
      isDark = !isDark;
      CasheHelper.PutDataa(Key: 'isDark', value: isDark).then((value) {
        emit(ChangeDarkMode());
      });
    }
  }

  List<dynamic> Search = [];

  void GetSearch(String value) {
    emit(LoadingSearch());
    DioHelper.GetDataDio(Url: 'v2/everything', queries: {

      'q': '$value',
      'apiKey': '09a9b39d43b94bfbaddf8af4c7114c3f',
    }).then((value) {
      Search = value.data['articles'];
      print(Search[1]['title']);
      emit(Getsearchh());
    });
  }
}
