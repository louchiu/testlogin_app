import 'package:flutter/material.dart';
import 'package:testlogin_app/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:testlogin_app/utils/strings.dart';
import 'package:testlogin_app/utils/text_styles.dart';

class HomePage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 0.40,
            child: Container(
              //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 120),
              child: Stack(
                children: [
                  Image.asset(
                    "images/gms_background.png",
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fitWidth,
                  ),
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 110),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Welcome to GotMySafety",
                            style: TextStyle(
                              fontFamily: "NotoSans",
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.65,
            child: Container(
              padding: EdgeInsets.only(left: 50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(50),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 25,
                    ),
                    child: Text(
                      "New Training",
                      style: TextStyle(
                        fontFamily: "NotoSans",
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.black45,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    child: Image.asset(
                                      "images/ban1.jpeg",
                                      width: MediaQuery.of(context).size.width * 0.5,
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 6),
                                  child: Text(
                                    Strings.trainingText1,
                                    style: TextStyles.trainingTextStyle,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 3),
                                  child: Text(
                                    Strings.loremIpsum,
                                    style: TextStyles.bodyTextStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 15,),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    child: Image.asset(
                                      "images/ban2.jpeg",
                                      width: MediaQuery.of(context).size.width * 0.5,
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 6),
                                  child: Text(
                                    Strings.trainingText2,
                                    style: TextStyles.trainingTextStyle,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 3),
                                  child: Text(
                                    Strings.loremIpsum,
                                    style: TextStyles.bodyTextStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 15,),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Image.asset(
                                    "images/ban3.jpeg",
                                    width: MediaQuery.of(context).size.width * 0.5,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 6),
                                  child: Text(
                                    Strings.trainingText3,
                                    style: TextStyles.trainingTextStyle,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 3),
                                  child: Text(
                                    Strings.loremIpsum,
                                    style: TextStyles.bodyTextStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 15,),
                          // Container(
                          //   width: MediaQuery.of(context).size.width * 0.5,
                          //   child: Column(
                          //     children: [
                          //       Expanded(
                          //         child: Image.asset(
                          //           "images/ban1.jpeg",
                          //           width: MediaQuery.of(context).size.width * 0.5,
                          //           fit: BoxFit.cover,
                          //         ),
                          //       ),
                          //       Padding(
                          //         padding: const EdgeInsets.symmetric(vertical: 6),
                          //         child: Text(
                          //           Strings.trainingText4,
                          //           style: TextStyles.trainingTextStyle,
                          //         ),
                          //       ),
                          //       Padding(
                          //         padding: const EdgeInsets.symmetric(vertical: 6),
                          //         child: Text(
                          //           Strings.loremIpsum,
                          //           style: TextStyles.bodyTextStyle,
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),

                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 25,
                    ),
                    child: Text(
                      "Quick Categories",
                      style: TextStyle(
                        fontFamily: "NotoSans",
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.black45,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.greenAccent,
                              ),
                              child: Image.asset(
                                "images/safety_tips_icon.png",
                                height: 40,
                                width: 40,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "TIPS",
                              style: TextStyle(
                                fontSize: 12,
                                letterSpacing: 1.3,
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.5),
                                fontFamily: "NotoSans",
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.greenAccent,
                              ),
                              child: Image.asset(
                                "images/reinvite_icon.png",
                                height: 40,
                                width: 40,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "INVITE",
                              style: TextStyle(
                                fontSize: 12,
                                letterSpacing: 1.3,
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.5),
                                fontFamily: "NotoSans",
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.greenAccent,
                              ),
                              child: Image.asset(
                                "images/crew_list_icon.png",
                                height: 40,
                                width: 40,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "CREW",
                              style: TextStyle(
                                fontSize: 12,
                                letterSpacing: 1.3,
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.5),
                                fontFamily: "NotoSans",
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.greenAccent,
                              ),
                              child: Image.asset(
                                "images/safety_inspection_icon.png",
                                height: 40,
                                width: 40,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "INSPECTION",
                              style: TextStyle(
                                fontSize: 12,
                                letterSpacing: 1.1,
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.5),
                                fontFamily: "NotoSans",
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
