import 'package:flutter/material.dart';
import 'package:imap/pages/login_signup_page.dart';
import 'package:imap/pages/root_page.dart';
import 'package:imap/services/authentication.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:imap/models/todo.dart';
import 'dart:async';
import 'package:imap/constants.dart';
import 'package:imap/widgets/bottom_navigationBar.dart';
import 'page_search.dart';
import 'page_coming_soon.dart';
import 'page_profile.dart';
import 'page_settings.dart';





import 'package:flutter/services.dart';
import 'package:imap/utils/utils.dart';
import 'package:imap/widgets/widgets.dart';

import 'package:imap/pages/home_page.dart';


import 'package:imap/main.dart';
import 'route_generator.dart';


class SettingPage extends StatefulWidget {
   SettingPage({Key key, this.auth, this.userId
    , this.onSignedOut
    })
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;
  @override
  _SettingPageState createState() => _SettingPageState();
}

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}

class _SettingPageState extends State<SettingPage> {


  _signOut() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }
  
  String _userId = "";
  Screen size;
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;

  bool isLocalNotification = false;
  bool isPushNotification = true;
  bool isPrivateAccount = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {


    widget.auth.getCurrentUser().then((user){
      setState(() {
        _userId = user.uid.toString();
      });
    });



    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        //title: Text("Settings $_userId",
        title: Text("$_userId",
            style:
                TextStyle(fontFamily: "Exo2", color: textSecondaryLightColor)),
            backgroundColor: Colors.white,
      ),
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle(
            statusBarColor: backgroundColor,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarIconBrightness: Brightness.light,
            systemNavigationBarColor: backgroundColor),
        child: Container(
          color: backgroundColor,
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              children: <Widget>[
                accountSection(),
                pushNotificationSection(),
                getHelpSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SettingSection getHelpSection() {
    return SettingSection(
      headerText: "Get Help".toUpperCase(),
      headerFontSize: 15.0,
      headerTextColor: Colors.black87,
      backgroundColor: Colors.white,
      disableDivider: false,
      children: <Widget>[
        Container(
          child: TileRow(
            label: "Contact Us",
            disableDivider: false,
            onTap: () {},
          ),
        ),
        Container(
          child: TileRow(
            label: "Terms and Condition",
            disableDivider: false,
            onTap: () {},
          ),
        ),
        Container(
          child: TileRow(
            label: "Feedback",
            disableDivider: false,
            onTap: () {},
          ),
        ),
        Container(
          child: TileRow(
            label: "Log out",
            disableDivider: false,
            onTap: () {
              _signOut();
              //Navigator.pushNamed(context, '/login');
              //Navigator.of(context).pushNamed('/login');

              //Navigator.push(context, RouteGenerator.generateRoute());

              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => RootPage(auth: new Auth(),),));
              

              //_signOut();
            },
          ),
        )
      ],
    );
  }

  SettingSection accountSection() {
    return SettingSection(
      headerText: "Account".toUpperCase(),
      headerFontSize: 15.0,
      headerTextColor: Colors.black87,
      backgroundColor: Colors.white,
      disableDivider: false,
      children: <Widget>[
        Container(
          child: TileRow(
            label: "User Name",
            disabled: true,
            rowValue: "harsh719",
            disableDivider: false,
            onTap: () {},
          ),
        ),
        Container(
          child: SwitchRow(
            label: "Private Account",
            disableDivider: false,
            value: isPrivateAccount,
            onSwitchChange: (switchStatus) {
              setState(() {
                switchStatus
                    ? isPrivateAccount = true
                    : isPrivateAccount = false;
              });
            },
            onTap: () {},
          ),
        ),
        Container(
          child: TileRow(
            label: "Change Password",
            disableDivider: false,
            onTap: () {},
          ),
        )
      ],
    );
  }

  SettingSection pushNotificationSection() {
    return SettingSection(
      headerText: "Push Notifications".toUpperCase(),
      headerFontSize: 15.0,
      headerTextColor: Colors.black87,
      backgroundColor: Colors.white,
      disableDivider: false,
      children: <Widget>[
        Container(
          child: SwitchRow(
            label: "Push Notification",
            disableDivider: false,
            value: isPushNotification,
            onSwitchChange: (switchStatus) {
              setState(() {
                switchStatus
                    ? isPushNotification = true
                    : isPushNotification = false;
              });
            },
            onTap: () {},
          ),
        ),
        Container(
          child: SwitchRow(
            label: "Local Notification",
            disableDivider: false,
            value: isLocalNotification,
            onSwitchChange: (switchStatus) {
              setState(() {
                switchStatus
                    ? isLocalNotification = true
                    : isLocalNotification = false;
              });
            },
            onTap: () {},
          ),
        )
      ],
    );
  }
}
