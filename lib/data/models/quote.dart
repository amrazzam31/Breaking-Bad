class Quote {
/*
{
  "quote_id": 9,
  "quote": "Funyuns are awesome.",
  "author": "Jesse Pinkman",
  "series": "Breaking Bad"
} 
*/

  int? quoteId;
  String? quote;
  String? author;
  String? series;

  Quote({
    this.quoteId,
    this.quote,
    this.author,
    this.series,
  });
  Quote.fromJson(Map<String, dynamic> json) {
    quoteId = json['quote_id']?.toInt();
    quote = json['quote']?.toString();
    author = json['author']?.toString();
    series = json['series']?.toString();
  }
}
