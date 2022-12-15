import 'package:dio/dio.dart';

class DioHelper
{
  static late Dio dios;
  static init()
  {
   dios=Dio(
     BaseOptions(
       baseUrl:'https://newsapi.org/',
       receiveDataWhenStatusError:true,
     ),
   );
  }
  static Future<Response> GetDataDio({
  required String Url,
    required Map<String,dynamic> queries
})async
  {

    return await dios.get(Url,queryParameters:queries );
  }
}














//base Url:https://newsapi.org/
// method:v2/top-headlines?
// queries:country=us&category=business&apiKey=09a9b39d43b94bfbaddf8af4c7114c3f

//base url :https://newsapi.org/
// method: v2/everything?
// queries:q=s&apiKey=09a9b39d43b94bfbaddf8af4c7114c3f


//base Url:https://newsapi.org/
// method:v2/everything?
// queries:q=tesla&from=2022-08-11&sortBy=publishedAt&apiKey=09a9b39d43b94bfbaddf8af4c7114c3f