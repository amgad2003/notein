
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_cubit.dart';

ThemeData themeApp(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: BlocProvider
        .of<ThemeCubit>(context)
        .state
        ? Colors.black
        : Color(0xFFf2f2f2),
    appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
            color: BlocProvider
                .of<ThemeCubit>(context)
                .state
                ? Color(0xFFf2f2f2)
                : Color(0xFF303030))),
    primaryColor: BlocProvider
        .of<ThemeCubit>(context)
        .state
        ? Color(0xFF393939)
        : Color(0xFFe5e5e5),
    drawerTheme: DrawerThemeData(
      backgroundColor: BlocProvider
          .of<ThemeCubit>(context)
          .state
          ? Color(0xFF393939)
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

  );
}

