import 'package:flutter/material.dart';
import 'package:testlogin_app/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:testlogin_app/forgetPage.dart';
import 'package:testlogin_app/mainscreen2.dart';
import 'package:testlogin_app/signupPage.dart';
import 'mainScreen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';



class loginPage extends StatefulWidget with NavigationStates{
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {

  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool showSpinner = false;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //backgroundColor: Colors.green[400],
        backgroundColor: Colors.green,
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/welcome_walkthrough_hd.png',
                    width: 300,
                    height: 300,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  //login form
                  Container(
                    width: 350.0,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0.0, 15.0),
                            blurRadius: 10.0,
                          ),
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0.0, 10.0),
                            blurRadius: 10.0,
                          )
                        ]),
                    child: Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value){
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
                            onChanged: (value){
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
                          InkWell(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return forgetPage();
                                  }));
                            },
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[400],
                              ),
                            ),
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
                            setState(() {
                              showSpinner = true;
                            });

                            try{
                              final user = await _auth.signInWithEmailAndPassword(email: email, password: password);

                              if(user !=null){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return mainScreen2();
                                    }));
                              }

                              setState(() {
                                showSpinner = false;
                              });

                            } catch(e){
                              print(e);
                            }
                          },
                          child: Center(
                            child: Text(
                              'SIGN IN',
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
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Don't have an account yet?",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return signupPage();
                          }));
                    },
                    child: Text(
                      'SIGN UP HERE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
