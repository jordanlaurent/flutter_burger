import 'package:flutter/material.dart';
import 'burger_list_mini.dart';

class BurgerPage extends StatefulWidget {
  static const tag = "burger_page";
  @override
  _BurgerPageState createState() => _BurgerPageState();
}

class _BurgerPageState extends State<BurgerPage> {
  Widget BaconImage = Container(
    height: 160,
    child: Image.asset(
        "img/cheeseburger-bacon-hamburger-wrap-hot-dog-bacon-511a0cbf7f71e456d330658e7419b9d8.png"),
  );
  Widget chikenImage = Container(
    height: 120,
    child: Image.asset("img/PngItem_1456713.png"),
  );

  int number = 0;

  @override
  Widget build(BuildContext context) {
    Object? nameArgument = ModalRoute.of(context)!.settings.arguments;// recuperer nom burger de la page main
    Size size = MediaQuery.of(context).size; // donne acces a la hauteur et largeur de l'application
    bool light = Theme.of(context).brightness == Brightness.light ; // si on est dans brightnees light active light si false active dark mode
    return Scaffold(
      appBar: AppBar(
        elevation: 0, // enlever trait entre appbar et texte en dessous
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
          ),
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              // avatar de l'utilisateur
              radius: 15,
              backgroundColor: Colors.white70,
              child: CircleAvatar(
                backgroundImage: AssetImage(
                    "img/Nicki-Minaj-en-deuil-son-pere-tue-dans-lors-d-un-terrible-accident.jpg"),
                radius: 13,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // alligner texte a gauche
        children: [
          Container(
            padding:
                EdgeInsets.symmetric(horizontal: 30), // padding autour du texte
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // alligner texte a gauche
              children: [
                Text(
                  nameArgument.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Delivery Me BURGER. Fats Delivery & Great Service!",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white54,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                   nameArgument == "Chiken Burger" ?  chikenImage :BaconImage ,
                    Spacer(),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Text(
                            "15.95 €",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          // stars
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      bottomSheet: BottomSheet(
          backgroundColor: Colors.teal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(45),
            ),
          ),
          onClosing: () {},
          builder: (context) {
            return ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(45),
              ),
              child: Container(
                width: size.width,
                color:light ? Color.fromRGBO(240, 240, 240, 1) : Colors.black87,
                height: size.height /
                    1.6, // hauteur de conteneur avec la description
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 30,
                        right: 30,
                        top: 30,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // faire commencer le texte a gauche
                        children: [
                          Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 28,
                          ),
                          Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    BurgerListMini(),
                    Container(
                      padding: EdgeInsets.all(
                        15,
                      ), // padding container qui a tt les btn en bas
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45),
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.2),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (number < 1) {
                                        number = 0;
                                      } else {
                                        number = number - 1;
                                      }
                                    });
                                  },
                                  icon: Icon(Icons.remove),
                                  color: Theme.of(context).accentColor,
                                ),
                                Text(number.toString()),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      number = number + 1;
                                    });
                                  },
                                  icon: Icon(Icons.add),
                                  color: Theme.of(context).accentColor,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            // prend tt la largeur
                            child: Container(
                              height: 45,
                              padding: EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              child: MaterialButton(
                                color: Theme.of(context).accentColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        45)), // arrondir btn border radius
                                onPressed: () {},
                                child: Text(
                                  "Buy Now",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
