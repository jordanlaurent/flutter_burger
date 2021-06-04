import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

    int currentSlectedItem = 0;

  @override
  Widget build(BuildContext context) {
    bool light = Theme.of(context).brightness == Brightness.light ; // si on est dans brightnees light active light si false active dark mode
    int items = 10;

    return SliverToBoxAdapter(
      child: Container(
        height: 100,
        margin: EdgeInsets.only(top: 10),
        child: ListView.builder(
          scrollDirection: Axis
              .horizontal, // permet de definit le defilement horizontal de tt les icon
          itemCount: items,
          itemBuilder: (context, index) => Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    margin: EdgeInsets.only(
                        left: index == 0 ? 20 : 0,
                        bottom: 10,
                        right: 20), // Marge entre les icon
                    child: GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            currentSlectedItem = index;
                          },
                        );
                      },
                      child: Card(
                        color: index == currentSlectedItem
                            ? light ? Colors.black.withOpacity(0.8)
                            : Colors.teal : light ? Colors.white : Theme.of(context).cardColor,
                        child: Icon(
                          Icons.fastfood,
                          color: index == currentSlectedItem
                              ? Colors.white
                              :light ? Colors.black.withOpacity(0.8) : Colors.white,
                        ),
                        elevation: 3,
                        margin: EdgeInsets.all(10), // ratrecit les btn
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(25), // arrondire les bouton
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // texte sous les btn
              Positioned(
                bottom: 0, // positon du texte en bas dans le container
                child: Container(
                  margin: EdgeInsets.only(
                    left: index == 0 ? 20 : 0,
                    right: 20,
                  ),
                  width: 90,
                  child: Row(
                    children: [
                      Spacer(),
                      Text("Burger"),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
