import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:testlogin_app/mainscreen2.dart';

class signupPage extends StatefulWidget {
  @override
  _signupPageState createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {

  final _auth = FirebaseAuth.instance;
  String username;
  String email;
  String password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "Let's get started...",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontFamily: "NotoSans",
                  ),
                ),
              SizedBox(
                height: 20,
              ),
              Material(
                borderRadius: BorderRadius.circular(10.0),
                elevation: 5.0,
                child: Container(
                  width: 350,
                  height: 255,
                  padding: EdgeInsets.only(left: 16, right: 16, top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        onChanged: (value) {
                          username = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Username',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          email = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        obscureText: true,
                        onChanged: (value) {
                          password = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                child: Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0xff32723B),
                        Color(0xff1E4423),
                      ]),
                      borderRadius: BorderRadius.circular(6.0),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xff32723B).withOpacity(.3),
                            offset: Offset(0.0, 8.0),
                            blurRadius: 8.0),
                      ]),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () async {
                        // SessionHolder.getInstance().getHttp();
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //       return mainScreen2();
                        //     }));
                        // print("$email and $password");
                        setState(() {
                          showSpinner = true;
                        });
                        try{
                          final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                          if(newUser !=null){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return mainScreen2();
                            }));
                          }

                          setState(() {
                            showSpinner = false;
                          });

                        }catch(e){
                          print(e);
                        }

                      },
                      child: Center(
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
