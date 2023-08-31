import 'package:flower/model/product_three.dart';
import 'package:flower/pages/details_three_screen.dart';
import 'package:flutter/material.dart';

class FlowerModel{
  String? name;
  String details;

  FlowerModel({
    required this.name,
    required this.details,
  });
}

class FlowerPageTwo extends StatefulWidget {
  const FlowerPageTwo({super.key});

  @override
  State<FlowerPageTwo> createState() => _FlowerPageTwoState();
}

List<FlowerModel> users =[
    FlowerModel(
        name: "Narcissus flower",
        details: "Narcissus "
        "Its color is sulfur-colored, and it usually branches out from one stem with two or more roses."
        "It is one of the flowers with a distinctive, picturesque scent, especially in the early morning.",
   ),
    FlowerModel(
        name: "Grandiflora rose",
        details: "The flowers of Grand Flora are similar to the flowers of the tea hybrid, and its stem is similar to the stem of Flori Bunda flowers,"
        "It is distinguished as a tall shrub, and it is also the favorite rose of Queen Elizabeth.",
   ),
    FlowerModel(
        name: "Floor roses",
        details: "It is one of the types of roses known as landscape roses. This type has evolved and is used in garden roses."
        "It provides a distinctive number of fragrance, shape and color, and is easy to care for.",
   ),
    FlowerModel(
        name: "Flower Violet",
        details: "When the violet flower is fully grown, it looks like a small branched bush."
        "They are usually used to decorate homes, and they tend to be purple and white."
        "And you don't have a leg.",
   ),
    FlowerModel(
        name: "Mini-flora",
        details: "Miniflora flowers are among the smallest flowers known around the world, with a length of less than 5 cm."
        "And its bushes do not exceed 50 cm, and it is usually grown in bottles.",
   ),
    FlowerModel(
        name: "Blue lotus flower",
        details: "This blue type was very well known in the Pharaonic civilization and was distinguished by several other names such as the sacred blue lily and the blue water lily."
        "This species settled and spread in the past along the banks of the Nile River and some parts of East Africa. Like all other species, it submerges under water at the beginning of the nightfall and blooms again the next morning."
        " The blue lotus flower color symbolizes depth, inspiration, honesty, confidence and wisdom.",
   ),
];

class _FlowerPageTwoState extends State<FlowerPageTwo> {


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (context, index){
          return Container(
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 5,
              top: 5,
            ),
            child: Row(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white38,
                   /* image: DecorationImage(
                        fit: BoxFit.cover,
                          image: AssetImage(
                            "assets/photo/زهرة القرنفل.jpg"
                          ),

                      ), */
                  ),
                  child: GestureDetector(

                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsThree(
                                productthree: items[index]),
                          )
                      );
                    },
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          items[index].imagepath,
                          fit: BoxFit.cover,
                        ),

                    ),

                  ),
                ),

                Expanded(
                  child: Container(
                    height: 95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          offset: Offset(5, 5),
                        ),
                      ],
                    ),
                    child: buildFlowerName(users[index]),
                  ),
                ),
              ],
            ),
          );
        }
    );
  }

  Widget buildFlowerName(FlowerModel model){
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 5,
        left: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${model.name}",
            style: TextStyle(
              fontSize: 22,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "${model.details}",
            style: TextStyle(
              fontSize: 12,
              color: Colors.black45,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          SizedBox(
            height: 5,
          ),
          Wrap(
            children:
            List.generate(5, (index) => Icon(
              Icons.star,
              color: Colors.amber,
              size: 15,
            ),
            ),
          ),
        ],
      ),
    ) ;
  }
}
