import 'package:flutter/material.dart';
import 'package:notein0/widget/customText.dart';
import 'package:notein0/widget/custom_icon_back.dart';

class AlertsView extends StatelessWidget {
  const AlertsView({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         automaticallyImplyLeading: false,
         backgroundColor: Colors.transparent,
         leading: CustomIconBack(),
         title: CustomText(
           text: "Alerts",
           fontSize: 28,
           fontFamily: "Poppins",
         ),
       )
     );
  }

}