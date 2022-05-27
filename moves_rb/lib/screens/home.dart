import 'package:flutter/material.dart';
import '../models/poke.dart';
import '../utils/http.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HttpHelper http = HttpHelper();
  String pokeName = '';
  Pokemon pokemonResult = Pokemon('', [], '');
  List<Text> moves = [];

  void updateUI(String pokeName) async {
    var receveidPoke = await http.getPokemon(pokeName);
    for (int i = 0; i < receveidPoke.moves.length; i++) {
      moves.add(Text(receveidPoke.moves[i]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokes'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 8, 0, 0),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        pokeName = value;
                        print(pokeName);
                      });
                    },
                  ),
                ),
              ),
              IconButton(
                onPressed: () async {
                  final dataReceived =
                      await http.getPokemon(pokeName.toLowerCase());
                  setState(() {
                    pokemonResult = dataReceived;
                    moves = [];
                    for (int i = 0; i < pokemonResult.moves.length; i++) {
                      moves.add(Text(pokemonResult.moves[i]));
                    }
                  });
                },
                icon: Icon(
                  Icons.search,
                  size: 40,
                ),
              ),
            ],
          ),
          pokemonResult.sprite == ''
              ? Text('')
              : Image(
                  image: NetworkImage(pokemonResult.sprite),
                ),
          Column(
            children: moves == [] ? [Text('movesvazio')] : moves,
          )
        ],
      ),
    );
  }
}
