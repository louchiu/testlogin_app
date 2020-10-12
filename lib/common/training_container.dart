import 'package:flutter/material.dart';
import 'package:testlogin_app/utils/text_styles.dart';

class TrainingContainer extends StatelessWidget {
  final String text, date, imagePath;

  const TrainingContainer({Key key, this.text, this.imagePath, this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      // boxShadow: [
      //   BoxShadow(
      //       color: Color(0xff32723B).withOpacity(.3),
      //       offset: Offset(0.0, 8.0),
      //       blurRadius: 8.0),
      // ]
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.7),
                  BlendMode.srcATop,
              ),
              child: Image.asset(
                imagePath,
                height: height * 0.7 / 4,
                width: width - 32,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Positioned(
            top: 30,
            bottom: 0,
            left: 30,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyles.trainingTextStyle,
                ),
                Text(
                  date,
                  style: TextStyles.dateTextStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
