import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class intensionFrame extends StatefulWidget {
  const intensionFrame({super.key});

  @override
  State<intensionFrame> createState() => _intensionFrameState();
}

class _intensionFrameState extends State<intensionFrame> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Row(
          children: <Widget>[
            Image(
              image: const AssetImage('assets/images/chat.png'),
              width: 27,
            ),
            SizedBox(
              width: 12,
            ),
            Image(
              image: const AssetImage('assets/images/notifications.png'),
              width: 27,
            ),
            SizedBox(
              width: 12,
            ),
            CircleAvatar(
              radius: 17,
              backgroundImage: AssetImage('assets/images/avatar.jpg'),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              'Drozdek W',
              style: GoogleFonts.lato(fontSize: 14, color: Colors.black54),
            )
          ],
        ),
      ),
    );
  }
}
