
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notein0/Cubits/ThemeCubit/theme_cubit.dart';
import 'package:notein0/View/search_view.dart';
import 'package:page_transition/page_transition.dart';
import '../View/favorite_view.dart';
import 'customText.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
      child: ListView(
        children: [
         BlocBuilder<ThemeCubit,bool>(
           builder: (context, isDark) {
             return  SwitchListTile(
               activeColor: Colors.green,
               title:BlocProvider.of<ThemeCubit>(context).state == true
                 ?  const CustomText(text: 'الوضع المظلم',color: Colors.white,)
                 :  const CustomText(text: 'الوضع الفاتح',),
             value: isDark,
             onChanged: (value) {
             context.read<ThemeCubit>().theme(value);

             });
           },),
          ListTile(
            title: CustomText(
              text: 'مساعدة / تعليق',
              color:  Theme.of(context).appBarTheme.titleTextStyle?.color ?? Colors.black,),
            leading: Icon(Icons.help,color:  Theme.of(context).appBarTheme.titleTextStyle?.color ?? Colors.black,),
          ),
          ListTile(
            title:CustomText(text: "  ..البحث عن الملاحظات",color:  Theme.of(context).appBarTheme.titleTextStyle?.color ?? Colors.black,),
            leading: Icon(Icons.search,color:  Theme.of(context).appBarTheme.titleTextStyle?.color ?? Colors.black,),
           onTap: () {
             Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop,child: SearchView())) ;
           },
          ),
          ListTile(
            title:CustomText(text: "الملاحظات المفضلة",color:  Theme.of(context).appBarTheme.titleTextStyle?.color ?? Colors.black,),
            leading: Icon(Icons.favorite_outline_outlined,color:  Theme.of(context).appBarTheme.titleTextStyle?.color ?? Colors.black,),
            onTap: () {
              Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop,child: FavoriteView()));
            },
          )
        ],
      ),
    );
  }
}
