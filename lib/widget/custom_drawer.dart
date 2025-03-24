
import 'package:flutter/material.dart';
import 'package:notein/Model/model_theme_date.dart';
import 'package:notein/widget/customText.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeDataChange = Provider.of<ThemeDataChange>(context);
    return Drawer(
      backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
      child: ListView(
        children: [
          SwitchListTile(
            activeColor: Colors.green,
            title: themeDataChange.isDark
                ? CustomText(text: 'الوضع المظلم',color: Colors.white,)
                : CustomText(text: 'الوضع الفاتح',),
            value: themeDataChange.isDark,
            onChanged: (value) {
              themeDataChange.isDark = value;
              themeDataChange.change();
              print(themeDataChange.isDark);

            },),
          ListTile(
            title: CustomText(
              text: 'مساعدة / تعليق',
              color:  Theme.of(context).appBarTheme.titleTextStyle?.color ?? Colors.black,),
            leading: Icon(Icons.help),
          )
        ],
      ),
    );
  }
}
