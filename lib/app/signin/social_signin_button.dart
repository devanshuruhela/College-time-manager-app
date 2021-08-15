import 'package:flutter/material.dart';
import 'package:movieapp/common_widgets/custom_raised_button.dart';

class SocialSignInButton extends CustomRaisedButton {
  SocialSignInButton({
    @required String assestName,
    @required String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  }) : super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(assestName),
              Text(
                text,
                style: TextStyle(color: textColor, fontSize: 15.0),
              ),
              Opacity(opacity: 0, child: Image.asset(assestName)),
            ],
          ),
          color: color,
          onPressed: onPressed,
        );
}
