import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:np2024_01/bloc/nominativi_bloc.dart';
import 'package:np2024_01/prcf/init.dart';
import 'package:np2024_01/router/generateRouter.dart';
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
           BlocProvider<NominativiBloc>(create: (context) => NominativiBloc(),)
        ],
        mappers: [],
        providers: [
         
        ],
        repositories: [],
        child: MaterialApp(
         // onGenerateRoute: generateRouter.generateRoute,
          debugShowCheckedModeBanner: false,
          title: 'Np 2024_01',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          onGenerateRoute: Generaterouter.generateRoute,
          initialRoute: '/init',
          // home: const MyHomePage(title: '')
          home: init())

        

         //  initialRoute: '/splash',
        );
      


 

  void openNames(BuildContext context) {
    Nominativo.dialogBuilder(context);
  }
}
