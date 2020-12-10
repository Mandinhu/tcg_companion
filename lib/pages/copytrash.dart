import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';


  class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  static const String _title = "TCG Companion Event";

   Future getEvents() async {
    var firestore = Firestore.instance;
     print("Teste Firebase 1");
     QuerySnapshot qn = await firestore.collection("events").getDocuments();
    return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_title),
        backgroundColor: Colors.black,
      ),
      drawer: tcg_Drawer(),
      body: _body(context),
    );
  }

  Column _body(context) {
    return Column(
      children: <Widget>[
        _fotosmain(),
        _buildBody(context),
      ],
    );
  }

  _fotosmain() {
    return Container(
      padding: EdgeInsets.fromLTRB(2, 0, 2, 112),
      height: 350,
      width: 500,
      child: PageView(
        children: <Widget>[
          _foto(
              'mainphoto.jpg'
          ),
        ],
      ),
    );
  }

  Image _foto(String path) {
    return Image.asset(
      'images/' + path,
      fit: BoxFit.contain,
    );
  }

  Widget _buildBody(BuildContext context) {
    Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: FutureBuilder(
            future: getEvents(),
            builder: (_, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting) {
                return new Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.lenght,
                  itemBuilder: (_, index) {
                    return Container(
                      height: 60,
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          stops: [0.015, 0.015],
                          colors: [Colors.black, Colors.red],
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      child: Card(
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(snapshot.data[index].data["name"]),
                              Text(snapshot.data[index].data["date"]),
                            ],
                          ),
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Image.network(snapshot.data[index].data["photo"]),
                          ),
                        ),
                      ),
                    );
                  }
                );
              }
            }
          ),
        )
      ],
    );
  }
}
