import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rsvp/screens/detail_page.dart';
import 'package:transparent_image/transparent_image.dart';

class ItemCard extends StatefulWidget{
  final heroTag, imageUrl;

  const ItemCard({Key key, this.heroTag, this.imageUrl}) : super(key: key);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard>{
  double locationOpacity = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      AspectRatio(
                        child: Container(
                          child: Center(
                            child: Text("Loading.."),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black12
                          ),
                        ),
                        aspectRatio: 16 / 9,
                      ),
                      Hero(
                        tag: widget.heroTag,
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: widget.imageUrl,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: AnimatedOpacity(
                          duration: Duration(milliseconds: 200),
                          opacity: locationOpacity,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 14),
                            decoration: BoxDecoration(
                              color: Colors.black54
                            ),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: Text(
                                    "Bounche Office Indonesia",
                                    style: TextStyle(
                                      color: Colors.white
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.date_range),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text("24/12/2020"),
                              )
                            ],
                          ),
                        ),
                        ListTile(
                          title: Text(
                            "Buka Bar-Bar Bounche",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                            ),
                          ),
                          subtitle: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. In maximus pellentesque ipsum vel placerat. Nulla et nulla condimentum, viverra mi at, pellentesque sem. Vestibulum condimentum laoreet laoreet."),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () async{
                      setState(() {
                        locationOpacity = 0;
                      });
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            heroTag: widget.heroTag,
                            imageUrl: widget.imageUrl,
                          )
                        )
                      );
                      Timer(Duration(milliseconds: 100), (){
                        setState(() {
                          locationOpacity = 1;
                        });
                      });
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      );
  }
}