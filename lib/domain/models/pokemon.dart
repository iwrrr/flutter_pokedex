class Pokemon {
  Pokemon({required this.page, required this.name, required this.url});

  final int page;
  final String name;
  final String url;

  String get number =>
      url.split("/").sublist(0, url.split("/").length - 1).last;

  String numberString() {
    switch (number.length) {
      case 1:
        return "#00$number";
      case 2:
        return "#0$number";
      default:
        return "#$number";
    }
  }

  String get imageUrl =>
      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$number.png";
}
