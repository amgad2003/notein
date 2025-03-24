
import 'package:flutter/material.dart';
import 'package:notein/Model/model_color.dart';

import 'customText.dart';

class CustomContainerItem extends StatelessWidget {
 final ModelColor colorMadel;
   const CustomContainerItem({
    super.key,
    required this.colorMadel,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 24,bottom: 24,left: 16),
      decoration: BoxDecoration(
          color:colorMadel.color,
          borderRadius: BorderRadius.circular(18)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: CustomText(text: 'Flutter tips',fontSize: 26),
            ),
            subtitle: CustomText(
              text: 'Build your career with Amgad Emad ',
              maxLine: null,
              fontSize: 16,
              color: Colors.black.withOpacity(0.4),
            ),
            trailing:IconButton(
              onPressed: (){},
              icon: const Icon(Icons.delete,size: 32,),
              color: Colors.black,
              ),
          ),
          Padding(
              padding: const EdgeInsets.only(right: 24),
              child: CustomText(
                text: 'May 23/3/2025',
                fontSize: 14,
                color: Colors.black.withOpacity(0.4),))
        ],
      ),
    );
  }
}
