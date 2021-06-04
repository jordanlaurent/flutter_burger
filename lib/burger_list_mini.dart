import 'package:flutter/material.dart';

class BurgerListMini extends StatefulWidget {
  @override
  _BurgerListMiniState createState() => _BurgerListMiniState();
}

class _BurgerListMiniState extends State<BurgerListMini> {
  Widget BaconImage = Container(
    height: 110,
    child: Image.asset(
        "img/cheeseburger-bacon-hamburger-wrap-hot-dog-bacon-511a0cbf7f71e456d330658e7419b9d8.png"),
  );
  Widget chikenImage = Container(
    height: 80,
    child: Image.asset("img/PngItem_1456713.png"),
  );

  int items = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.only(top: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items,
        itemBuilder: (context, index) {
          bool reverse = index.isEven;
          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    margin: EdgeInsets.only(
                        left: 20, right: index == items ? 20 : 0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Card(
                        color: Theme.of(context).primaryColor,
                        elevation: 3,
                        margin: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      reverse ? "Bacon Burger" : "Chiken Burger",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: reverse ? 10 : 25,  // changer taille image
                left: reverse ? 8 : 12,  // changer taille image
                child: GestureDetector(
                  onTap: () {},
                  child: reverse ? BaconImage : chikenImage,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
