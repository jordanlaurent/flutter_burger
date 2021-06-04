import 'package:flutter/material.dart';
import 'burgerPage.dart';

class HanbergerList extends StatefulWidget {
  final int row; // varibale que l'on recoit de la page main
  HanbergerList({required this.row});

  @override
  _HanbergerListState createState() => _HanbergerListState();
}

class _HanbergerListState extends State<HanbergerList> {
  @override
  Widget build(BuildContext context) {
    int items = 10;

    Widget chikenImage= Container(
      height: 160,
      child: Image.asset(
          "img/cheeseburger-bacon-hamburger-wrap-hot-dog-bacon-511a0cbf7f71e456d330658e7419b9d8.png"),
    );
    Widget BaconImage = Container(
      height: 120,
      child: Image.asset("img/PngItem_1456713.png"),
    );
    Widget chevre = Container(
      height: 160,
      child: Image.asset("img/PngItem_1738665.png"),
    );
    Widget burg = Container(
      height: 160,
      child: Image.asset("img/PngItem_1738671.png"),
    );

    return SliverToBoxAdapter(
      child: Container(
        height: widget.row == 2 ? 330 : 240,
        margin: EdgeInsets.only(top: 10),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items,
          itemBuilder: (context, index) {
            bool reverse = widget.row == 2
                ? index.isEven
                : index.isOdd; // reverse image burger
            return Stack(
              children: [
                Container(
                  height: 240,
                  width: 200,
                  margin:
                      EdgeInsets.only(left: 20, right: items == index ? 20 : 0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        BurgerPage.tag,
                        arguments: reverse ? "Bacon Burger" : "Chiken Burger",
                      );
                    },
                    child: Card(
                      color: Theme.of(context).primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Text(
                              reverse ? "Bacon Burger" : "Chiken Burger",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Spacer(),
                                Text(
                                  reverse ? "15.95 €" : "11.99 €",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  width: 50,
                                  height: 50,
                                  child: Card(
                                    child: Icon(Icons.add),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                          ],
                        ),
                      ),
                      elevation: 3,
                      margin: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(45),
                          bottomRight: Radius.circular(15),
                          topLeft: Radius.circular(45),
                          topRight: Radius.circular(45),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: reverse ? 40 : 60,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        BurgerPage.tag,
                        arguments: reverse ? "Bacon Burger" : "Chiken Burger",
                      );
                    },
                    child: reverse ? chikenImage : BaconImage,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
