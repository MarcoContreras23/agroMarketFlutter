import 'package:agro_market/models/store_bloc.dart';
import 'package:agro_market/provider/provider_cart.dart';
import 'package:agro_market/src/pages/categories/categories_list.dart';
import 'package:agro_market/src/pages/products/products_home.dart';
import 'package:flutter/material.dart';

class CategoriesHomes extends StatefulWidget {
  const CategoriesHomes({Key? key}) : super(key: key);

  @override
  State<CategoriesHomes> createState() => _CategoriesHomesState();
}

const _backgroundColor = Color(0XFFF6F5F2);
const cartBarHeight = 100.0;
const _panelTransition = Duration(milliseconds: 500);

class _CategoriesHomesState extends State<CategoriesHomes> {
  final bloc = GroceryStoreBloc();

  //Metodo para el gesto cambiar pantalla
  void _onVerticalGesture(DragUpdateDetails details) {
    if (details.primaryDelta! < -7) {
      setState(() {
        bloc.changeToCart();
      });
    } else if (details.primaryDelta! > 12) {
      bloc.changeToNormal();
    }
  }

  double _getTopForWhithePanel(GroceyState state, Size size) {
    if (state == GroceyState.normal) {
      return -cartBarHeight + kToolbarHeight;
    } else if (state == GroceyState.cart) {
      return -(size.height - kToolbarHeight) + 150;
    }
    return 0.0;
  }

  double _getTopForBlackPanel(GroceyState state, Size size) {
    if (state == GroceyState.normal) {
      return size.height - cartBarHeight;
    } else if (state == GroceyState.cart) {
      return cartBarHeight / 2;
    }
    return 0.0;
  }

  double _getTopForAppBar(GroceyState state) {
    if (state == GroceyState.normal) {
      return 0.0;
    } else if (state == GroceyState.cart) {
      return -cartBarHeight;
    }
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    dynamic imageProduct;
    return GroceryProvider(
      bloc: bloc,
      child: AnimatedBuilder(
          animation: bloc,
          builder: (context, _) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.black,
              body: Stack(
                children: [
                  AnimatedPositioned(
                    duration: _panelTransition,
                    curve: Curves.decelerate,
                    left: 0,
                    right: 0,
                    top: _getTopForWhithePanel(bloc.groceyState, size),
                    height: size.height - kToolbarHeight,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage("assets/FondoShop.png"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                      ),
                      child: const CategoriesList(),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: _panelTransition,
                    curve: Curves.decelerate,
                    left: 0,
                    right: 0,
                    top: _getTopForBlackPanel(bloc.groceyState, size),
                    height: size.height - kToolbarHeight,
                    child: GestureDetector(
                      onVerticalDragUpdate: _onVerticalGesture,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage("assets/FondoShop.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: AnimatedSwitcher(
                                duration: _panelTransition,
                                child: SizedBox(
                                  height: kToolbarHeight,
                                  child: bloc.groceyState == GroceyState.normal
                                      ? Row(
                                          children: [
                                            Expanded(
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 8.0),
                                                  child: Row(
                                                    children: List.generate(
                                                        bloc.cart.length,
                                                        (index) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    8.0),
                                                        child: Stack(
                                                          children: [
                                                            const Hero(
                                                              tag:
                                                                  'list_details',
                                                              child:
                                                                  CircleAvatar(
                                                                backgroundColor:
                                                                    Colors
                                                                        .white,
                                                              ),
                                                            ),
                                                            Positioned(
                                                              right: 0,
                                                              child:
                                                                  CircleAvatar(
                                                                radius: 10,
                                                                backgroundColor:
                                                                    Colors.red,
                                                                child: Text(
                                                                  bloc
                                                                      .cart[
                                                                          index]
                                                                      .quantity
                                                                      .toString(),
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    }),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : const SizedBox.shrink(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: _panelTransition,
                    curve: Curves.decelerate,
                    left: 0,
                    right: 0,
                    top: _getTopForAppBar(bloc.groceyState),
                    child: _AppBarGrocery(),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class _AppBarGrocery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
