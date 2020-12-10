import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';


class Artists extends StatelessWidget {
  @override
        Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Artistas'),
          backgroundColor: Colors.black,
        ),
        drawer: tcg_Drawer(),
        body: _body(context),
        backgroundColor: Colors.black,
      );
    }

  _body(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('artists').snapshots(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                default:
                  List<DocumentSnapshot> artists = snapshot.data.documents;
                  return ListView.builder(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 050),
                    itemCount: artists.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          Text(
                            artists[index].data["name"],
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 35,
                            ),
                          ),
                          Image.network(artists[index].data["photo"]),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Image.network(
                                artists[index].data["exemple1"],
                                height: 200,
                                width: 200,
                              ),
                              new Image.network(
                                artists[index].data["exemple2"],
                                height: 200,
                                width: 200,
                              )
                            ]
                          )
                        ],
                      );
                    }
                  );
              }
            },
          ),
        ),
      ],
    );
  }
}