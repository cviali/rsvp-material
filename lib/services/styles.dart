import 'package:flutter/material.dart';

const fontFamily = "Montserrat";

//colors
const rsvpGreen = Color(0xFF77E21A);
const rsvpRed = Color(0xFFDE4E40);
const rsvpGrey = Color(0xFF707070);

//components
class BodyPadding extends StatelessWidget{
  final child;
  const BodyPadding({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: child,
    );
  }
}

class ColumnSpacer extends StatelessWidget{
  final value;

  const ColumnSpacer({Key key, this.value = 10.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: value));
  }
}

class RowSpacer extends StatelessWidget{
  final value;

  const RowSpacer({Key key, this.value = 10.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left: value));
  }
}

Widget textPrimary1(String string) => Padding(
  padding: const EdgeInsets.only(bottom: 20),
  child: Text(
    string.toUpperCase(),
    style: TextStyle(
      fontFamily: fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: rsvpGrey
    ),
  ),
);

Widget textPrimary2(String string) => Padding(
  padding: const EdgeInsets.only(bottom: 16),
  child: Text(
    string.toUpperCase(),
    style: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: rsvpGrey
    ),
  ),
);

class PrimaryButton extends StatelessWidget{
  final child, onPressed;

  const PrimaryButton({Key key, this.child, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      child: Text(
        child.toString().toUpperCase(),
        style: TextStyle(
          color: Colors.white
        ),
      ),
      onPressed: onPressed,
    );
  }
}

class GoogleButton extends StatelessWidget{
  final child, onPressed;

  const GoogleButton({Key key, this.child, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: rsvpRed,
      child: Text(
        child.toString().toUpperCase(),
        style: TextStyle(
          color: Colors.white
        ),
      ),
      onPressed: onPressed,
    );
  }
}

class SecondaryButton extends StatelessWidget{
  final child, onPressed;

  const SecondaryButton({Key key, this.child, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      textColor: Theme.of(context).primaryColor,
      borderSide: BorderSide(color: Theme.of(context).primaryColor),
      child: Text(
        child.toString().toUpperCase(),
        style: TextStyle(
          color: Theme.of(context).primaryColor
        ),
      ),
      onPressed: onPressed,
    );
  }
}

