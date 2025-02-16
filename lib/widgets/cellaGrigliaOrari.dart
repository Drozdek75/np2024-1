import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:np2024_01/router/paramModels/hourModel.dart';

class Cellagrigliaorari extends StatefulWidget {
  String E;
  HoursModel? funct;
  Cellagrigliaorari({super.key, required this.E, required this.funct});

  @override
  State<Cellagrigliaorari> createState() => _CellagrigliaorariState();
}

class _CellagrigliaorariState extends State<Cellagrigliaorari> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('click');
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  widget.funct!.funct(widget.E);
                                  Navigator.pop(context);
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      widget.E.substring(0, 2),
                                      style: GoogleFonts.openSans(
                                          color: const Color.fromARGB(
                                              255, 216, 226, 28),
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      textAlign: TextAlign.end,
                                      widget.E.substring(3, 5),
                                      style: GoogleFonts.openSans(
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: 50,
                          height: (MediaQuery.of(context).size.height / 4) - 90,
                          color: Colors.transparent,
                          child: Column(
                            children: [
                              Expanded(
                                child: Wrap(
                                  direction: Axis.horizontal,
                                  spacing: 7,
                                  runSpacing: 2,
                                  children: [
                                    Text('Simionato  - ',
                                        style: GoogleFonts.lato(
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255))),
                                    Text('Masiero  - ',
                                        style: GoogleFonts.lato(
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255))),
                                    Text('Drozdek  - ',
                                        style: GoogleFonts.lato(
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255))),
                                    Text('Bortolato  - ',
                                        style: GoogleFonts.lato(
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255))),
                                    Text('Davide  - ',
                                        style: GoogleFonts.lato(
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255))),
                                    Text('Rino Gattuso',
                                        style: GoogleFonts.lato(
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255)))
                                  ],
                                ),
                              ),
                              Container(
                                height: 40,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 20,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 7),
                                        child: Row(
                                          children: [
                                            Text(
                                              '1MT : ',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13),
                                            ),
                                            SizedBox(width: 7),
                                            Text(
                                              '1',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 13),
                                            ),
                                            SizedBox(
                                              width: 22,
                                            ),
                                            Text(
                                              '1/2MT : ',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: const Color.fromARGB(
                                                      255, 97, 97, 97),
                                                  fontSize: 13),
                                            ),
                                            SizedBox(width: 7),
                                            Text(
                                              '0',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: const Color.fromARGB(
                                                      255, 97, 97, 97),
                                                  fontSize: 13),
                                            ),
                                            SizedBox(
                                              width: 22,
                                            ),
                                            Image(
                                              image: const AssetImage(
                                                  'assets/images/fries.png'),
                                            ),
                                            SizedBox(width: 7),
                                            Text(
                                              '1',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 13),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(31, 94, 94, 94),
                                    border: Border(
                                        top: BorderSide(
                                            color: const Color.fromARGB(
                                                255, 169, 169, 169),
                                            width: 0.1))),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7, bottom: 7),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      width: 20,
                      height: 100,
                      child: Column(
                        children: [
                          Text(
                            '7',
                            style: GoogleFonts.lato(
                                fontSize: 19,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 87, 109, 255),
                                      width: 0.1)),
                              margin: EdgeInsets.only(top: 7, bottom: 7),
                              width: 10,
                              child: RotatedBox(
                                  quarterTurns: -1,
                                  child: LinearProgressIndicator(
                                    backgroundColor:
                                        const Color.fromARGB(31, 100, 100, 100),
                                    borderRadius: BorderRadius.circular(1),
                                    color:
                                        const Color.fromARGB(255, 18, 199, 69),
                                    value: 0.5,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        width: 400,
        decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromARGB(255, 137, 137, 137),
                width: 0.1,
                strokeAlign: BorderSide.strokeAlignCenter)),
        height: (MediaQuery.of(context).size.height / 4) - 28,
        margin: EdgeInsets.all(5),
      ),
    );
  }
}
