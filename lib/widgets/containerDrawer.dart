import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class containerDrawerOrari extends StatefulWidget {
  List<String> lst_orari_str;
  containerDrawerOrari({super.key, required this.lst_orari_str});

  @override
  State<containerDrawerOrari> createState() => _containerDrawerOrariState();
}

class _containerDrawerOrariState extends State<containerDrawerOrari> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.zero,
        color: Color.fromARGB(255, 239, 239, 239),
      ),
      width: 200,
      child: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.zero,
            color: const Color.fromARGB(237, 30, 30, 30),
          ),
          width: 200,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: widget.lst_orari_str.map((e) {
                  return Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(31, 94, 94, 94),
                        border: Border(
                            top: BorderSide(
                                color: const Color.fromARGB(255, 169, 169, 169),
                                width: 0.1))),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            e.substring(0, 2),
                            style: GoogleFonts.lato(
                                color: Color.fromARGB(255, 216, 226, 28),
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            e.substring(3, 5),
                            style: GoogleFonts.lato(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: LinearProgressIndicator(
                              backgroundColor:
                                  const Color.fromARGB(31, 100, 100, 100),
                              borderRadius: BorderRadius.circular(1),
                              color: const Color.fromARGB(255, 18, 199, 69),
                              value: 0.5,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 7),
                            child: Text(
                              '10',
                              style: GoogleFonts.lato(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }).toList()),
          ),
        ),
      ),
    );
  }
}
