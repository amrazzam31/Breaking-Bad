class Quote {
/*
{
  "quote_id": 9,
  "quote": "Funyuns are awesome.",
  "author": "Jesse Pinkman",
  "series": "Breaking Bad"
} 
*/

  late int quoteId;
  late String quote;
  late String author;
  late String series;


  Quote.fromJson(Map<String, dynamic> json) {
    quoteId = json['quote_id'].toInt();
    quote = json['quote'].toString();
    author = json['author'].toString();
    series = json['series'].toString();
  }
}
