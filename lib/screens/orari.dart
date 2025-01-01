import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class orari extends StatefulWidget {
  static const String path = '/orari';
  const orari({super.key});

  @override
  State<orari> createState() => _orariState();
}

class _orariState extends State<orari> {
  bool _visi = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
      onVerticalDragEnd: (details) {
        print(details.globalPosition.dx);
        if (details.globalPosition.dx <= 0) {
          //Navigator.pop(context);
          setState(() {
            _visi = true;
          });
        }
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 53, 53, 53),
            automaticallyImplyLeading: false,
            elevation: 0,
            title: Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Text(
                'Situazione orari',
                style: GoogleFonts.openSans(
                    fontSize: 16,
                    color: const Color.fromARGB(239, 255, 255, 255)),
              ),
            ),
            actions: [
              Container(
                padding: EdgeInsets.only(left: 8, right: 15),
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 5, bottom: 5),
                color: const Color.fromARGB(221, 71, 71, 71),
                //  width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.ssid_chart,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Text('+2 m',
                        style: GoogleFonts.openSans(
                            color: const Color.fromARGB(255, 105, 246, 110),
                            fontSize: 14)),
                  ],
                ),
              ),
              SizedBox(width: 3),
              Container(
                padding: EdgeInsets.only(left: 8, right: 15),
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 5, bottom: 5),
                color: const Color.fromARGB(221, 71, 71, 71),
                //  width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'primo orario utile',
                      style: GoogleFonts.openSans(
                          color: Colors.white, fontSize: 13),
                    ),
                    Text('53 m',
                        style: GoogleFonts.openSans(
                            color: const Color.fromARGB(255, 134, 179, 242),
                            fontSize: 14)),
                  ],
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Container(
                padding: EdgeInsets.only(left: 8, right: 15),
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 5, bottom: 5),
                color: const Color.fromARGB(221, 71, 71, 71),
                //  width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ritardo stimato',
                      style: GoogleFonts.openSans(
                          color: Colors.white, fontSize: 13),
                    ),
                    Text('9 m',
                        style: GoogleFonts.openSans(
                            color: const Color.fromARGB(255, 105, 246, 110),
                            fontSize: 14)),
                  ],
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Container(
                padding: EdgeInsets.only(left: 8, right: 15),
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 5, bottom: 5),
                color: const Color.fromARGB(221, 71, 71, 71),
                //  width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.schedule,
                      color: const Color.fromARGB(255, 240, 248, 92),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Text('19:36',
                        style: GoogleFonts.openSans(
                            color: const Color.fromARGB(255, 240, 248, 92),
                            fontSize: 14)),
                  ],
                ),
              ),
            ],
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Row(
              children: [
                Visibility(
                  visible: _visi,
                  child: Container(
                    width: 40,
                    color: Color.fromARGB(255, 230, 230, 230),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                )
              ],
            ),
          )),
    ));
  }
}
