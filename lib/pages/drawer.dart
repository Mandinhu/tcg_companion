import 'package:flutter/material.dart';
import 'package:tcg_companion/main.dart';
import 'package:tcg_companion/pages/addArtists.dart';
import 'package:tcg_companion/pages/eventupload.dart';
import 'package:tcg_companion/pages/userRegister.dart';

import 'addTournaments.dart';

class tcg_Drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://avatarfiles.alphacoders.com/199/thumb-199068.jpg'),
              ),
              accountName: Text(
                  "Mandinhu"
              ),
              accountEmail: Text(
                  "pedromathies@gmail.com"
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              subtitle: Text("Lista de Eventos."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.add_box),
              title: Text("Add Event"),
              subtitle: Text("Adicionar Eventos."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EventUpload()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.add_box),
              title: Text("Adiciona Usuário"),
              subtitle: Text("Adicionar Usuário."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserRegister()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.add_box),
              title: Text("Adiciona Artista"),
              subtitle: Text("Adicionar Artista."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddArtists()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.add_box),
              title: Text("Adiciona Torneio"),
              subtitle: Text("Adicionar Torneio."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddTournaments()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
