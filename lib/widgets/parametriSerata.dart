import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:np2024_01/screens/orari.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class parametriSerata extends StatefulWidget {
  List<datiGraficoRitardo> lst_ritardo;
  parametriSerata({super.key, required this.lst_ritardo});

  @override
  State<parametriSerata> createState() => _parametriSerataState();
}

class _parametriSerataState extends State<parametriSerata> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color: const Color.fromARGB(255, 255, 255, 255),
          border: Border.all(
            color: const Color.fromARGB(255, 176, 176, 176),
            width: 0.7,
          )),
      width: 135,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Parametri \n serata',
                  style: GoogleFonts.lato(
                      fontSize: 11,
                      color: const Color.fromARGB(255, 35, 35, 35),
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'Ritardo',
                      style: GoogleFonts.lato(
                          fontSize: 15,
                          color: const Color.fromARGB(255, 41, 41, 41),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '7m',
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        color: const Color.fromARGB(255, 199, 37, 20),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'P.O.Utile',
                      style: GoogleFonts.lato(
                          fontSize: 15,
                          color: const Color.fromARGB(255, 40, 40, 40),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '19.50',
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        color: Colors.blue,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'P.O.Utile 1 MT',
                      style: GoogleFonts.lato(
                          fontSize: 15,
                          color: const Color.fromARGB(255, 38, 38, 38),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '20.15',
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        color: Colors.blue,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'P.O.Utile 1/2 MT',
                      style: GoogleFonts.lato(
                          fontSize: 15,
                          color: const Color.fromARGB(255, 37, 37, 37),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '19.35',
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        color: Colors.blue,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'Prox.V.Fuga',
                      style: GoogleFonts.lato(
                          fontSize: 15,
                          color: const Color.fromARGB(255, 40, 40, 40),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '26m',
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        color: Colors.blue,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'Andamento RIT',
                      style: GoogleFonts.lato(
                          fontSize: 15,
                          color: const Color.fromARGB(255, 33, 33, 33),
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 130,
                      height: 90,
                      child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        title: ChartTitle(
                            text: 'Andamento',
                            textStyle: GoogleFonts.openSans(fontSize: 10)),
                        series: <CartesianSeries<datiGraficoRitardo, double>>[
                          LineSeries<datiGraficoRitardo, double>(
                            xValueMapper: (datiGraficoRitardo dati, _) =>
                                dati.ora,
                            yValueMapper: (datiGraficoRitardo dati, _) =>
                                dati.ritardo,
                            dataSource: widget.lst_ritardo,
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Divider(
            color: const Color.fromARGB(255, 163, 163, 163),
            height: 0.3,
          ),
          SizedBox(
            height: 18,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {},
                  child: Image(
                    image: AssetImage(
                      'assets/images/grid.png',
                    ),
                    width: 38,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
