
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../View/home_view.dart';

class CustomIconBack extends StatelessWidget {
  const CustomIconBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            PageTransition(type: PageTransitionType.leftToRight,child: HomeView()),
                (route) =>  false,);
        },
        icon: Icon(Icons.arrow_back,color: Theme.of(context).cardColor,));
  }
}