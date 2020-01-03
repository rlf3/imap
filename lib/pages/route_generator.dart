import 'package:flutter/material.dart';

import 'package:imap/main.dart';
import 'package:imap/pages/root_page.dart';

import 'login_signup_page.dart';
import 'package:imap/services/authentication.dart';
//import 'page_sample.dart';



class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments.toString();
    print('router value');
    print(settings.name);
    switch (settings.name) {
      
      case '/':
        return MaterialPageRoute(builder: (_) => MyHomePage());



      case '/samples':
        // Validation of correct data type
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => SamplePage(),
          );
        }
        else{
          return _errorRoute();
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
      break;

      case '/videos':
        // Validation of correct data type
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => SamplePage(),
          );
        }
        else{
          return _errorRoute();
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
      break;

      case '/plugins':
        // Validation of correct data type
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => SamplePage(),
          );
        }
        else{
          return _errorRoute();
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
      break;

       

      case '/login':
        // Validation of correct data type
        if (args is String) {
          return MaterialPageRoute(
            //builder: (_) => LoginSignUpPage(auth: new Auth()),
            builder: (_) => new RootPage(auth: new Auth()),
          );
        }
        else{
          return _errorRoute();
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
      break;

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

