import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Floatingsuggestion extends StatelessWidget {
  const Floatingsuggestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        border: Border.all(
          color: const Color.fromARGB(255, 62, 62, 62),
          width: 0.2,
        ),
      ),
      width: 220,
      height: MediaQuery.of(context).size.height * 0.75,
      child: Column(
        spacing: 7,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tolte possibili',
                style: GoogleFonts.openSans(
                    fontSize: 20,
                    color: const Color.fromARGB(255, 98, 124, 144)),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          TextButton(
              onPressed: () {},
              child: Center(
                child: Text(
                  '- Mozzarella',
                  style: GoogleFonts.openSans(
                      fontSize: 17,
                      color: const Color.fromARGB(255, 108, 108, 108)),
                ),
              )),
          TextButton(
            onPressed: () {},
            child: Center(
              child: Text(
                '- pomodoro',
                style: GoogleFonts.publicSans(
                    fontSize: 17,
                    color: const Color.fromARGB(255, 108, 108, 108)),
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Center(
              child: Text('- funghi',
                  style: GoogleFonts.publicSans(
                      fontSize: 17,
                      color: const Color.fromARGB(255, 108, 108, 108))),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Center(
              child: Text(
                '- prosciutto',
                style: GoogleFonts.publicSans(
                    fontSize: 17,
                    color: const Color.fromARGB(255, 108, 108, 108)),
              ),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                maxLines: 2,
                'Aggiunte consigliate',
                softWrap: true,
                style: GoogleFonts.openSans(
                    fontSize: 20,
                    color: const Color.fromARGB(255, 98, 124, 144)),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          TextButton(
              onPressed: () {},
              child: Center(
                child: Text(
                  '- Mozzarella',
                  style: GoogleFonts.publicSans(
                      fontSize: 17,
                      color: const Color.fromARGB(255, 108, 108, 108)),
                ),
              )),
          TextButton(
            onPressed: () {},
            child: Center(
              child: Text(
                '- pomodoro',
                style: GoogleFonts.publicSans(
                    fontSize: 17,
                    color: const Color.fromARGB(255, 108, 108, 108)),
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Center(
              child: Text('- funghi',
                  style: GoogleFonts.publicSans(
                      fontSize: 17,
                      color: const Color.fromARGB(255, 108, 108, 108))),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Center(
              child: Text(
                '- prosciutto',
                style: GoogleFonts.publicSans(
                    fontSize: 17,
                    color: const Color.fromARGB(255, 108, 108, 108)),
              ),
            ),
          ),
          TextButton(
              onPressed: () {},
              child: Center(
                child: Text(
                  '- Mozzarella',
                  style: GoogleFonts.publicSans(
                      fontSize: 17,
                      color: const Color.fromARGB(255, 108, 108, 108)),
                ),
              )),
          TextButton(
            onPressed: () {},
            child: Center(
              child: Text(
                '- pomodoro',
                style: GoogleFonts.publicSans(
                    fontSize: 17,
                    color: const Color.fromARGB(255, 108, 108, 108)),
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Center(
              child: Text('- funghi',
                  style: GoogleFonts.publicSans(
                      fontSize: 17,
                      color: const Color.fromARGB(255, 108, 108, 108))),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Center(
              child: Text(
                '- prosciutto',
                style: GoogleFonts.publicSans(
                    fontSize: 17,
                    color: const Color.fromARGB(255, 108, 108, 108)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
