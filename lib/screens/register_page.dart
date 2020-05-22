import 'package:flutter/material.dart';
import 'package:rsvp/services/styles.dart';
import 'package:rsvp/services/utilities.dart';

class RegisterPage extends StatefulWidget{
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>{
  final registerKey = new GlobalKey<FormState>();
  bool showPassword = true, showConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BodyPadding(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    textPrimary1(AppLocalizations.of(context).translate('register'))
                  ],
                ),
                Form(
                  key: registerKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: AppLocalizations.of(context).translate('name')
                        ),
                      ),
                      ColumnSpacer(),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: AppLocalizations.of(context).translate('emailAddress')
                        ),
                      ),
                      ColumnSpacer(),
                      TextFormField(
                        obscureText: showConfirmPassword,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: AppLocalizations.of(context).translate('password'),
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.remove_red_eye,
                              color: showConfirmPassword ?
                              rsvpGrey : Theme.of(context).primaryColor,
                            ),
                            onPressed: (){
                              FocusScope.of(context).unfocus();
                              setState(() {
                                showConfirmPassword = !showConfirmPassword;
                              });
                            }
                          )
                        ),
                      ),
                      ColumnSpacer(),
                      TextFormField(
                        obscureText: showPassword,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: AppLocalizations.of(context).translate('confirmPassword'),
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.remove_red_eye,
                              color: showPassword ?
                              rsvpGrey : Theme.of(context).primaryColor,
                            ),
                            onPressed: (){
                              FocusScope.of(context).unfocus();
                              setState(() {
                                showPassword = !showPassword;
                              });
                            }
                          )
                        ),
                      ),
                      ColumnSpacer(),
                      SizedBox(
                        width: double.infinity,
                        child: PrimaryButton(
                          child: AppLocalizations.of(context).translate("register"),
                          onPressed: (){
                            print('login');
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}