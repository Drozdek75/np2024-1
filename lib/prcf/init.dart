import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modern_textfield/modern_textfield.dart';
import 'package:np2024_01/widgets/nominativi.dart';

class init extends StatefulWidget {
  static const String path = '/init';
  init({super.key});

  @override
  State<init> createState() => _initState();
}

class _initState extends State<init> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
      onVerticalDragEnd: (details) {
        print(details.globalPosition.dx);
        if (details.globalPosition.dx <= 0) {
          Nominativo.dialogBuilder(context);
        }
        if (details.globalPosition.dx > MediaQuery.of(context).size.width - 5) {
          Nominativo.dialogBuilder(context, setName);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          shape: Border(
              bottom: BorderSide(
            color: Colors.black38,
            width: 0.5,
          )),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 7),
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
                    'Drozdek',
                    style:
                        GoogleFonts.lato(fontSize: 14, color: Colors.black54),
                  )
                ],
              ),
            )
          ],
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          toolbarHeight: 50,
          leading: Image(
            image: const AssetImage('assets/images/logo_intension.png'),
            width: 45,
          ),
          centerTitle: true,
        ),
        backgroundColor: const Color.fromARGB(255, 247, 247, 247),
        body: Row(
          children: [
            Container(
              width: 400,
              padding: EdgeInsets.all(8),
              height: MediaQuery.of(context).size.height - 40,
              color: const Color.fromARGB(255, 247, 247, 247),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Nominativo.dialogBuilder(context);
                            Nominativo.dialogBuilder(context, setName);
                          },
                          child: Container(
                            height: 50,
                            color: Colors.white,
                            padding: EdgeInsets.only(left: 7, right: 7),
                            child: TextField(
                              style: TextStyle(color: Colors.black87),
                              controller: nameController,
                              enabled: false,
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 175, 175, 175),
                                        width: 0.5),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 175, 175, 175),
                                        width: 0.5),
                                  ),
                                  hintText: 'Nominativo',
                                  hintStyle: GoogleFonts.lato(
                                      fontSize: 16,
                                      color:
                                          const Color.fromARGB(180, 0, 0, 0))),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        GestureDetector(
                          onTap: () {
                            print('on tap');
                            Navigator.pushNamed(context, '/orari');
                          },
                          child: Container(
                            height: 50,
                            color: Colors.white,
                            padding: EdgeInsets.only(
                              left: 7,
                              right: 7,
                            ),
                            child: TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 175, 175, 175),
                                        width: 0.5),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 175, 175, 175),
                                        width: 0.5),
                                  ),
                                  hintText: 'Orario evasione',
                                  hintStyle: GoogleFonts.lato(
                                      fontSize: 16,
                                      color:
                                          const Color.fromARGB(137, 0, 0, 0))),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 40,
              width: MediaQuery.of(context).size.width - 400,
              color: const Color.fromARGB(255, 206, 205, 202),
            )
          ],
        ),
      ),
    ));
  }

  void setName(String name) {
    nameController.text = name;
  }
}
