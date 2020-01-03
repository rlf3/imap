import 'package:flutter/material.dart';
import 'package:imap/utils/strings.dart';
import 'package:imap/utils/myColors.dart';
import 'package:imap/widgets/emailBox.dart';
import 'package:imap/utils/responsive_widget.dart';

var backgroundImage = "assets/world.png";

class SampleBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: LargeScreen(),
      smallScreen: SmallScreen(),
    );
  }
}

class LargeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[addBackground(), addWelcomeText()],
      ),
    );
  }

  //Adds background Image
  Widget addBackground() {
    return FractionallySizedBox(
      alignment: Alignment.centerRight, //to keep images aligned to right
      widthFactor: .6, //covers about 60% of the screen width
      child: Image.asset(
        backgroundImage,
        scale: .85,
      ),
    );
  }

  //Adds welcome text
  Widget addWelcomeText() {
    return FractionallySizedBox(
      alignment: Alignment.centerLeft, //text aligned to left side
      widthFactor: .5, // 6 covers about half of the screen
      child: Padding(
        padding: EdgeInsets.only(left: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sample of Maps',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 60,
                color: MyColors.blue4,
              ),
            ),
            RichText(
              text: TextSpan(
                  text: Strings.welcomeTo,
                  style: TextStyle(fontSize: 60, color: MyColors.blue4),
                  children: [
                    TextSpan(
                        text: Strings.ftf,
                        style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54))
                  ]),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.0, top: 20),
              child: Text(Strings.subscribeText),
            ),
            SizedBox(
              height: 40,
              //width: 60,
            ),
            //
            Padding(
              padding: EdgeInsets.only(left: 12.0, top: 20),
              child: EmailBox(),              
            ), //Give some spacing,
//            EmailBox(),
            SizedBox(
              height: 40,
              //width: 60,
            ),            
          ],
        ),
      ),
    );
  }
}

class SmallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Sample of maps',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: MyColors.blue4,
              ),
            ),
            RichText(
              text: TextSpan(
                  text: Strings.welcomeTo,
                  style: TextStyle(fontSize: 40, color: MyColors.blue4),
                  children: [
                    TextSpan(
                        text: Strings.ftf,
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54))
                  ]),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Image.asset(
                backgroundImage,
                scale: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.0, top: 20),
              child: Text(Strings.subscribeText),
            ),
            SizedBox(
              height: 30,
            ),
            EmailBox(),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
