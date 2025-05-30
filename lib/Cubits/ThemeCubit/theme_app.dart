
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_cubit.dart';

ThemeData themeApp(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: BlocProvider
        .of<ThemeCubit>(context)
        .state
        ? Color(0xFF121212)
        : Colors.white,
    appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
            color: BlocProvider
                .of<ThemeCubit>(context)
                .state
                ? Color(0xFFc7c7c7)
                : Colors.grey[900]
        )),
    primaryColor: BlocProvider
        .of<ThemeCubit>(context)
        .state
        ? Color(0xFF3a3a3a)
        : Color(0xFFe5e5e5),
    drawerTheme: DrawerThemeData(
      backgroundColor: BlocProvider
          .of<ThemeCubit>(context)
          .state
          ? Color(0xFF3a3a3a)
          : Color(0xFFf2f2f2),),
    cardColor: BlocProvider
        .of<ThemeCubit>(context)
        .state
        ? Color(0xFFf2f2f2)
        : Colors.black,
    iconTheme: IconThemeData(
      color: BlocProvider
          .of<ThemeCubit>(context).
      state
          ? Color(0xFFf2f2f2)
          : Colors.black,),
    searchViewTheme: SearchViewThemeData(backgroundColor: BlocProvider
        .of<ThemeCubit>(context)
        .state
        ? Colors.grey.shade900
        : Color(0xFFe5e5e5),)

  );
}

