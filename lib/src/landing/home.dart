import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage("assets/FondoShop.png"),
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
                image: AssetImage('assets/logo.png')),
            margin: const EdgeInsets.only(bottom: 3),
          ),
          const Center(
              child: Text("HOLA",
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 197, 254, 37)))),
          spaceBetween,
          const FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              "BIENVENIDO A AGROMARKET",
              style: TextStyle(color: Colors.black),
              maxLines: 2,
            ),
          ),
          spaceBetween,
          ElevatedButton(
            style: style,
            child: const Text("productos",
                style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0))),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/menuProducts');
            },
          ),
          spaceBetween,
          ElevatedButton(
            style: style,
            child: const Text("categorias",
                style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0))),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/menuCategories');
            },
          ),
          spaceBetween,
          spaceBetween,
        ],
      ),
    );
  }
}
