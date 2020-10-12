import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testlogin_app/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:testlogin_app/pages/homepage.dart';
import 'package:testlogin_app/sidebar/sidebar.dart';

class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
            create: (context) => NavigationBloc(),
            child: Stack(
              children: [
                BlocBuilder<NavigationBloc, NavigationStates>(
                    builder: (context, navigationState){
                      return navigationState as Widget;
                    },
                ),
                SideBar(),
              ],
            ),
          ),

    );
  }
}
