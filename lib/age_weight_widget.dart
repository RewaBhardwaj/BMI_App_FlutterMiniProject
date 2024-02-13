import 'package:bmi_app/constants.dart';
import 'package:flutter/material.dart';

class AgeWeightWidget extends StatelessWidget {
  const AgeWeightWidget({
    super.key,
    required this.width,
    required this.value, 
    required this.title, 
    required this.onAddTap,
     required this.onRemoveTap,
  });

  final double width;
  final int value;
  final String title;
  final void Function() onAddTap;
  final void Function() onRemoveTap;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width*0.45,
      height: width*0.45,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10),
        
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("$title",style: titleTextStyle,),
          Text("$value",style: titleTextStyle,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Button1 Container
              GestureDetector(
                onTap: onAddTap,
                child: Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: backgroundColor,
                  ),
                  child: Icon(Icons.add,color: Colors.white,),
                ),
              ),
    
              GestureDetector(
                onTap: onRemoveTap,
                child: Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: backgroundColor,
                  ),
                  child: Icon(Icons.remove,color: Colors.white,)
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}