import 'package:agro_market/src/landing/home.dart';
import 'package:agro_market/src/pages/categories/categories_form.dart';
import 'package:agro_market/src/pages/categories/categories_home.dart';
import 'package:agro_market/src/pages/categories/categories_menu.dart';
import 'package:agro_market/src/pages/products/products_form.dart';
import 'package:agro_market/src/pages/products/products_home.dart';
import 'package:agro_market/src/pages/products/products_menu.dart';
import 'package:flutter/material.dart';

class Routes extends StatefulWidget {
  const Routes({Key? key}) : super(key: key);

  @override
  State<Routes> createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  @override
  Widget build(BuildContext context) {
    // String tokenLogin() {
    //   if (prefs.token.isEmpty) {
    //     return '/';
    //   } else {
    //     return '/login';
    //   }
    // }

    return MaterialApp(
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        // Define the default font family.
        fontFamily: 'Poppins',
        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 43.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 24.0),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/registerCategorie': (context) => const CategoriesForm(),
        '/registerProduct': (context) => const ProductsForm(),
        '/listProducts': (context) => const GroceryStoreHome(),
        '/listCategories': (context) => const CategoriesHomes(),
        '/menuProducts': (context) => const ProductsMenus(),
        '/menuCategories': (context) => const CategoriesMenus(),

      },
    );
  }
}
