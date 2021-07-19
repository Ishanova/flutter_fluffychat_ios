import 'package:flutter/cupertino.dart';
import 'package:flutter_fluffychat_ios/helper/colors.dart';

class Avatarka extends StatefulWidget {
  final image;
  final isOnline;

  Avatarka(this.image, this.isOnline);

  @override
  _AvatarkaState createState() => _AvatarkaState();
}

class _AvatarkaState extends State<Avatarka> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(16, 8, 8, 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(widget.image, width: 56, height: 56,),
          ),
        ),

        Visibility(
            visible: widget.isOnline ? true : false,
            child: Container(
              margin: EdgeInsets.fromLTRB(42, 46, 6, 2),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                      color: blue.withOpacity(0.5)
                  )
                ],
                color: green,
                shape: BoxShape.circle,
              ),
            )
        )
      ],
    );
  }
}