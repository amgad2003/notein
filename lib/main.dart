import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notein0/Cubits/Favorite_Cubit/favorite_cubit.dart';
import 'package:notein0/Cubits/Note_cubits/note_cubit.dart';
import 'package:notein0/Cubits/Note_cubits/theme_cubit.dart';
import 'package:notein0/Cubits/Search_Cubit/search_cubit.dart';
import 'package:notein0/Model/model_note.dart';
import 'package:notein0/Servise/service_hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'View/home_view.dart';
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ModelNoteAdapter());
  await ServiceHive.openHiveBox();

  final prefs = await SharedPreferences.getInstance();
  final isDark = prefs.getBool("isDark")??false;

  runApp(
      MultiBlocProvider(
          providers: [
            BlocProvider<NoteCubit>(create: (context) => NoteCubit(),),
            BlocProvider<ThemeCubit>(create: (context) => ThemeCubit(),),
            BlocProvider<FavoriteCubit>(create: (context) => FavoriteCubit(
                context.read<NoteCubit>()),),
            BlocProvider<SearchCubit>(create: (context) => SearchCubit(),)
          ],
          child:  MyApp(isDark: isDark,)));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isDark,});
   final bool isDark;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<NoteCubit>(create: (context) => NoteCubit()..getNote(),),
          BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()..setInitialTheme(isDark),),
          BlocProvider<FavoriteCubit>(create: (context) => FavoriteCubit(
              context.read<NoteCubit>()),),
          BlocProvider<SearchCubit>(create: (context) =>  SearchCubit(),)
        ],
        child: BlocBuilder<ThemeCubit,bool>(
        builder: (context, state){
          return MaterialApp(
            theme: ThemeData(
                scaffoldBackgroundColor:BlocProvider.of<ThemeCubit>(context).state
                    ? Colors.black
                    :  Color(0xFFf2f2f2),
                appBarTheme: AppBarTheme(
                    titleTextStyle: TextStyle(
                        color: BlocProvider.of<ThemeCubit>(context).state
                            ?  Color(0xFFf2f2f2)
                            :  Color(0xFF303030))),
                primaryColor: BlocProvider.of<ThemeCubit>(context).state
                    ? Color(0xFF393939)
                    : Color(0xFFe5e5e5),
                drawerTheme: DrawerThemeData(
                  backgroundColor: BlocProvider.of<ThemeCubit>(context).state
                      ?  Color(0xFF393939)
                      :  Color(0xFFf2f2f2),),
                cardColor: BlocProvider.of<ThemeCubit>(context).state
                    ?  Color(0xFFf2f2f2)
                    :  Colors.black,
                iconTheme: IconThemeData(
                  color: BlocProvider.of<ThemeCubit>(context).state
                    ?  Color(0xFFf2f2f2)
                    :  Colors.black,),

            ),
            debugShowCheckedModeBanner: false,
            home: HomeView(),
          );
        })
    );
  }
}

