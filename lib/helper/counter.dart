import 'package:flutter/cupertino.dart';
import 'package:flutter_fluffychat_ios/helper/colors.dart';

class Counter extends StatelessWidget {
  int counter;
  bool flagTag;
  double width, height, blur, spread, opacity, textSize, padding;
  Color color;

  @override
  Widget build(BuildContext context) {
    return counter != 0 || counter == null
        ? Container(
            height: height,
            constraints: BoxConstraints(minWidth: width),
            margin: EdgeInsets.fromLTRB(4, 4, 0, 0),
            padding: EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(opacity),
                  spreadRadius: spread,
                  blurRadius: blur,
                )
              ],
            ),
            child: (counter == null)
                ? flagTag
                    ? Text(
                        "@",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "SFProText",
                        ),
                      )
                    : Text(
                        "",
                      )
                : Text(
                    "$counter",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontFamily: "SFProText",
                      fontSize: textSize,
                      color: white,
                    ),
                  ))
        : Container();
  }

  Counter(int size, [int counter, Color color]) {
    switch (size) {
      //small size
      case 0:
        this.width = 6;
        this.height = 6;
        this.blur = 1;
        this.spread = 1;
        this.opacity = 0.2;
        this.padding = 0;
        this.color = color ?? blue;
        this.flagTag = false;
        break;

      //medium size
      case 1:
        this.width = 17;
        this.height = 17;
        this.blur = 8;
        this.spread = 1;
        this.opacity = 0.5;
        this.counter = counter;
        this.color = color ?? blue;
        this.textSize = 11;
        this.padding = 4;
        this.flagTag = false;
        break;

      //large size
      case 2:
        this.width = 24;
        this.height = 24;
        this.blur = 8;
        this.spread = 2;
        this.opacity = 0.5;
        this.counter = counter;
        this.color = color ?? blue;
        this.textSize = 15;
        this.padding = 0;
        this.flagTag = false;

        break;

      case 3:
        this.width = 24;
        this.height = 24;
        this.blur = 8;
        this.spread = 2;
        this.opacity = 0.5;
        this.color = color ?? blue;
        this.textSize = 15;
        this.padding = 0;
        this.flagTag = true;
        break;
    }
  }
}
