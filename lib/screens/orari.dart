import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:np2024_01/prcf/init.dart';
import 'package:np2024_01/router/paramModels/hourModel.dart';
import 'package:np2024_01/widgets/cellaGrigliaOrari.dart';
import 'package:np2024_01/widgets/containerDrawer.dart';
import 'package:np2024_01/widgets/parametriSerata.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class orari extends StatefulWidget {
  static const String path = '/orari';
  const orari({super.key});

  @override
  State<orari> createState() => _orariState();
}

class _orariState extends State<orari> {
  bool _visi = false;
  HoursModel? funcHour;

  List<datiGraficoRitardo> lstRitardo = [
    datiGraficoRitardo(1, 1),
    datiGraficoRitardo(2, 3),
    datiGraficoRitardo(3, 5),
  ];

  List<String> lst_orari_str = [
    '18.00',
    '18.05',
    '18.10',
    '18.15',
    '18.20',
    '18.25',
    '18.30',
    '18.35',
    '18.40',
    '18.45',
    '18.50',
    '18.55',
    '19.00',
    '19.05',
    '19.10',
    '19.15',
    '19.20',
    '19.25',
    '19.30',
    '19.35',
    '19.40',
    '19.45',
    '19.50',
    '19.55',
    '20.00',
    '20.05',
    '20.10',
    '20.15',
    '20.20',
    '20.25',
    '20.30',
    '20.35',
    '20.40',
    '20.45',
    '20.50',
    '20.55',
    '21.00',
    '21.05',
    '21.10',
    '21.15',
    '21.20',
    '21.25',
    '21.30',
    '21.35',
    '21.40',
    '21.45',
    '21.50',
    '21.55'
  ];

  List<List<String>> lst_orari = [
    [
      '18.00',
      '18.05',
      '18.10',
      '18.15',
      '18.20',
      '18.25',
      '18.30',
      '18.35',
      '18.40',
      '18.45',
      '18.50',
      '18.55',
    ],
    [
      '19.00',
      '19.05',
      '19.10',
      '19.15',
      '19.20',
      '19.25',
      '19.30',
      '19.35',
      '19.40',
      '19.45',
      '19.50',
      '19.55'
    ],
    [
      '20.00',
      '20.05',
      '20.10',
      '20.15',
      '20.20',
      '20.25',
      '20.30',
      '20.35',
      '20.40',
      '20.45',
      '20.50',
      '20.55'
    ],
    [
      '21.00',
      '21.05',
      '21.10',
      '21.15',
      '21.20',
      '21.25',
      '21.30',
      '21.35',
      '21.40',
      '21.45',
      '21.50',
      '21.55'
    ],
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _distanceScroll = 0;

    if (ModalRoute.of(context)!.settings.arguments != null) {
      funcHour = ModalRoute.of(context)!.settings.arguments as HoursModel;
    }

    return SafeArea(
        child: GestureDetector(
      onHorizontalDragEnd: (details) {
        print(details.localPosition.dx - _distanceScroll);
      },
      onHorizontalDragDown: (details) {
        _distanceScroll = details.localPosition.dx;
      },
      onVerticalDragEnd: (details) {
        if (details.localPosition.dy >=
            MediaQuery.of(context).size.height - 15) {
          Navigator.pop(context);
        }
        print('---> ${details.globalPosition.dy}');
      },
      child: Scaffold(
          drawer: containerDrawerOrari(lst_orari_str: lst_orari_str),
          appBar: AppBar(
            leading: Builder(
              builder: (context) {
                return GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Icon(
                      Icons.menu,
                      color: const Color.fromARGB(255, 51, 51, 51),
                    ));
              },
            ),
            backgroundColor: const Color.fromARGB(255, 236, 236, 236),
            automaticallyImplyLeading: false,
            elevation: 0,
            title: Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Text(
                'Situazione orari',
                style: GoogleFonts.roboto(
                    fontSize: 18, color: const Color.fromARGB(237, 30, 30, 30)),
              ),
            ),
          ),
          body: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: const Color.fromARGB(255, 57, 57, 57),
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 7, right: 135),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                            height: MediaQuery.of(context).size.height,
                            color: const Color.fromARGB(255, 57, 57, 57),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
                                child: Column(
                                  children: lst_orari.map((ora) {
                                    return Row(
                                      children: ora.map((E) {
                                        return Cellagrigliaorari(
                                          E: E,
                                          funct: funcHour,
                                        );
                                      }).toList(),
                                    );
                                  }).toList(),
                                ),
                              ),
                            )),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: parametriSerata(lst_ritardo: lstRitardo),
                    ),
                  ],
                ),
              ),
              
            ],
          )),
    ));
  }
}

class datiGraficoRitardo {
  double ritardo;
  double ora;

  datiGraficoRitardo(this.ora, this.ritardo);
}
