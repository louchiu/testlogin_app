import 'package:flutter/material.dart';
import 'package:testlogin_app/pages/homepage.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;

  const MenuItem({Key key, this.icon, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.tealAccent,
              size: 30,
            ),
            SizedBox(width: 20,),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 26,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
