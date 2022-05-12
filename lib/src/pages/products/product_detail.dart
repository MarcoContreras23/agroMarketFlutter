import 'package:agro_market/models/store_bloc.dart';
import 'package:agro_market/provider/provider_cart.dart';
import 'package:agro_market/service/product_service.dart';
import 'package:flutter/material.dart';

class GroceryProductDetails extends StatefulWidget {
  const GroceryProductDetails(
      {Key? key, @required this.product, required this.onProductAdded})
      : super(key: key);

  final dynamic product;
  final VoidCallback onProductAdded;

  @override
  State<GroceryProductDetails> createState() => _GroceryProductDetailsState();
}

List toppingsAdicionados = [];
List toppingsCarrito = [];

class _GroceryProductDetailsState extends State<GroceryProductDetails> {
  String heroTag = '';

  void _addToCart(BuildContext context) {
    setState(() {
      heroTag = 'details';
    });
    widget.onProductAdded();
    Navigator.of(context).pop();
  }

  final productsService = productService();
  bool isCheck = false;
  List checkList = [];
  dynamic product;

  @override
  Widget build(BuildContext context) {
    final bloc = GroceryProvider.of(context)?.bloc ?? GroceryStoreBloc();

    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Hero(
                    tag: 'list_${widget.product['nombre']}$heroTag',
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                  ),
                  Text(
                    widget.product['nombre'],
                    style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        '\$${widget.product['precio']}',
                        style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: RaisedButton(
                    color: const Color.fromARGB(255, 197, 254, 37),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(
                        'Add to cart',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    onPressed: () {
                      _addToCart(context);
                      // Navigator.of(context).push(
                      //   PageRouteBuilder(
                      //     pageBuilder: (context, animation, __) {
                      //       return FadeTransition(
                      //         opacity: animation,
                      //         child: GrocerytoreCart(
                      //           product: product,
                      //           adicionales: toppingsAgregados,
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // );
                      // _addToCart(context);
                      // if (toppingsAgregados.isNotEmpty == true) {
                      //   bloc.addAicionales(toppingsAgregados,widget.product);
                      // }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
