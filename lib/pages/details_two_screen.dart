import 'package:flower/Shared/appbar.dart';
import 'package:flower/model/prodect.dart';
import 'package:flower/model/prodect_two.dart';
import 'package:flutter/material.dart';

class DetailsTwo extends StatefulWidget {

  ItemTwo producttwo;
  DetailsTwo({required this.producttwo});

  @override
  State<DetailsTwo> createState() => _DetailsTwoState();
}

class _DetailsTwoState extends State<DetailsTwo> {
  //const DetailsTwo({super.key});
  bool isShowMore = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          //    leading: Icon(Icons.menu),
          //elevation: 0,
          backgroundColor: Colors.pinkAccent,
          // leading: Icon(Icons.menu),
          title: const Text("Details"),
          //centerTitle: true,
          actions: const [APPBAR()],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(.0),
            child: Column(
              //  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(widget.producttwo.imagepath),
                //    fit: BoxFit.cover
                const SizedBox(
                  height: 19,
                ),
                Text(
                  "\$${widget.producttwo.price}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(
                  height: 19,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),
                      child: const Text("New", style: TextStyle(fontSize: 15)),
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(3)),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 20,
                          color: Color.fromARGB(225, 225, 190, 0),
                        ),
                        Icon(
                          Icons.star,
                          size: 20,
                          color: Color.fromARGB(225, 225, 190, 0),
                        ),
                        Icon(
                          Icons.star,
                          size: 20,
                          color: Color.fromARGB(225, 225, 190, 0),
                        ),
                        Icon(
                          Icons.star,
                          size: 20,
                          color: Color.fromARGB(225, 225, 190, 0),
                        ),
                        Icon(
                          Icons.star,
                          size: 20,
                          color: Color.fromARGB(225, 225, 190, 0),
                        ),

                      ],
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    const Row(
                      children: [
                        Icon(Icons.edit_location_rounded),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Flower  ",
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    widget.producttwo.details,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "A flower is the reproductive part of flowering plants."
                      " Flowers are also called the bloom or blossom of a plant."
                      " Flowers have petals. Inside the part of the flower that "
                      "has petals are the parts which produce pollen and seeds.In all plants,"
                      " a flower is usually its most colourful part. We say the plant 'flowers', 'is flowering' or 'is in flower' when this colourful part begins to grow bigger and open out.There are many different kinds of flowers in different areas in the world. Even in the coldest places, for example the Arctic, flowers can grow during a few months.Flowers may grow separately on the plant, or they may grow together in an inflorescence.",
                  style: const TextStyle(fontSize: 17),
                  maxLines: isShowMore ? 3 : null,
                  overflow: TextOverflow.clip,
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        isShowMore = !isShowMore;
                      });
                    },
                    child: Text(isShowMore ? "Show more" : "Show less",
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
