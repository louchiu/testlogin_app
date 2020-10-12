import 'package:flutter/material.dart';

class mainScreen extends StatefulWidget {
  @override
  _mainScreenState createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  Offset _offset = Offset(0, 0);
  GlobalKey globalKey = GlobalKey();
  List<double> limits = [];

  bool isMenuOpen = false;

  @override
  void initState() {
    // TODO: implement initState
    limits = [0, 0, 0, 0, 0];
    WidgetsBinding.instance.addPostFrameCallback(getPosition);
    super.initState();
  }

  getPosition(duration) {
    RenderBox renderBox = globalKey.currentContext.findRenderObject();
    final position = renderBox.localToGlobal(Offset.zero);
    double start = position.dy - 20;
    double contLimit = position.dy + renderBox.size.height - 20;
    double step = (contLimit - start) / 5;
    limits = [];
    for (double x = start; x <= contLimit; x = x + step) {
      limits.add(x);
    }
    setState(() {
      limits = limits;
    });
  }

  double getSize(int x) {
    double size =
        (_offset.dy > limits[x] && _offset.dy < limits[x + 1]) ? 25 : 20;
    return size;
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    double sidebarSize = mediaQuery.width * 0.65;
    double menuContainerHeight = mediaQuery.height / 2;

    // void moveToLastScreen() {
    //   Navigator.pop(context);
    // }

    return SafeArea(
      child: Scaffold(
        body: Container(
            child: Stack(
          children: [
            Center(
              child: Container(
                color: Colors.green,
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 1500),
              left: isMenuOpen ? 0 : -sidebarSize + 20,
              top: 0,
              curve: Curves.elasticOut,
              child: SizedBox(
                width: sidebarSize,
                child: GestureDetector(
                  onPanUpdate: (details) {
                    if (details.localPosition.dx <= sidebarSize) {
                      setState(() {
                        _offset = details.localPosition;
                      });
                    }

                    if (details.localPosition.dx > sidebarSize - 20 &&
                        details.delta.distanceSquared > 2) {
                      setState(() {
                        isMenuOpen = true;
                      });
                    }
                  },
                  onPanEnd: (details) {
                    setState(() {
                      _offset = Offset(0, 0);
                    });
                  },
                  child: Stack(
                    children: [
                      CustomPaint(
                        size: Size(sidebarSize, mediaQuery.height),
                        painter: DrawerPainter(offset: _offset),
                      ),
                      Container(
                        height: mediaQuery.height,
                        width: sidebarSize,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: mediaQuery.height * 0.25,
                              child: Center(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "images/usericon1.jpg",
                                      width: sidebarSize / 2,
                                    ),
                                    Text(
                                      "User User",
                                      style: TextStyle(color: Colors.black45),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 1,
                            ),
                            Container(
                                key: globalKey,
                                width: double.infinity,
                                height: menuContainerHeight,
                                child: Column(
                                  children: [
                                    MyButton(
                                      text: "Profile",
                                      iconData: Icons.person,
                                      textSize: getSize(0),
                                      height: (menuContainerHeight) / 5,
                                    ),
                                    MyButton(
                                      text: "Training Library",
                                      iconData: Icons.question_answer,
                                      textSize: getSize(1),
                                      height: (menuContainerHeight) / 5,
                                    ),
                                    MyButton(
                                      text: "Reports",
                                      iconData: Icons.assessment,
                                      textSize: getSize(2),
                                      height: (menuContainerHeight) / 5,
                                    ),
                                    MyButton(
                                      text: "Settings",
                                      iconData: Icons.settings,
                                      textSize: getSize(3),
                                      height: (menuContainerHeight) / 5,
                                    ),
                                    MyButton(
                                      text: "Logout",
                                      iconData: Icons.exit_to_app,
                                      textSize: getSize(4),
                                      height: (menuContainerHeight) / 5,
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 400),
                        right: (isMenuOpen) ? 10 : sidebarSize,
                        bottom: 70,
                        child: IconButton(
                          enableFeedback: true,
                            icon: Icon(Icons.keyboard_backspace),
                            color: Colors.black45,
                            iconSize: 40,
                            onPressed: (){
                              this.setState(() {
                                isMenuOpen = false;
                              });
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class DrawerPainter extends CustomPainter {
  final Offset offset;
  DrawerPainter({this.offset});

  double getControlPointx(double width) {
    if (offset.dx == 0) {
      return width;
    } else {
      return offset.dx > width ? offset.dx : width + 75;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    Path path = Path();
    path.moveTo(-size.width, 0);
    path.lineTo(size.width, 0);
    // path.lineTo(size.width, size.height);
    path.quadraticBezierTo(
        getControlPointx(size.width), offset.dy, size.width, size.height);
    path.lineTo(-size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    // throw UnimplementedError();
    return true;
  }
}

class MyButton extends StatelessWidget {
  final String text;
  final IconData iconData;
  final double textSize;
  final double height;

  MyButton({this.text, this.iconData, this.textSize, this.height});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            iconData,
            color: Colors.black45,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.black45,
              fontSize: textSize,
            ),
          )
        ],
      ),
      onPressed: () {},
    );
  }
}
