import 'package:bmi_app/bmi_result_screen.dart';
import 'package:bmi_app/constants.dart';
import 'package:bmi_app/gender_selection_widget.dart';
import 'package:bmi_app/age_weight_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BmiCalculatorScreen extends StatefulWidget {
  BmiCalculatorScreen({super.key});

  @override
  State<BmiCalculatorScreen> createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {

  bool isMale =true;
  int weight = 75 ; 
  int age=29;
  double height1= 130;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;


    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: backgroundColor,
        title: Text("BMI CALCULATOR", 
                    style: TextStyle(
                      color: Colors.white
                      ),
                      ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  isMale=true;
                  setState(() {
                  });

                },
                child: GenderSelectionWidget(width: width, isMale: true,  backgroundcolor: isMale ? cardColor : backgroundColor,)
                ),
              GestureDetector(
                onTap: () {
                  isMale=false;
                  setState(() {
                    
                  });
                },
                
                child: GenderSelectionWidget(width: width, isMale: false, backgroundcolor: !isMale ? cardColor :backgroundColor,)
              ),
               
            ],

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               Container(
                width: width,
                height: width * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:  cardColor
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Height',
                      style: titleTextStyle, 
                    ),
                    Text(
                      '${height1.toInt()}',
                      style: titleTextStyle.copyWith(fontSize: 50),
                    ),
                    SliderTheme(
                      data: const SliderThemeData().copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.grey,
                        thumbColor: Colors.pink,
                        overlayColor: Colors.pink.withOpacity(0.5)
                      ),
                      child: Slider(
                        min: 100,
                        max: 200,
                        value: height1,
                        onChanged: (value){
                         height1=value;
                         setState(() {});
                        },
                      ),
                    )
                  ],
                )
               )
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
            
                // weight vala box
                AgeWeightWidget(width: width, value: weight, title: "weight", onAddTap: ()=> addSubtractWeight(true),onRemoveTap : ()=> addSubtractWeight(false)),
            
                
                //age vala box
                AgeWeightWidget(width: width, value: age, title: "Age", onAddTap: ()=> addSubtractAge(true), onRemoveTap : ()=> addSubtractAge(false)),
            
              ],
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              final bmi = weight/((height1/100) * (height1/100));
              print(bmi);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) =>  BmiResultScreen(
                    bmi:bmi,
                  )
                  ),
                  );  
            } ,
          
           child: Container(
            height: 80,
            width: width,
            color: Colors.pinkAccent ,
            child: const Center(
            child: Text(
              "Calculate BMI",
              style: titleTextStyle,
            ),
            ),
          ),
          ),
        ],
      ),
    );
  }

  void addSubtractWeight(bool isAdd){
    isAdd ? weight ++ : weight--;
    setState(() {});
  }
  void addSubtractAge(bool isAdd){
    isAdd ? age ++ : age--;
    setState(() {});
  }
}




// class WeightWidget extends StatelessWidget {
//   const WeightWidget({
//     super.key,
//     required this.width,
//     required this.weight,
//   });

//   final double width;
//   final int weight;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width*0.45,
//       height: width*0.45,
//       decoration: BoxDecoration(
//         color: cardColor,
//         borderRadius: BorderRadius.circular(10),
        
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Text("weight",style: titleTextStyle,),
//           Text("$weight",style: titleTextStyle,),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               //Button1 Container
//               Container(
//                 width: 75,
//                 height: 75,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: backgroundColor,
//                 ),
//                 child: Icon(Icons.add,color: Colors.white,),
//               ),
    
//               Container(
//                 width: 75,
//                 height: 75,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: backgroundColor,
//                 ),
//                 child: Icon(Icons.remove,color: Colors.white,)
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

// class GenderSelectionWidget extends StatelessWidget {
//   const GenderSelectionWidget({
//     super.key,
//     required this.width,
//   });

//   final double width;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(4.0),
//       child: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             FaIcon(
//               FontAwesomeIcons.mars,
//               color: Colors.white,
//               size: 75,
//             ),
//             Text(
//               "male",
//               style: TextStyle(color: Colors.white,fontSize: 25
//               ,fontWeight: FontWeight.bold),)
//           ],
//         ),
        
//         width: width*0.45,
//         height: width*0.45,
//         decoration: BoxDecoration(
//           color: cardColor,
//           borderRadius: BorderRadius.circular(10),
      
//         ),
//       ),
//     );
//   }
// }

// class GenderSelectionWidget extends StatelessWidget {
//   const GenderSelectionWidget({
//     super.key,
//     required this.width,
//   });

//   final double width;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
        
//         child: const Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        children: [
//         FaIcon(
//           FontAwesomeIcons.mars,
//           color: Colors.white,
//           size: 45,
//         ),
//         Text(
//           'Male',
//           style: TextStyle(color: Colors.white ),
//         )
//        ],
//         ),
        // width: width * 0.45,
        // height: width * 0.45,
        // decoration: BoxDecoration(
        // color:  cardColor,
        // borderRadius: BorderRadius.circular(15),
        
//         ),
    
//       ),
//     );
//   }
// }