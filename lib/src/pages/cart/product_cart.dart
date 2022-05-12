import 'package:agro_market/models/store_bloc.dart';
import 'package:agro_market/provider/provider_cart.dart';
import 'package:flutter/material.dart';

class GrocerytoreCart extends StatefulWidget {
  const GrocerytoreCart({Key? key})
      : super(key: key);

  @override
  State<GrocerytoreCart> createState() => _GrocerytoreCartState();
}

class _GrocerytoreCartState extends State<GrocerytoreCart> {
  @override
  Widget build(BuildContext context) {
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
          child: carrito(context),
        ),
      ],
    );
  }

  Widget _bodyParteUno() {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Row(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width * 0.07,
          ),
          Column(
            children: [
              FloatingActionButton(
                backgroundColor: const Color.fromARGB(255, 197, 254, 37),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/menuProducts');
                },
                child:
                    const Icon(Icons.arrow_back, size: 30, color: Colors.white),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
        ],
      ),
    );
  }


  
  Widget carrito(BuildContext context) {
    final bloc = GroceryProvider.of(context)?.bloc ?? GroceryStoreBloc();
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/FondoShop.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Cart',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: bloc.cart.length,
                      itemBuilder: (context, index) {
                        final item = bloc.cart[index];
                        Image image = Image.asset('assets/logo.png');
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: CircleAvatar(
                                  backgroundColor:
                                      const Color.fromARGB(255, 0, 0, 0),
                                  backgroundImage: image.image,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  item.quantity.toString(),
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ),
                              const Expanded(
                                  child: Text(
                                "x",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              )),
                              Expanded(
                                flex: 4,
                                child: Text(
                                  item.product['nombre'],
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Expanded(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    '\$${(int.parse(item.product['precio']) * item.quantity).toString()}',
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: IconButton(
                                  icon: const Icon(Icons.delete),
                                  color:
                                      const Color.fromARGB(255, 145, 138, 138),
                                  onPressed: () {
                                    setState(() {
                                      bloc.deleteProduct(item);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                Text(
                  '\$${bloc.totalPriceElement()}',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: RaisedButton(
              color: const Color.fromARGB(255, 197, 254, 37),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  'Pay',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              onPressed: () => null,
            ),
          ),
        ],
      ),
    );
  }
}
