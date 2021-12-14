import 'package:breaking_bad/data/models/character.dart';
import 'package:breaking_bad/data/models/quote.dart';
import 'package:breaking_bad/data/web_services%20/characters_web_services.dart';

class CharactersRepository {
  final CharactersWebServices charactersWebServices;
  CharactersRepository(this.charactersWebServices);

  Future<List<Character>> getAllCharacters() async {
    final characters = await charactersWebServices.getAllCharacters();
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }
  Future<List<Quote>> getCharacterQuotes(String characterName) async {
    final Quotes = await charactersWebServices.getCharacterQuotes(characterName);
    return Quotes
        .map((characterQuote) => Quote.fromJson(characterQuote))
        .toList();
  }
}
