import 'package:flutter/material.dart';
import 'package:testlogin_app/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:testlogin_app/common/training_container.dart';
import 'package:testlogin_app/utils/strings.dart';
import 'package:testlogin_app/utils/text_styles.dart';

class TrainingPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        //padding: EdgeInsets.symmetric(horizontal: 40, vertical: 150),
        padding: EdgeInsets.fromLTRB(60, 80, 10, 0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Training Library",
                  style: TextStyles.headingTextStyle,
                ),
                SizedBox(
                  height: 30,
                ),
                TrainingContainer(
                  text: Strings.trainingText1,
                  date: Strings.trainingDate1,
                  imagePath: "images/ban1.jpeg",
                ),
                TrainingContainer(
                  text: Strings.trainingText2,
                  date: Strings.trainingDate2,
                  imagePath: "images/ban1.jpeg",
                ),
                TrainingContainer(
                  text: Strings.trainingText3,
                  date: Strings.trainingDate3,
                  imagePath: "images/ban1.jpeg",
                ),
                TrainingContainer(
                  text: Strings.trainingText4,
                  date: Strings.trainingDate4,
                  imagePath: "images/ban1.jpeg",
                ),
              ],
            ),
          ],
        ),
      ),
      // child: Container(
      //   child: Text(
      //     "Training Library",
      //     style: TextStyle(
      //       fontWeight: FontWeight.w900,
      //       fontSize: 28,
      //     ),
      //   ),
      // ),
    );
  }
}
