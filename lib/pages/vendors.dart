import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';


class Vendors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vendors'),
        backgroundColor: Colors.black,
      ),
      drawer: tcg_Drawer(),
      body: _body(context),
      backgroundColor: Colors.grey,
    );
  }

  _body(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('vendors').snapshots(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                default:
                  List<DocumentSnapshot> vendors = snapshot.data.documents;
                  return ListView.builder(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 50),
                      itemCount: vendors.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: <Widget>[
                            new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Image.network(
                                    vendors[index].data["logo"],
                                    height: 150,
                                    width: 200,
                                  ),
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
        new RaisedButton(
            child: new Text("Voltar"),
            textColor: Colors.white,
            color: Colors.blueGrey,
            onPressed: () {
              // Navigate back to first screen when tapped!
              Navigator.pop(context);
            }
        ),
      ],
    );
  }
}