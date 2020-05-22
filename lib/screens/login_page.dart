import 'package:flutter/material.dart';
import 'package:rsvp/screens/dashboard_page.dart';
import 'package:rsvp/screens/register_page.dart';
import 'package:rsvp/services/styles.dart';
import 'package:rsvp/services/utilities.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  final loginKey = new GlobalKey<FormState>();
  bool showPassword = true;

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
                    textPrimary1(AppLocalizations.of(context).translate('login'))
                  ],
                ),
                Form(
                  key: loginKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: AppLocalizations.of(context).translate('emailAddress')
                        ),
                        initialValue: 'christianviali@yahoo.com',
                      ),
                      ColumnSpacer(),
                      TextFormField(
                        obscureText: showPassword,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: AppLocalizations.of(context).translate('password'),
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
                        initialValue: 'password',
                      ),
                      ColumnSpacer(),
                      SizedBox(
                        width: double.infinity,
                        child: PrimaryButton(
                          child: AppLocalizations.of(context).translate("go!"),
                          onPressed: (){
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DashboardPage()
                              )
                            );
                          },
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: SecondaryButton(
                          child: AppLocalizations.of(context).translate("register"),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterPage()
                              )
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: GoogleButton(
                          child: AppLocalizations.of(context).translate("loginGmail"),
                          onPressed: (){
                            print('google login');
                          },
                        ),
                      )
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