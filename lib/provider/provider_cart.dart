import 'package:agro_market/models/store_bloc.dart';
import 'package:flutter/material.dart';

class GroceryProvider extends InheritedWidget {
  final GroceryStoreBloc bloc;
  final Widget child;

  const GroceryProvider({Key? key, 
    required this.bloc,
    required this.child,
  }) : super(key: key, child: child);

  static GroceryProvider? of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<GroceryProvider>();
  @override
  bool updateShouldNotify(GroceryProvider oldWidget) => true;
}
