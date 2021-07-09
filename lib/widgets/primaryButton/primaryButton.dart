import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class PrimaryButton extends StatelessWidget {
  final Function onTap;
  final Widget child;
  final bool loading;
  final Color buttonColor;

  PrimaryButton({
    this.onTap,
    this.child,
    this.loading = false,
    this.buttonColor = const Color(0xff372A22),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 30,
      child: ButtonTheme(
        height: 43,

        child: RaisedButton(
          color: buttonColor,
          elevation: 0,
          child: child,
          onPressed: onTap,
          // shape: new RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(12.0),
          // ),
        ),
      ),
    );
  }
}
