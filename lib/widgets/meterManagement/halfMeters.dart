import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class halfMeters extends StatefulWidget {
  const halfMeters({super.key});

  @override
  State<halfMeters> createState() => _halfMetersState();
}

class _halfMetersState extends State<halfMeters> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 252, 255, 178),
      height: MediaQuery.of(context).size.height - 423,
      width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Gestione 1/2 metro',
                style: GoogleFonts.openSans(
                    fontSize: 20, color: const Color.fromARGB(255, 97, 97, 97)),
              ),
              Expanded(
                child: Container(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
