import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tcg_companion/pages/artists.dart';
import 'package:tcg_companion/pages/map.dart';
import 'package:tcg_companion/pages/tournaments.dart';
import 'package:tcg_companion/pages/vendors.dart';

import 'drawer.dart';

class EventPage extends StatelessWidget {
  final DocumentSnapshot event; // = Firestore.instance.collection('events').doc().get();

  const EventPage({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event["name"]),
        backgroundColor: Colors.black,
      ),
      drawer: tcg_Drawer(),
      body: _body(context),
      backgroundColor: Colors.grey,
    );
  }


   _body(context){
    return Center(
      child: Column(
        children: <Widget>[
          Image.network(
            event["photo"],
            height: 300,
            width: 300,
          ),
          _buttons1(context),
          _buttons2(context),
          _qna()
        ],
      )
    );
  }

  _buttons1(context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new RaisedButton(
            child: new Text("Artistas"),
            textColor: Colors.white,
            color: Colors.blueGrey,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Artists()),
              );
            }
        ),
        new RaisedButton(
            child: new Text("Vendedores"),
            textColor: Colors.white,
            color: Colors.blueGrey,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Vendors()),
              );
            }
        ),
        new RaisedButton(
            child: new Text("Mapa"),
            textColor: Colors.white,
            color: Colors.blueGrey,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Map()),
              );
            }
        ),
    ]
    );
  }
  _buttons2(context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new RaisedButton(
              child: new Text("Torneios"),
              textColor: Colors.white,
              color: Colors.blueGrey,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Tournaments()),
                );
              }
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
        ]
    );
  }
  _qna() {
    return Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          new Text(
            "Perguntas mais Frequentes!\n\n"
            "Horário de Abertura e Fechamento:\n"
            "09:00h - 19:00h\n\n"
            "Dias do Evento:\n"
            "${event["date"]}\n\n",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
        ]
    );
  }
}
