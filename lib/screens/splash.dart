import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:np2024_01/bloc/product_bloc.dart';
import 'package:np2024_01/repositories/ProductsRepository.dart';

class splash extends StatefulWidget {
  static const String path = '/splash';

  splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    // TODO: implement initState

    Productsrepository pr = Productsrepository();
    pr.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.popAndPushNamed(context, '/init');
          },
          child: Text('press')
        ),
      ),
    ));
  }
}
