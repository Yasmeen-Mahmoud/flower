import 'package:dots_indicator/dots_indicator.dart';
import 'package:flower/model/prodect_two.dart';
import 'package:flower/pages/details_three_screen.dart';
import 'package:flower/pages/details_two_screen.dart';
import 'package:flutter/material.dart';

class FlowersModel{
  String? name;

  FlowersModel({
    required this.name,
  });
}

class FlowerPageBody extends StatefulWidget {
  const FlowerPageBody({super.key});

  @override
  State<FlowerPageBody> createState() => _FlowerPageBodyState();
}

class _FlowerPageBodyState extends State<FlowerPageBody> {

  PageController pageController = PageController(viewportFraction: .95);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 200;

  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue =  pageController.page!;
      });
    });
  }

  @override
  void dispose(){
    pageController.dispose();
  }

  List<FlowersModel> users =[
    FlowersModel(
      name: "Floribunda Roses",
    ),
    FlowersModel(
      name: "black lotus flower",
    ),
    FlowersModel(
      name: "Trumpet lilies flower",
   ),
    FlowersModel(
      name: "Lily Flower",
    ),
    FlowersModel(
      name: "blue flowers",
    ),
    FlowersModel(
      name: "Rose flower",
     ),
    FlowersModel(
      name: "Flower Violet",
     ),
    FlowersModel(
      name: "Lotus flower",
     ),

  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250,
          child: PageView.builder(
            controller: pageController,
            itemCount: 8,
              itemBuilder: (context, position){
              return _buildPageItem(position);
              }
          ),
        ),
        new DotsIndicator(
            dotsCount: 8,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: Colors.pink,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.only(left: 20),

          child: Container(

            child: Row(
             mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Popular",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Lovely Flowers ",
                  style: TextStyle(
                    fontSize:15,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),

      ],
    );
  }

  Widget _buildPageItem(int index){
    Matrix4 matrix = new Matrix4.identity();
    if(index == _currPageValue.floor()){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
    }
    else if (index == _currPageValue.floor()+1){
      var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: 200,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven? Color(0xFF69c5df) : Color(0xFF9294cc),
             /* image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    "assets/photo/زهرة-اللوتس.jpg"
                ),
              ), */
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsTwo(
                      producttwo: items[index]),
                  )
                );
              },
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child:
                  Image.asset(
                    fit: BoxFit.cover,
                      items[index].imagepath,
                  )),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 80,
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    offset: Offset(5, 5),
                  ),
                ],
              ),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                    top: 10,
                    left: 15,
                    right: 15
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildPageFlowers(users[index]),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children:
                            List.generate(5, (index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              size: 15,
                            ),
                            ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "4.5",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black45,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "4566",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black45,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "comments",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
     ],
      ),
    );
  }

  Widget buildPageFlowers(FlowersModel model){
    return Text(
      "${model.name}",
      style: TextStyle(
        fontSize: 25,

      ),
    );
  }

}