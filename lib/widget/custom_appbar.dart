
import 'package:flutter/material.dart';
import 'package:notein/widget/custom_row_app_bar.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    title: CustomAppBarRow(
        onTap: (){},
        icon: Icons.search,
        text: 'Note'),
  );
}