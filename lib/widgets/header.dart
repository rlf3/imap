import 'dart:io';

import 'package:flutter/material.dart';
import 'package:imap/utils/myColors.dart';
import 'package:imap/utils/strings.dart';
import 'package:imap/utils/responsive_widget.dart';


class Header extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 38),
      child: buildHeader(context),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[buildLogo(), buildHeaderLinks(context)],
    );
  }

  //Builds navigation links at the right top of landing page
  Widget buildHeaderLinks(BuildContext context) {
    if (!ResponsiveWidget.isSmallScreen(context))
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        //children: getLinksListing()..add(buildLoginButton()),
        children: <Widget>[
          getLinksListing(),
          //buildLoginButton(),
        ],
      );
    else
      //return Image.asset("assets/menu.png", width: 25, height: 25);
      return PopupMenuButton<int>(
          itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Text("Home"),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text("Samples"),
                ),
                PopupMenuItem(
                  value: 3,
                  child: Text("Videos"),
                ),
                PopupMenuItem(
                  value: 4,
                  child: Text("Plugins"),
                ),    
                PopupMenuItem(
                  value: 5,
                  child: Text("Login", style: TextStyle(color: MyColors.blue1, fontWeight: FontWeight.w700),),
                ),       
                                                      
              ],
              onSelected: (value) {
              print("value:$value");
              },
        );








  }

  //Builds navigation list for header
  List<Widget> getLinksListingO() {
    var links = ["Home", "Samples", "Videos", "Plugins"];
    return links.map((link) {
      return Padding(
        padding: EdgeInsets.only(left: 18),
        child: Text(
          link,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      );
    }).toList();
  }

  Widget getLinksListing() {
    
    return  ButtonBar(
      children: <Widget>[
        FlatButton(
          child: Text('Home'),
          onPressed: null,
        ),
        FlatButton(
          child: Text('Samples'),
          onPressed: null,
        ),
        FlatButton(
          child: Text('videos'),
          onPressed: null,
        ),
        FlatButton(
          child: Text('Plugins'),
          onPressed: null,
        ),       
        FlatButton(
          child: Text('Login', style: TextStyle(color: MyColors.blue1, fontWeight: FontWeight.w700),
          ),
          onPressed: null,
        ),             
        //buildLoginButton(),             
      ],
    );
  }






  //Builds and decorates login button
  Widget buildLoginButton() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: InkWell(
        child: Container(
          margin: EdgeInsets.only(left: 20),
          width: 120,
          height: 40,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [MyColors.blue1, MyColors.blue2],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: MyColors.blue3.withOpacity(0.3),
                    offset: Offset(0, 8), //Shadow starts at x=0, y=8
                    blurRadius: 8)
              ]),
          child: Material(
            color: Colors.transparent,
            child: Center(
              child: InkWell(//Text
                child: Text('Login',style: TextStyle(color: MyColors.white1, fontSize: 18, letterSpacing: 1),),
                onTap: () {},
                //Strings.loginButton,
                //style: TextStyle(color: MyColors.white1, fontSize: 18, letterSpacing: 1),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Builds rectangle with circular corners and Text on it and next to it as title
  Widget buildLogo() {
    return Row(
      children: <Widget>[
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: LinearGradient(
                colors: [MyColors.blue1, MyColors.blue2],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft),
          ),
          child: Center(
            child: Text(
              Strings.logoTitle,
              style: TextStyle(fontSize: 20, color: MyColors.white1),
              // style: TextStyle(fontSize: 30, color: MyColors.white1),
            ),
          ),
        ),
        //give some space between logo box and title
        SizedBox(
          width: 16,
        ),
        Text(
          Strings.appTitle,
          style: TextStyle(fontSize: 26),
        )
      ],
    );
  }
}
