import 'dart:async';
import 'package:testlogin_app/provider_widget.dart';
import 'package:testlogin_app/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:testlogin_app/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:testlogin_app/loginPage.dart';
import 'package:testlogin_app/pages/homepage.dart';
import 'package:testlogin_app/sidebar/menu_item.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar>
    with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> isSideBarOpenedStreamController;
  Stream<bool> isSideBarOpenedStream;
  StreamSink<bool> isSideBarOpenedSink;
  final bool isSideBarOpened = true;
  final _animationDuration = const Duration(milliseconds: 300);

  final _auth = FirebaseAuth.instance;
  User loggedInUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    isSideBarOpenedStreamController = PublishSubject<bool>();
    isSideBarOpenedStream = isSideBarOpenedStreamController.stream;
    isSideBarOpenedSink = isSideBarOpenedStreamController.sink;
    getCurrentUser();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    isSideBarOpenedStreamController.close();
    isSideBarOpenedSink.close();
    super.dispose();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

    void signOut() async {
      await _auth.signOut();
    }

    void onIconPressed() {
      final animationStatus = _animationController.status;
      final isAnimationCompleted = animationStatus == AnimationStatus.completed;

      if (isAnimationCompleted) {
        isSideBarOpenedSink.add(false);
        _animationController.reverse();
      } else {
        isSideBarOpenedSink.add(true);
        _animationController.forward();
      }
    }

    @override
    Widget build(BuildContext context) {
      final screenwidth = MediaQuery
          .of(context)
          .size
          .width;

      return StreamBuilder<bool>(
        initialData: false,
        stream: isSideBarOpenedStream,
        builder: (context, isSideBarOpenedAsync) {
          return AnimatedPositioned(
            duration: _animationDuration,
            top: 0,
            bottom: 0,
            left: isSideBarOpenedAsync.data ? 0 : -screenwidth,
            right: isSideBarOpenedAsync.data ? 0 : screenwidth - 45,
            //curve: Curves.elasticOut,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.green,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        ListTile(
                          title: Text(
                            "User",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          subtitle: Text(
                            "user@user.com",
                            style: TextStyle(
                              color: Colors.greenAccent,
                              fontSize: 20,
                              //fontWeight: FontWeight.w800,
                            ),
                          ),
                          leading: CircleAvatar(
                            child: Icon(
                              Icons.perm_identity,
                              color: Colors.white,
                            ),
                            radius: 40,
                          ),

                        ),
                        Divider(
                          height: 64,
                          thickness: 0.5,
                          color: Colors.greenAccent,
                          indent: 32,
                          endIndent: 32,
                        ),
                        MenuItem(
                          icon: Icons.home,
                          title: "Home",
                          onTap: () {
                            onIconPressed();
                            BlocProvider.of<NavigationBloc>(context)
                                .add(NavigationEvents.HomePageClickedEvent);
                          },
                        ),
                        MenuItem(
                          icon: Icons.question_answer,
                          title: "Training Library",
                          onTap: () {
                            onIconPressed();
                            BlocProvider.of<NavigationBloc>(context)
                                .add(NavigationEvents.TrainingLibClickedEvent);
                          },
                        ),
                        MenuItem(
                          icon: Icons.assessment,
                          title: "Reports",
                        ),
                        Divider(
                          height: 64,
                          thickness: 0.5,
                          color: Colors.greenAccent,
                          indent: 32,
                          endIndent: 32,
                        ),
                        MenuItem(
                          icon: Icons.settings,
                          title: "Settings",
                        ),
                        MenuItem(
                          icon: Icons.exit_to_app,
                          title: "Logout",
                          onTap: () {
                            onIconPressed();
                            signOut();
                            // BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.LogoutClickedEvent);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return loginPage();
                                }));
                            // Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, -0.9),
                  child: GestureDetector(
                    onTap: () {
                      onIconPressed();
                    },
                    child: ClipPath(
                      clipper: CustomMenuClipper(),
                      child: Container(
                        //the white strip
                        alignment: Alignment.centerLeft,
                        width: 35,
                        height: 110,
                        color: Colors.green,
                        child: AnimatedIcon(
                          progress: _animationController.view,
                          icon: AnimatedIcons.menu_close,
                          color: Colors.greenAccent,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
  }




class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;
    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
