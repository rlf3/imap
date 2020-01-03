import 'package:flutter/material.dart';
import 'package:custom_splash/custom_splash.dart';
import 'package:imap/utils/myColors.dart';
import 'package:imap/widgets/header.dart';
import 'package:imap/widgets/body.dart';
import 'package:imap/pages/route_generator.dart';
import 'widgets/sample_body.dart';

void main(){

  Function duringSplash = () {
    print('Something background process');
    int a = 123 + 23;
    print(a);

    if (a > 100)
      return 1;
    else
      return 2;
  };

  



  //debugPaintSizeEnabled = true;
  //runApp(new MyApp());

  runApp(MaterialApp(

  
    initialRoute: '/',
/*     routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      //'/': (context) => MyApp(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      //'/route': (context) => RootPage(auth: new Auth()),
      //'/route': (context) => RootPage(auth: new Auth()),
      '/login': (context) => LoginSignUpPage(auth: new Auth()),
      loginRoute: (context) => LoginSignUpPage(auth: new Auth()),
    }, */
    onGenerateRoute: RouteGenerator.generateRoute,




    title: 'IMap !',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),





    debugShowCheckedModeBanner: false,
    home: CustomSplash(
      
      imagePath: 'assets/world.png',
      backGroundColor: Colors.white,
      // backGroundColor: Color(0xfffc6042),
      animationEffect: 'zoom-in',
      logoSize: 200,

      home: MyHomePage(),//home: MyApp()

      customFunction: duringSplash,
      duration: 2500,
      type: CustomSplashType.StaticDuration,
      //outputAndHome: op,
    ),
  ));

  

} 

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(//MaterialApp

    );
  }
}


class MyApp2 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(//MaterialApp
      title: 'IMap !',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}




class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Add a container and provide a linear gradient.
    //basically use different shades of same color.
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [MyColors.white1, MyColors.white2])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[Header(), Body()],
          ),
        ),
      ),
    );
  }
}

class SamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Add a container and provide a linear gradient.
    //basically use different shades of same color.
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [MyColors.white1, MyColors.white2])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[Header(), SampleBody()],
          ),
        ),
      ),
    );
  }
}