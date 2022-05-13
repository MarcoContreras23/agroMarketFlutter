// ignore_for_file: deprecated_member_use

import 'package:agro_market/provider/provider_cart.dart';
import 'package:agro_market/service/product_service.dart';
import 'package:agro_market/src/pages/products/product_detail.dart';
import 'package:agro_market/src/pages/products/products_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class GroceryProductsList extends StatefulWidget {
  const GroceryProductsList({Key? key}) : super(key: key);

  @override
  State<GroceryProductsList> createState() => _GroceryProductsListState();
}

final productsService = productService();
String nombreProduct = "";

class _GroceryProductsListState extends State<GroceryProductsList> {
  @override
  Widget build(BuildContext context) {
    final bloc = GroceryProvider.of(context)?.bloc;
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            _fondo(size),
            _body(context),
          ],
        ),
      ),
    );
  }

  Widget _fondo(size) {
    return Container(
      height: size.height * 0.3,
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/FondoShop.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.01,
        ),
        _bodyParteUno(),
        Flexible(
          child: _listProduct(context),
        ),
      ],
    );
  }

  Widget _bodyParteUno() {
    final bloc = GroceryProvider.of(context)?.bloc;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Row(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.07,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FloatingActionButton(
                  backgroundColor: const Color.fromARGB(255, 197, 254, 37),
                  onPressed: () {
                    if (bloc?.cart.isNotEmpty == true) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor:
                                const Color.fromARGB(255, 197, 254, 37),
                            title: const Text(
                              "Cuidado",
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(1, 0.5),
                                    blurRadius: 1.0,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ],
                              ),
                            ),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: const [
                                  Text(
                                    //AppLocalizations.of(context)!.emailMalo,
                                    "Se eliminaran los productos del carrito",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(1, 0.5),
                                          blurRadius: 1.0,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "CANCELAR",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(1, 0.5),
                                          blurRadius: 1.0,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pushReplacementNamed(
                                      context, '/menuProducts');
                                },
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "ACEPTAR",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(1, 0.5),
                                          blurRadius: 1.0,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      Navigator.pushReplacementNamed(context, '/menuProducts');
                    }
                  },
                  child: const Icon(Icons.arrow_back,
                      size: 30, color: Colors.white),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                _barSearch(),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
            ),
          ],
        ),
      ),
    );
  }

  Widget _ordenBy(size) {
    return SizedBox(
      height: size.height * 0.04,
      width: size.width * 0.9,
      child: Row(
        children: [
          Flexible(
            child: Container(
              height: size.height * 0.05,
              width: size.width * 0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.white,
                  width: 1,
                ),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.format_list_bulleted_sharp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(width: size.width * 0.01),
          Container(
            height: size.height * 0.05,
            width: size.width * 0.78,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.white,
                width: 1,
              ),
            ),
            child: const ListTile(
              title: Text(
                'Ordenar por',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              trailing: Icon(
                Icons.arrow_drop_down,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _topText(size) {
    return Row(
      children: [
        SizedBox(width: size.width * 0.02),
        SizedBox(width: size.width * 0.01),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              children: const [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    " LISTADO DE PRODUCTOS",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                    ),
                    maxLines: 4,
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.018),
          ],
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
      ],
    );
  }

  Widget _barSearch() {
    return Container(
      padding: const EdgeInsets.only(top: 20.0),
      width: MediaQuery.of(context).size.height * 0.32,
      height: MediaQuery.of(context).size.height * 0.1,
      child: TypeAheadField<User?>(
        minCharsForSuggestions: 2,
        animationStart: 0.1,
        hideSuggestionsOnKeyboardHide: true,
        textFieldConfiguration: const TextFieldConfiguration(
          style: TextStyle(color: Colors.black),
          maxLength: 50,
          decoration: InputDecoration(
              hintText: "Buscar...",
              hintStyle: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 148, 148, 148),
              ),
              suffixIcon: Icon(
                Icons.search,
                color: Color.fromARGB(255, 197, 254, 37),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 148, 148, 148), width: 2.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 148, 148, 148), width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 148, 148, 148), width: 2.0),
              )),
        ),
        suggestionsCallback: UserApi.getUserSuggestions,
        itemBuilder: (context, User? suggestion) {
          final user = suggestion!;
          return Container(
            color: Colors.white,
            child: ListTile(
                selectedTileColor: Colors.white,
                textColor: Colors.black,
                leading: const CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://www.alqueria.com.co/sites/default/files/styles/1327_612/public/hamburguesa-con-amigos-y-salsa-de-champinones_0.jpg?h=2dfa7a18&itok=hLxehdIa',
                  ),
                ),
                title: Text(
                  user.name,
                )),
          );
        },
        noItemsFoundBuilder: (context) => Container(
          color: Colors.white,
          height: 40,
          child: const Center(
            child: Text(
              'No se encontraron restaurantes',
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
          ),
        ),
        onSuggestionSelected: (User? suggestion) {
          final user = suggestion!;
          print("user tiene esto ${user}");
          nombreProduct = user.name;
        },
      ),
    );
  }

  Widget _listProduct(BuildContext context) {
    final bloc = GroceryProvider.of(context)?.bloc;
    return SafeArea(
      child: FutureBuilder(
        future: productsService.mostrar(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: const EdgeInsets.only(top: cartBarHeight),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                final product = snapshot.data[index];
                final products = [];
                products.add(product);

                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, __) {
                          return FadeTransition(
                            opacity: animation,
                            child: GroceryProductDetails(
                              product: product,
                              onProductAdded: () {
                                bloc?.addProduct(product);
                              },
                            ),
                          );
                        },
                      ),
                    );
                  },
                  child: InkWell(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Row(
                        children: [
                          Hero(
                            tag: 'list_product',
                            child: Stack(
                              children: [
                                Image.asset('assets/products.jpg',
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height: MediaQuery.of(context).size.height *
                                        0.15,
                                    fit: BoxFit.cover),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 6,
                            child: FittedBox(
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(left: 14),
                                    height: 55,
                                    width: 300,
                                    child: Text(
                                      snapshot.data[index]["nombre"],
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 14),
                                    height: 55,
                                    width: 300,
                                    child: Text(
                                      snapshot.data[index]["descripcion"],
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 14),
                                    height: 55,
                                    width: 300,
                                    child: Text(
                                      snapshot.data[index]["precio"],
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Text('Cargando...');
          }
        },
      ),
    );
  }
}
