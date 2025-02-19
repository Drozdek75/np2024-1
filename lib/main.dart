import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:np2024_01/bloc/dashboard_bloc.dart';
import 'package:np2024_01/bloc/nominativi_bloc.dart';
import 'package:np2024_01/bloc/orari_bloc.dart';
import 'package:np2024_01/bloc/product_bloc.dart';
import 'package:np2024_01/prcf/init.dart';
import 'package:np2024_01/repositories/IngredientaRepository.dart';
import 'package:np2024_01/repositories/ProductsRepository.dart';
import 'package:np2024_01/router/generateRouter.dart';
import 'package:np2024_01/screens/splash.dart';
import 'package:np2024_01/widgets/nominativi.dart';
import 'package:pine/di/dependency_injector_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) => DependencyInjectorHelper(
          blocs: [
            BlocProvider<NominativiBloc>(
              create: (context) => NominativiBloc(),
            ),
            BlocProvider<OrariBloc>(
              create: (context) => OrariBloc(),
            ),
            BlocProvider<DashboardBloc>(
              create: (context) => DashboardBloc(productRepo: context.read()),
            ),
            BlocProvider<ProductBloc>(
              create: (context) => ProductBloc(
                  productRepo: context.read(), ingredientRepo: context.read()),
            )
          ],
          mappers: [],
          providers: [],
          repositories: [
            RepositoryProvider<Productsrepository>(
              create: (context) => Productsrepository(),
            ),
            RepositoryProvider<IngredientsRepository>(
              create: (context) => IngredientsRepository(),
            )
          ],
          child: MaterialApp(
              // onGenerateRoute: generateRouter.generateRoute,
              debugShowCheckedModeBanner: false,
              
              title: 'Np 2024_01',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              onGenerateRoute: Generaterouter.generateRoute,
              initialRoute: '/splash',
              // home: const MyHomePage(title: '')
              home: init())

          //  initialRoute: '/splash',
          );

  void openNames(BuildContext context) {
    Nominativo.dialogBuilder(context);
  }
}
