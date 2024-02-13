import 'package:bmi_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GenderSelectionWidget extends StatelessWidget {
  const GenderSelectionWidget({
    super.key,
    required this.width,
    required this.isMale,
    required this.backgroundcolor,

  });

  final double width;
  final bool isMale;
  final Color backgroundcolor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FaIcon(
              isMale ?  FontAwesomeIcons.mars : FontAwesomeIcons.venus,
              color: Colors.white,
              size: 75,
            ),
            Text(
              isMale ?  "male" : "female",
              style: titleTextStyle,)
          ],
        ),
        
        width: width*0.45,
        height: width*0.45,
        decoration: BoxDecoration(
          color: backgroundcolor,
          borderRadius: BorderRadius.circular(10),
      
        ),
      ),
    );
  }
}