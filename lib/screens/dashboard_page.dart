import 'package:flutter/material.dart';
import 'package:rsvp/screens/detail_page.dart';
import 'package:rsvp/services/styles.dart';
import 'package:rsvp/widgets/item_card.dart';
import 'package:transparent_image/transparent_image.dart';

class DashboardPage extends StatefulWidget{
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>{
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  DateTime currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        DateTime now = DateTime.now();
        if (currentBackPressTime == null ||
          now.difference(currentBackPressTime) > Duration(seconds: 2)) {
          currentBackPressTime = now;
          final snackBar = SnackBar(
            content: Text("Press back again to exit the app."),
            duration: Duration(seconds: 2),
          );
          scaffoldKey.currentState.showSnackBar(snackBar);
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text('Dashboard'),
        ),
        body: BodyPadding(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (builder, index) => ItemCard(
              heroTag: 'itemImage'+index.toString(),
              imageUrl: 'https://picsum.photos/800/450',
            ),
          )
        )
      ),
    );
  }
}