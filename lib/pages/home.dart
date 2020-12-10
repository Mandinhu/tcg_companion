import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';
import 'eventPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TCG Companion'),
        backgroundColor: Colors.black,
      ),
      drawer: tcg_Drawer(),
      body: _body(context),
      backgroundColor: Colors.black,
    );
  }

  Column _body(context) {
    return Column(
      children: <Widget>[
        _fotosMain(),
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('events').snapshots(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                default:
                  List<DocumentSnapshot> events = snapshot.data.documents;
                  return ListView.builder(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 050),
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      return Card(
                          child: ListTile(
                            leading: Image.network(events[index].data["photo"]),
                            title: Text(events[index].data['name']),
                            subtitle: Text("Data: ${events[index].data["date"]}"),
                          onTap: (){
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => new EventPage(event: events[index]))
                            );
                          },
                        )
                      );
                    },
                  );
              }
            },
          ),
        ),
      ],
    );
  }
  _fotosMain() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
      height: 220,
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
      fit: BoxFit.fill,
    );
  }
}
