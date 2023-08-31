class ItemThree {
  String imagepath;
  double price;
  String details;
  String name;
  ItemThree(
      {
        required this.name,
        required this.imagepath,
        required this.price,
        required this.details
      });
}

final List<ItemThree> items =
[
  ItemThree(
      name: "Narcissus flower",
      imagepath: "assets/photo/زهرة-النرجس.jpg",
      price: 180,
      details:
          "Narcissus "
          "Its color is sulfur-colored, and it usually branches out from one stem with two or more roses."
          "It is one of the flowers with a distinctive, picturesque scent, especially in the early morning.",
  ),
  ItemThree(
      name: "Grandiflora rose",
      imagepath: "assets/photo/ورد غرانديفلورا.jpg",
      price: 150,
      details:
          "The flowers of Grand Flora are similar to the flowers of the tea hybrid, and its stem is similar to the stem of Flori Bunda flowers,"
          "It is distinguished as a tall shrub, and it is also the favorite rose of Queen Elizabeth.",
  ),
  ItemThree(
      name: "Floor roses",
      imagepath: "assets/photo/ورود أرضية.jpg",
      price: 120,
      details:
         "It is one of the types of roses known as landscape roses. This type has evolved and is used in garden roses."
          "It provides a distinctive number of fragrance, shape and color, and is easy to care for.",
  ),
  ItemThree(
      name: "Flower Violet",
      imagepath: "assets/photo/زهرة-البنفسج.jpg",
      price: 100,
      details:
        "When the violet flower is fully grown, it looks like a small branched bush."
        "They are usually used to decorate homes, and they tend to be purple and white."
        "And you don't have a leg.",
      ),
  ItemThree(
      name: "Mini-flora",
      imagepath: "assets/photo/ميني-فلورا.jpg",
      price: 200,
      details:
         "Miniflora flowers are among the smallest flowers known around the world, with a length of less than 5 cm."
         "And its bushes do not exceed 50 cm, and it is usually grown in bottles.",
     ),
  ItemThree(
      name: "Blue lotus flower",
      imagepath: "assets/photo/زهرة اللوتس الزرقاء.jpeg",
      price: 150,
      details:
          "This blue type was very well known in the Pharaonic civilization and was distinguished by several other names such as the sacred blue lily and the blue water lily."
          "This species settled and spread in the past along the banks of the Nile River and some parts of East Africa. Like all other species, it submerges under water at the beginning of the nightfall and blooms again the next morning."
          " The blue lotus flower color symbolizes depth, inspiration, honesty, confidence and wisdom.",
    ),
];