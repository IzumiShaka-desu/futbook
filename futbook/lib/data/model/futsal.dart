class Futsal {
  String? imageUrl;
  String? name;
  String? desc;
  String? price;
  String get urlOfImage =>
      "https://raw.githubusercontent.com/IzumiShaka-desu/gif_host/main/img/$imageUrl";
  Futsal({this.desc, this.imageUrl, this.name, this.price});
  static List<Futsal> get dummies => [
        Futsal(
            imageUrl: "d.jpg",
            name: "karya futsal",
            price: "10",
            desc: "lorem ipsum" * 10),
        Futsal(
            imageUrl: "e.jpg",
            name: "emas futsal",
            price: "8",
            desc: "lorem ipsum" * 10),
        Futsal(
            imageUrl: "f.jpg",
            name: "maju futsal",
            price: "10",
            desc: "lorem ipsum" * 10),
        Futsal(
            imageUrl: "a.jpg",
            name: "212 futsal",
            price: "10",
            desc: "lorem ipsum" * 10),
        Futsal(
            imageUrl: "b.jpg",
            name: "cahaya futsal",
            price: "8",
            desc: "lorem ipsum" * 10),
        Futsal(
            imageUrl: "c.jpg",
            name: "sinar futsal",
            price: "10",
            desc: "lorem ipsum" * 10)
      ];
}
