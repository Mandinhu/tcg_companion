import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';
import 'eventPage.dart';

class Map extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
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
        _subtitle(),
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
  _fotosMain() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
      height: 320,
      width: 500,
      child: PageView(
        children: <Widget>[
          _foto(
              'mapdefault.png'
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

  _subtitle() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Text(
          "Mesas e Palco Azul = Main Event",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 25,
          ),
        ),
        Text(
          "\nMesas e Palco Verde = Side Events",
          style: TextStyle(
          color: Colors.green,
          fontSize: 25,
          ),
        ),
      ]
    );
  }
}
