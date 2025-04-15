import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<bool>{
  ThemeCubit():super(false);

  void setInitialTheme( bool isDark){
    emit(isDark);
  }
  void theme(bool isDark)async{
    emit(isDark);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isDark", isDark);
  }
  // void loadTheme()async{
  //
  //   emit(isDark);
  // }
}