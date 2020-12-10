import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';
import 'eventPage.dart';

class Tournaments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Torneios'),
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
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('tournaments').snapshots(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                default:
                  List<DocumentSnapshot> tournaments = snapshot.data.documents;
                  return ListView.builder(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 050),
                    itemCount: tournaments.length,
                    itemBuilder: (context, index) {
                      return Card(
                          child: ListTile(
                            title: Text(tournaments[index].data['name']),
                            subtitle: Text("Horário: ${tournaments[index].data["time"]} - Valor de Inscrição: R\$${tournaments[index].data["subs"]}"),
                            onTap: (){

                            },
                          )
                      );
                    },
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
        )
      ],
    );
  }
}
