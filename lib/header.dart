import 'package:flutter/material.dart';
import 'package:flutter_burger/burgerList.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    bool light = Theme.of(context).brightness ==
        Brightness
            .light; // si on est dans brightnees light active light si false active dark mode
    Size size = MediaQuery.of(context).size;
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: size.height / 5,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(45),
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20, // padding top de la box
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              // avatar de l'utilisateur
                              radius: 35,
                              backgroundColor: Colors.white70,
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                    "img/Nicki-Minaj-en-deuil-son-pere-tue-dans-lors-d-un-terrible-accident.jpg"),
                                radius: 30,
                              ),
                            ),
                            SizedBox(
                              width: 5, // padding left
                            ),
                            Column(
                              children: [
                                // name user
                                Text(
                                  "Jordan Laurent",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Container(
                                  // premium user
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black54,
                                  ),
                                  child: Text(
                                    " PREMIUM ",
                                    style: TextStyle(
                                      color: Colors.orange.shade300,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Spacer(), // mettre element tt a droite
                            Text(
                              // text montant total
                              "154 €",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ) // ajoute unpadding entre le box nom prenom... et la bar de
                ],
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: size.width,
                  height: 50,
                  child: Card(
                    color: light ? Colors.white : Theme.of(context).cardColor,
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: ("Qu'est ce que tu veux manger ?"),
                        suffixIcon: Icon(
                          Icons.search,
                          color: light ? Colors.black54 : Colors.white60,
                        ),
                        contentPadding: EdgeInsets.only(left: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
