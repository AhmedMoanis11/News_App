
import 'package:flutter/material.dart';
import 'package:new_app222/moduels/WebVieww.dart';

import '../layout/cubit.dart';

Widget BuildTask(article,context) {
  return InkWell(
    onTap: ()
    {
      Navigator.push(context,
      MaterialPageRoute(builder: (context)=>Web('${article['url']}'))
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(20.0),
              image: DecorationImage(
                image: NetworkImage(

                    article['urlToImage']== null ?'https://yt3.ggpht.com/ytc/AMLnZu8d9XFV2AuqJJwQv7De9Zaa1b1TUegQonrfbwn3Rmk=s900-c-k-c0x00ffffff-no-rj':'${article['urlToImage']}',

                ),
              ),
            ),
          ),
          SizedBox(
            width: 15.0,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${article['title']}',
                 style: Theme.of(context).textTheme.bodyText1,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  '${article['publishedAt']}',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
