import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/style/themes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
   CustomAppBar({Key key, this.title}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);

    @override
    final Size preferredSize; // default is 56.0

  final String title;
    Icon sun = Icon(Icons.wb_sunny, color: darkTheme.buttonColor);
  Icon moon = Icon(Icons.nights_stay_rounded);

  @override 
  Widget build(BuildContext context){
    return AppBar(
      brightness: Brightness.dark,
        title: Text(title),
        actions: <Widget>[
          IconButton(icon:EasyDynamicTheme.of(context).themeMode == ThemeMode.dark? sun : moon, 
          onPressed: () =>{ 
            if(EasyDynamicTheme.of(context).themeMode == ThemeMode.dark)

               { EasyDynamicTheme.of(context).changeTheme(dynamic: false, dark: false)} else { 
              EasyDynamicTheme.of(context).changeTheme(dynamic: false, dark: true)}
              }
,),
        ],
      );
  }

  
}