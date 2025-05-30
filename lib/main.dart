import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notein0/Cubits/DateTime_Cubit/date_time_cubit.dart';
import 'package:notein0/Cubits/Favorite_Cubit/favorite_cubit.dart';
import 'package:notein0/Cubits/Note_cubits/note_cubit.dart';
import 'package:notein0/Cubits/ThemeCubit/theme_cubit.dart';
import 'package:notein0/Cubits/Search_Cubit/search_cubit.dart';
import 'package:notein0/Model/model_note.dart';
import 'package:notein0/Services/service_hive.dart';
import 'package:notein0/Services/service_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Cubits/ThemeCubit/theme_app.dart';
import 'View/home_view.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ModelNoteAdapter());
  await ServiceHive.openHiveBox();

  final prefs = await SharedPreferences.getInstance();
  final isDark = prefs.getBool("isDark")??false;

  // await initNotifications();

  runApp(
      MultiBlocProvider(
          providers: [
            BlocProvider<NoteCubit>(create: (context) => NoteCubit(),),
            BlocProvider<ThemeCubit>(create: (context) => ThemeCubit(),),
            BlocProvider<FavoriteCubit>(create: (context) => FavoriteCubit(context.read<NoteCubit>()),),
            BlocProvider<SearchCubit>(create: (context) => SearchCubit()),
            BlocProvider<ReminderCubit>(create: (context) => ReminderCubit(),)

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
          BlocProvider<FavoriteCubit>(create: (context) => FavoriteCubit(context.read<NoteCubit>()),),
          BlocProvider<SearchCubit>(create: (context) => SearchCubit()),
          BlocProvider<ReminderCubit>(create: (context) => ReminderCubit(),)
        ],
        child: BlocBuilder<ThemeCubit, bool>(
            builder: (context, state) {
              return MaterialApp(
                theme: themeApp(context),
                debugShowCheckedModeBanner: false,
                home: HomeView(),
              );
            })
    );
  }
}