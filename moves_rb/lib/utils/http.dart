import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/poke.dart';

const pokeApiUrl = 'https://pokeapi.co/api/v2/pokemon';

class HttpHelper {
  // https://pokeapi.co/api/v2/pokemon/eevee/
  final String authority = 'pokeapi.co';
  final String unencodedPath = 'api/v2/pokemon';
  //final String apiKey = 'pokemon';

  Future<Pokemon> getPokemon(String name) async {
    var url = Uri.parse('$pokeApiUrl/$name');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<dynamic> allMoves = data['moves'];
      List<String> pokeMovesMatch = [];
      String moveName = data['moves'][0]['move']['name'];
      var generation =
          data['moves'][1]['version_group_details'][1]['version_group']['name'];
      for (int i = 0; i < allMoves.length; i++) {
        var gen =
            allMoves[i]["version_group_details"][0]["version_group"]["name"];
        var learnMethod = allMoves[i]["version_group_details"][0]
            ['move_learn_method']['name'];
        if (gen == "red-blue" && learnMethod == 'level-up') {
          print(
              '${allMoves[i]['move']['name']} lv: ${allMoves[i]["version_group_details"][0]['level_learned_at']} , method: ${learnMethod}');
          pokeMovesMatch.add(allMoves[i]['move']['name']);
          print(pokeMovesMatch);
        }
      }
      //print(generation);
      Pokemon pokemon = Pokemon(name, pokeMovesMatch);
      print('${pokemon.name} moves: ${pokemon.moves}');
      return pokemon;
    } else {
      print(response.statusCode);
      return Pokemon('err', ['moves', 'ER']);
    }
  }

  Future<dynamic> getData(String name) async {
    var url = Uri.parse('$pokeApiUrl/$name');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print(response.body);
      return data;
    } else {
      print(response.statusCode);
    }
  }
}
