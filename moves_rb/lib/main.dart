import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moves_rb/utils/http.dart';

import 'models/poke.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ShowPokemon(),
    );
  }
}

class ShowPokemon extends StatefulWidget {
  const ShowPokemon({Key? key}) : super(key: key);

  @override
  State<ShowPokemon> createState() => _ShowPokemonState();
}

class _ShowPokemonState extends State<ShowPokemon> {
  HttpHelper http = HttpHelper();
  String pokeName = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokes'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (e) {
              print(e);
              setState(() {
                pokeName = e;
              });
            },
          ),
          TextButton(
            onPressed: () {
              http.getPokemon(pokeName);
            },
            child: Text('Fetch'),
          ),
        ],
      ),
    );
  }
}
