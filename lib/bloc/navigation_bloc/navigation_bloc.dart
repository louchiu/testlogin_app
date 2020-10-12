import 'package:bloc/bloc.dart';
import 'package:testlogin_app/loginPage.dart';
import 'package:testlogin_app/pages/homepage.dart';
import 'package:testlogin_app/pages/training_lib_page.dart';

enum NavigationEvents{HomePageClickedEvent, TrainingLibClickedEvent,LogoutClickedEvent,}

abstract class NavigationStates{}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates>{

  @override
  // TODO: implement initialState
  NavigationStates get initialState => HomePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch(event){
      case NavigationEvents.HomePageClickedEvent:
        yield HomePage();
        break;
      case NavigationEvents.TrainingLibClickedEvent:
        yield TrainingPage();
        break;
      case NavigationEvents.LogoutClickedEvent:
        yield loginPage();
    }
  }

}