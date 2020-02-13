import 'package:flutter/material.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:flushbar/flushbar.dart';

class TopBarWidgets {
  static Widget build(
    int index,
    double tileSize,
    Color color,
    BuildContext context,
  ) {
    switch (index) {
      case 0:
        return _buildXPBar(tileSize, color, 34000, context);

      case 1:
        return _buildCashBar(tileSize, color, 50000, context);

      case 2:
        return _buildGemBar(tileSize, color, context);

      case 3:
        return null;

      case 4:
        return null;

      case 5:
        return null;

      default:
        return null;
    }
  }

  static Widget _buildCashBar(
      double tileSize, Color color, int cash, BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: color,
      child: Container(
        margin: EdgeInsets.all(5),
        height: tileSize * 0.5 + 4.0,
        alignment: Alignment.topLeft,
        child: IconTheme.merge(
          data: IconThemeData(
            size: tileSize * 0.7,
            color: Color.fromRGBO(22, 255, 255, 1.0),
          ),
          child: Row(
            children: <Widget>[
              Icon(Icons.attach_money),
              Text(
                // TODO: string with commas (50000 -> 50,000)
                cash.toString(),
                style: TextStyle(
                  color: Colors.green[600],
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildGemBar(
      double tileSize, Color color, BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: color,
      child: Container(
        margin: EdgeInsets.all(5),
        height: tileSize * 0.5 + 4.0,
        alignment: Alignment.topLeft,
        child: IconTheme.merge(
          data: IconThemeData(
            size: tileSize * 0.7,
            color: Color.fromRGBO(255, 255, 22, 1.0),
          ),
          child: Icon(Icons.account_balance),
        ),
      ),
    );
  }

  static Widget _buildXPBar(
      double tileSize, Color color, int xp, BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: color,
      child: Container(
        // NOTE: if you change this, make sure to see below notes
        margin: EdgeInsets.all(5),
        height: tileSize * 0.5 + 4.0,
        child: Stack(
          overflow: Overflow.visible,
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: RoundedProgressBar(
                // - 1.0 to allow space for the border top+bottom (0.5 + 0.5)
                height: tileSize * 0.5 - 1.0,
                style: RoundedProgressBarStyle(
                  colorBackgroundIcon: Color(0xffc0392b),
                  colorProgress: Color(0xffe74c3c),
                  colorProgressDark: Color(0xffc0392b),
                  colorBorder: Color(0xff2c3e50),
                  backgroundProgress: Color(0xff4a627a),
                  borderWidth: 0.5,
                  widthShadow: 0.0,
                ),
                margin: EdgeInsets.symmetric(vertical: 2.0),
                borderRadius: BorderRadius.circular(8.0),
                percent: 80.0,
              ),
            ),
            Positioned(
              // NOTE: 10.0 b/c of the 5.0 margin that's in very parent.
              top: ((tileSize * 0.5) / 2.0) -
                  (((tileSize * 0.5 + 10.0) / 2.0) + 10.0),
              // this is somewhat variable
              left: -15.0,
              // alignment: Alignment.topLeft,
              child: IconButton(
                // NOTE: see above note
                iconSize: tileSize * 0.7 + 10.0,
                onPressed: () {
                  Flushbar(
                    title: "show the profile",
                    message:
                        "Temporary widget, just to show that it's a clickable widget",
                    icon: Icon(
                      Icons.info_outline,
                      size: 28.0,
                      color: Colors.blue[900],
                    ),
                    boxShadows: [
                      BoxShadow(
                        color: Colors.blue[800],
                        offset: Offset(0.0, 2.0),
                        blurRadius: 3.0,
                      )
                    ],
                    isDismissible: false,
                    duration: Duration(seconds: 2),
                    leftBarIndicatorColor: Colors.blue[900],
                  )..show(context);
                },
                icon: Icon(
                  Icons.ac_unit,
                  color: Color.fromRGBO(255, 255, 22, 1.0),
                  // size: tileSize * 0.7,
                ),
              ),
            ),
            Positioned(
              top: 5.0,
              right: 5.0,
              child: Text(
                // TODO: add commas and maybe add the amt of xp needed for next level. e.g: 450/500
                xp.toString(),
                overflow: TextOverflow.visible,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
