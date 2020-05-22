import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailPage extends StatefulWidget{
  final heroTag, imageUrl;

  const DetailPage({Key key, this.heroTag, this.imageUrl}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 220.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "Detail",
                style: TextStyle(
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black87,
                      offset: Offset(5.0, 5.0),
                    ),
                  ]
                ),
              ),
              background: Hero(
                tag: widget.heroTag,
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                ),
              )
            ),
          ),
          SliverFillRemaining(
            child: Center(
              child: Column(
                children: <Widget>[
                  Text("Detail"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}