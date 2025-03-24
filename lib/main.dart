import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notein/Model/model_theme_date.dart';
import 'package:notein/View/home_view.dart';
import 'package:provider/provider.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox('NotesBox');
  runApp(
      ChangeNotifierProvider<ThemeDataChange>(
      create: (context) => ThemeDataChange(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeDataChange = Provider.of<ThemeDataChange>(context);
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: themeDataChange.isDark
            ? Color(0xFF303030)
            :Colors.white,
        fontFamily:  "Poppins",
        appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
                color: themeDataChange.isDark
                    ?Colors.white
                    :Colors.black
            )
        ),
        primaryColor:themeDataChange.isDark
            ? Color(0xFF3b3b3b)
            :Color(0xFFe5e5e5),
        drawerTheme: DrawerThemeData(
          backgroundColor: themeDataChange.isDark
            ? Color(0xFF303030)
            :Colors.white,)
      ),
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
