import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'header.dart';
import 'categories.dart';
import 'burgerList.dart';
import 'burgerPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor:
              Colors.transparent), // pour android enlever bar tt en hauts
    );
    return MaterialApp(
      home: Hamberger(),
      routes: {
        BurgerPage.tag: (_) => BurgerPage()
      }, // quand on demande la route nous envoie a la page du burger
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.orange,
        canvasColor: Colors.teal, // font des pages
        primaryColor: Colors.teal,
        cardColor: Colors.white,
        appBarTheme: AppBarTheme(color: Colors.teal, centerTitle: true),
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.teal,
        ),
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Colors.orange),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark, // change automatiquement les texte
        // quand l'appareil est en dark theme
        accentColor: Colors.orange,
        canvasColor: Colors.teal, // font des pages
        primaryColor: Colors.teal,
        cardColor: Color.fromRGBO(20, 20, 20, 1),
        appBarTheme: AppBarTheme(color: Colors.teal, centerTitle: true),
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.teal,
        ),
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Colors.orange),
      ),
    );
  }
}

class Hamberger extends StatefulWidget {
  @override
  _HambergerState createState() => _HambergerState();
}

class _HambergerState extends State<Hamberger> {
  @override
  Widget build(BuildContext context) {
    bool light = Theme.of(context).brightness == Brightness.light ; // si on est dans brightnees light active light si false active dark mode
    return Scaffold(
      backgroundColor:light ? Color.fromRGBO(240, 240, 240, 1) : Colors.black12,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true, // permet de passer les element sous l'app bar
            title: Text("Delivery Me"),
            leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
            ],
          ),
          Header(), // import page header
          Categories(), // import page categorie
          HanbergerList(
            row: 1,
          ),
          HanbergerList(
            row: 2,
          ),
        ],
      ),
      extendBody: true, // permet de mettre du transparent
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, // mettre le btn en bas a droite normalement a mileux bottom
      floatingActionButton: FloatingActionButton(
        // icon en bas a droite
        onPressed: () {},
        child: Icon(
          Icons.home,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(45),
        ),
        child: Container(
          color: Colors.black38,
          child: BottomAppBar(
            shape:
                CircularNotchedRectangle(), // effacer comptenue autour du btn   floatingActionButton
            // bar de navigation en bas
            child: Row(
              children: [
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add_alert),
                  color: Colors.white,
                ),
                Spacer(),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.turned_in),
                  color: Colors.white,
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
