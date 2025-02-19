import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class appBarFrame extends StatelessWidget {
  const appBarFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      color: const Color.fromARGB(255, 49, 49, 49),
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

          Container(
            width: 500,
              child: Text('Asparagi al posto del radicchio rosso di Treviso', style: GoogleFonts.openSans(fontSize: 11, color:  Colors.yellow),),
             ),
           
            Container(
            width: 30,
            height: 20,
            color: Colors.transparent,
             child: Icon(Icons.sync, color: Colors.white, size: 17,)
           ),
           Container(
            width: 30,
            height: 20,
            color: Colors.transparent,
             child: Icon(Icons.wifi, color: Colors.white, size: 17,)
           ),
           
          ],
        ),
      ),
    );
  }
}
