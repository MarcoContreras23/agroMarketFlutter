import 'package:flutter/material.dart';

class ProductsMenus extends StatefulWidget {
  const ProductsMenus({Key? key}) : super(key: key);

  @override
  State<ProductsMenus> createState() => _ProductsMenusState();
}

class _ProductsMenusState extends State<ProductsMenus> {
  final ButtonStyle style = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      primary: const Color.fromARGB(255, 197, 254, 37),
      textStyle: const TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: BackButton(
            color: Colors.black,
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            }),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/FondoShop.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: myCard(),
          ),
          alignment: Alignment.center,
        ),
      ),
    );
  }

  Card myCard() {
    final size = MediaQuery.of(context).size;
    const spaceBetween = SizedBox(height: 30);
    return Card(
      // Con esta propiedad modificamos la forma de nuestro card
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      // Con esta propiedad agregamos margen a nuestro Card
      // El margen es la separación entre widgets o entre los bordes del widget padre e hijo
      margin: const EdgeInsets.all(15),
      // Con esta propiedad agregamos elevación a nuestro card
      // La sombra que tiene el Card aumentará
      elevation: 10,
      color: Colors.white,
      // La propiedad child anida un widget en su interior
      // Usamos columna para ordenar un ListTile y una fila con botones

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: const Image(
              image: AssetImage('assets/logo.png'),
            ),
            margin: const EdgeInsets.only(bottom: 3),
          ),
          const FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              "¿Qué deseas hacer?",
              style: TextStyle(color: Colors.black),
              maxLines: 2,
            ),
          ),
          spaceBetween,
          ElevatedButton(
            style: style,
            child: const Text(
              "Crear productos",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/registerProduct');
            },
          ),
          spaceBetween,
          ElevatedButton(
            style: style,
            child: const Text(
              "Listar productos",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/listProducts');
            },
          ),
        ],
      ),
    );
  }
}
