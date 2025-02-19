import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modern_textfield/modern_textfield.dart';
import 'package:np2024_01/bloc/dashboard_bloc.dart';
import 'package:np2024_01/bloc/product_bloc.dart';
import 'package:np2024_01/repositories/ProductsRepository.dart';
import 'package:np2024_01/router/paramModels/hourModel.dart';
import 'package:np2024_01/widgets/FloatingSuggestion.dart';
import 'package:np2024_01/widgets/IngredientListContainer.dart';
import 'package:np2024_01/widgets/intensionFrame.dart';
import 'package:np2024_01/widgets/listProductContainer.dart';
import 'package:np2024_01/widgets/nominativi.dart';

class init extends StatefulWidget {
  static const String path = '/init';
  init({super.key});

  @override
  State<init> createState() => _initState();
}

class _initState extends State<init> {
  TextEditingController nameController = TextEditingController();
  TextEditingController hourController = TextEditingController();
  bool _vis = true;
  bool _vis_sub = false;
  bool _suggestion = false;
  int select_controller = -1;

  TextEditingController controller_pagato = TextEditingController();

  List<TextEditingController> controllers =[    
  ];

  List<String> numbers = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '++'];
  int category = 1;
  int subcategory = 5;

  @override
  void initState() {
    // TODO: implement initState

    controllers.add(controller_pagato);
    BlocProvider.of<ProductBloc>(context).add(productLoad());
  }

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
        floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
        floatingActionButton: GestureDetector(
          onVerticalDragEnd: (details) {
            if (details.globalPosition.dy >
                MediaQuery.of(context).size.height - 15) {
              setState(() {
                _suggestion = false;
              });
            }
          },
          onDoubleTap: () {},
          child: Visibility(
            visible: _suggestion,
            child: Floatingsuggestion(),
          ),
        ),
        appBar: AppBar(
          shape: Border(
              bottom: BorderSide(
            color: Colors.black38,
            width: 0.5,
          )),
          actions: [
            intensionFrame(),
          ],
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          scrolledUnderElevation: 0.0,
          toolbarHeight: 50,
          leading: GestureDetector(
            onTap: () {
              BlocProvider.of<ProductBloc>(context).add(productLoad());
            },
            child: Image(
              image: const AssetImage('assets/images/logo_intension.png'),
              width: 45,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: const Color.fromARGB(255, 247, 247, 247),
        body: Row(
          children: [
            Container(
              width: 400,
              padding: EdgeInsets.all(0),
              height: MediaQuery.of(context).size.height - 40,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 0, right: 0),
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
                            color: const Color.fromARGB(255, 236, 235, 235),
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
                                  hintStyle: GoogleFonts.publicSans(
                                      fontSize: 15,
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
                            Navigator.pushNamed(context, '/orari',
                                arguments: HoursModel(funct: setHour));
                          },
                          child: Container(
                            height: 50,
                            color: const Color.fromARGB(255, 236, 235, 235),
                            padding: EdgeInsets.only(
                              left: 7,
                              right: 7,
                            ),
                            child: TextField(
                              style: TextStyle(color: Colors.black87),
                              controller: hourController,
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
                                  hintStyle: GoogleFonts.publicSans(
                                      fontSize: 15,
                                      color:
                                          const Color.fromARGB(180, 0, 0, 0))),
                            ),
                          ),
                        ),

                        //************************* dettaglio ordine a video ****************************************************/

                        Container(
                          color: const Color.fromARGB(255, 252, 255, 178),
                          height: MediaQuery.of(context).size.height - 423,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.all(8),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 20,
                                                child: Text('#'),
                                              ),
                                              Container(
                                                width: 200,
                                                child: Text('descrizione'),
                                              ),
                                              Expanded(
                                                  child: Container(
                                                child: Text('prezzo'),
                                              )),
                                              Expanded(
                                                  child: Container(
                                                child: Text('totale'),
                                              ))
                                            ],
                                          )),
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 20,
                                              child: Text('1'),
                                            ),
                                            Container(
                                              width: 200,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('margherita'),
                                                  Text('  -mozzarella'),
                                                  Text('  +carciofi')
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                                child: Container(
                                              child: Text('8.50'),
                                            )),
                                            Expanded(
                                                child: Container(
                                                    child: Text('8.50')))
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 20,
                                              child: Text('1'),
                                            ),
                                            Container(
                                              width: 200,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('margherita'),
                                                  Text('  -mozzarella'),
                                                  Text('  +carciofi')
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                                child: Container(
                                              child: Text('8.50'),
                                            )),
                                            Expanded(
                                                child: Container(
                                                    child: Text('8.50')))
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 20,
                                              child: Text('1'),
                                            ),
                                            Container(
                                              width: 200,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('margherita'),
                                                  Text('  -mozzarella'),
                                                  Text('  +carciofi')
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                                child: Container(
                                              child: Text('8.50'),
                                            )),
                                            Expanded(
                                                child: Container(
                                                    child: Text('8.50')))
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 20,
                                              child: Text('1'),
                                            ),
                                            Container(
                                              width: 200,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('margherita'),
                                                  Text('  -mozzarella'),
                                                  Text('  +carciofi')
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                                child: Container(
                                              child: Text('8.50'),
                                            )),
                                            Expanded(
                                                child: Container(
                                                    child: Text('8.50')))
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 20,
                                              child: Text('1'),
                                            ),
                                            Container(
                                              width: 200,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('margherita'),
                                                  Text('  -mozzarella'),
                                                  Text('  +carciofi')
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                                child: Container(
                                              child: Text('8.50'),
                                            )),
                                            Expanded(
                                                child: Container(
                                                    child: Text('8.50')))
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 20,
                                              child: Text('1'),
                                            ),
                                            Container(
                                              width: 200,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('margherita'),
                                                  Text('  -mozzarella'),
                                                  Text('  +carciofi')
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                                child: Container(
                                              child: Text('8.50'),
                                            )),
                                            Expanded(
                                                child: Container(
                                                    child: Text('8.50')))
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 20,
                                              child: Text('1'),
                                            ),
                                            Container(
                                              width: 200,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('margherita'),
                                                  Text('  -mozzarella'),
                                                  Text('  +carciofi')
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                                child: Container(
                                              child: Text('8.50'),
                                            )),
                                            Expanded(
                                                child: Container(
                                                    child: Text('8.50')))
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 20,
                                              child: Text('1'),
                                            ),
                                            Container(
                                              width: 200,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('margherita'),
                                                  Text('  -mozzarella'),
                                                  Text('  +carciofi')
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                                child: Container(
                                              child: Text('8.50'),
                                            )),
                                            Expanded(
                                                child: Container(
                                                    child: Text('8.50')))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),

                              //****************************************************************************************************** */
                              Container(
                                width: 45,
                                decoration: BoxDecoration(
                                  border: Border(
                                      left: BorderSide(
                                          color: const Color.fromARGB(
                                              115, 67, 67, 67),
                                          width: 0.2)),
                                  color: Colors.transparent,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: numbers.map((e) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                            top: BorderSide(
                                                width: 0.2,
                                                color: const Color.fromARGB(
                                                    115, 80, 80, 80)),
                                            bottom: BorderSide(
                                                width: 0.2,
                                                color: const Color.fromARGB(
                                                    115, 220, 220, 220))),
                                      ),
                                      child: TextButton(
                                        child: Text('$e',
                                            style: GoogleFonts.publicSans(
                                                fontSize: 15,
                                                color: const Color.fromARGB(
                                                    255, 69, 69, 69))),
                                        onPressed: () {},
                                      ),
                                    );
                                  }).toList(),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          color: const Color.fromARGB(255, 69, 69, 69),
                          child: Row(
                            children: [
                              Container(
                                width: 260,
                                child: Center(
                                  child: Text(
                                    '€ 40.00',
                                    style: GoogleFonts.publicSans(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  color: const Color.fromARGB(255, 57, 57, 57),
                                  child: Center(
                                      child: Text(
                                    'NP',
                                    style: GoogleFonts.publicSans(
                                        fontSize: 16, color: Colors.white),
                                  )),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 0.5, color: Colors.black45)),
                                    color:
                                        const Color.fromARGB(255, 55, 139, 208),
                                  ),
                                  child: Center(
                                      child: Icon(Icons.print,
                                          color: Colors.white)),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 400,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 233, 233, 233),
                              border: Border(
                                  bottom: BorderSide(
                                      width: 0.5, color: Colors.black45))),
                          height: 40,
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: select_controller == 0
                                        ? const Color.fromARGB(
                                            255, 245, 255, 135)
                                        : Colors.transparent,
                                    border: Border(
                                        right: BorderSide(
                                            color: Colors.black45,
                                            width: 0.5))),
                                width: 130,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.paid,
                                      color:
                                          const Color.fromARGB(255, 75, 75, 75),
                                    ),
                                    Expanded(
                                        child: TextField(
                                      cursorHeight: 0,
                                      controller: controller_pagato,
                                      onTap: () {
                                        setState(() {
                                          if (select_controller != 0)
                                            select_controller = 0;
                                          else
                                            select_controller = -1;
                                        });
                                      },
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      textAlign: TextAlign.center,
                                      cursorWidth: 0.9,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 15.0),
                                        hintText: 'pagato',
                                        hintStyle: GoogleFonts.publicSans(
                                            fontSize: 15,
                                            color: select_controller == 0
                                                ? const Color.fromARGB(
                                                    255, 31, 31, 31)
                                                : Colors.black45),
                                        border: InputBorder.none,
                                      ),
                                    ))
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            color: Colors.black45,
                                            width: 0.5))),
                                width: 130,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.attach_money,
                                      color:
                                          const Color.fromARGB(255, 75, 75, 75),
                                    ),
                                    Expanded(
                                        child: TextField(
                                      enabled: false,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      textAlign: TextAlign.center,
                                      cursorWidth: 0.9,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 15.0),
                                        hintText: '0.00',
                                        hintStyle: GoogleFonts.publicSans(
                                            fontSize: 15,
                                            color: Colors.black45),
                                        border: InputBorder.none,
                                      ),
                                    ))
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 55, 139, 208),
                                      border: Border(
                                          right: BorderSide(
                                              width: 0.5,
                                              color: Colors.black45))),
                                  child: Center(
                                      child: Text(
                                    textAlign: TextAlign.center,
                                    'ROMANA',
                                    style: GoogleFonts.publicSans(
                                        fontSize: 11, color: Colors.white),
                                  )),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  color:
                                      const Color.fromARGB(255, 55, 139, 208),
                                  child: Center(
                                      child: Text(
                                    textAlign: TextAlign.center,
                                    'CONTI SEPARATI',
                                    style: GoogleFonts.publicSans(
                                        fontSize: 11, color: Colors.white),
                                  )),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 0.5, color: Colors.black45)),
                            color: const Color.fromARGB(255, 233, 233, 233),
                          ),
                          height: 40,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  controllers[select_controller].text += '7';
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border(
                                          right: BorderSide(
                                              width: 0.5,
                                              color: Colors.black45))),
                                  width: 65,
                                  child: Center(
                                      child: Text(
                                    '7',
                                    style: GoogleFonts.publicSans(
                                        color: Colors.black87, fontSize: 16),
                                  )),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border(
                                        right: BorderSide(
                                            width: 0.5,
                                            color: Colors.black45))),
                                width: 65,
                                child: Center(
                                    child: Text(
                                  '8',
                                  style: GoogleFonts.publicSans(
                                      color: Colors.black87, fontSize: 16),
                                )),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border(
                                        right: BorderSide(
                                            width: 0.5,
                                            color: Colors.black45))),
                                width: 65,
                                child: Center(
                                    child: Text(
                                  '9',
                                  style: GoogleFonts.publicSans(
                                      color: Colors.black87, fontSize: 16),
                                )),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border(
                                        right: BorderSide(
                                            width: 0.5,
                                            color: Colors.black45))),
                                width: 65,
                                child: Center(
                                    child: Text(
                                  'X',
                                  style: GoogleFonts.publicSans(
                                      color:
                                          const Color.fromARGB(255, 37, 37, 37),
                                      fontSize: 16),
                                )),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 55, 139, 208),
                                      border: Border(
                                          right: BorderSide(
                                              width: 0.5,
                                              color: Colors.black45))),
                                  //   width: 65,

                                  child: Center(
                                      child: Text(
                                    'POS',
                                    style: GoogleFonts.publicSans(
                                        color: const Color.fromARGB(
                                            221, 234, 234, 234),
                                        fontSize: 16),
                                  )),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 55, 139, 208),
                                      border: Border(
                                          right: BorderSide(
                                              width: 0.5,
                                              color: Colors.black45))),
                                  // width: 65,

                                  child: Center(
                                      child: Text(
                                    'FATTURA',
                                    style: GoogleFonts.publicSans(
                                        color: const Color.fromARGB(
                                            221, 234, 234, 234),
                                        fontSize: 11),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 0.5, color: Colors.black45)),
                            color: const Color.fromARGB(255, 233, 233, 233),
                          ),
                          height: 40,
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border(
                                        right: BorderSide(
                                            width: 0.5,
                                            color: Colors.black45))),
                                width: 65,
                                child: Center(
                                    child: Text(
                                  '4',
                                  style: GoogleFonts.publicSans(
                                      color: Colors.black87, fontSize: 16),
                                )),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border(
                                        right: BorderSide(
                                            width: 0.5,
                                            color: Colors.black45))),
                                width: 65,
                                child: Center(
                                    child: Text(
                                  '5',
                                  style: GoogleFonts.publicSans(
                                      color: Colors.black87, fontSize: 16),
                                )),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border(
                                        right: BorderSide(
                                            width: 0.5,
                                            color: Colors.black45))),
                                width: 65,
                                child: Center(
                                    child: Text(
                                  '6',
                                  style: GoogleFonts.publicSans(
                                      color: Colors.black87, fontSize: 16),
                                )),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border(
                                        right: BorderSide(
                                            width: 0.5,
                                            color: Colors.black45))),
                                width: 65,
                                child: Center(
                                  child: Icon(
                                    Icons.remove,
                                    color:
                                        const Color.fromARGB(255, 38, 38, 38),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 55, 139, 208),
                                      border: Border(
                                          right: BorderSide(
                                              width: 0.5,
                                              color: Colors.black45))),
                                  //   width: 65,

                                  child: Center(
                                      child: Icon(
                                    Icons.backup,
                                    color: const Color.fromARGB(
                                        255, 236, 236, 236),
                                  )),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 53, 139, 24),
                                      border: Border(
                                          right: BorderSide(
                                              width: 0.5,
                                              color: Colors.black45))),
                                  // width: 65,

                                  child: Center(
                                      child: Text(
                                    '# 7',
                                    style: GoogleFonts.publicSans(
                                        color: const Color.fromARGB(
                                            255, 225, 225, 225),
                                        fontSize: 16),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 0.5, color: Colors.black45)),
                            color: const Color.fromARGB(255, 233, 233, 233),
                          ),
                          height: 40,
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border(
                                        right: BorderSide(
                                            width: 0.5,
                                            color: Colors.black45))),
                                width: 65,
                                child: Center(
                                    child: Text(
                                  '1',
                                  style: GoogleFonts.publicSans(
                                      color: Colors.black87, fontSize: 16),
                                )),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border(
                                        right: BorderSide(
                                            width: 0.5,
                                            color: Colors.black45))),
                                width: 65,
                                child: Center(
                                    child: Text(
                                  '2',
                                  style: GoogleFonts.publicSans(
                                      color: Colors.black87, fontSize: 16),
                                )),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border(
                                        right: BorderSide(
                                            width: 0.5,
                                            color: Colors.black45))),
                                width: 65,
                                child: Center(
                                    child: Text(
                                  '3',
                                  style: GoogleFonts.publicSans(
                                      color: Colors.black87, fontSize: 16),
                                )),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border(
                                        right: BorderSide(
                                            width: 0.5,
                                            color: Colors.black45))),
                                width: 65,
                                child: Center(
                                  child: Text(
                                    '%-',
                                    style: GoogleFonts.publicSans(
                                        color: const Color.fromARGB(
                                            255, 37, 37, 37),
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border(
                                          right: BorderSide(
                                              width: 0.5,
                                              color: Colors.black45))),
                                  // width: 65,

                                  child: Center(
                                      child: Icon(Icons.backspace,
                                          color: Colors.black45)),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 245, 45, 45),
                                      border: Border(
                                          right: BorderSide(
                                              width: 0.5,
                                              color: Colors.black45))),
                                  //   width: 65,

                                  child: Center(
                                      child: Icon(
                                    Icons.delete_forever,
                                    size: 20,
                                    color: const Color.fromARGB(
                                        255, 232, 232, 232),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 0.5, color: Colors.black45)),
                            color: const Color.fromARGB(255, 233, 233, 233),
                          ),
                          height: 40,
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border(
                                        right: BorderSide(
                                            width: 0.5,
                                            color: Colors.black45))),
                                width: 65,
                                child: Center(
                                    child: Text(
                                  '0',
                                  style: GoogleFonts.publicSans(
                                      color: Colors.black87, fontSize: 16),
                                )),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border(
                                        right: BorderSide(
                                            width: 0.5,
                                            color: Colors.black45))),
                                width: 65,
                                child: Center(
                                    child: Text(
                                  '00',
                                  style: GoogleFonts.publicSans(
                                      color: Colors.black87, fontSize: 16),
                                )),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border(
                                        right: BorderSide(
                                            width: 0.5,
                                            color: Colors.black45))),
                                width: 65,
                                child: Center(
                                    child: Text(
                                  '.',
                                  style: GoogleFonts.publicSans(
                                      color: Colors.black87, fontSize: 16),
                                )),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border(
                                        right: BorderSide(
                                            width: 0.5,
                                            color: Colors.black45))),
                                width: 65,
                                child: Center(
                                  child: Text(
                                    '%+',
                                    style: GoogleFonts.publicSans(
                                        color: const Color.fromARGB(
                                            255, 38, 38, 38),
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border(
                                          right: BorderSide(
                                              width: 0.5,
                                              color: Colors.black45))),
                                  //   width: 65,

                                  child: Center(
                                      child: Text(
                                    '',
                                    style: GoogleFonts.publicSans(
                                        color: const Color.fromARGB(
                                            221, 234, 234, 234),
                                        fontSize: 16),
                                  )),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border(
                                          right: BorderSide(
                                              width: 0.5,
                                              color: Colors.black45))),
                                  // width: 65,

                                  child: Center(
                                      child: Text(
                                    '',
                                    style: GoogleFonts.publicSans(
                                        color: const Color.fromARGB(
                                            221, 234, 234, 234),
                                        fontSize: 11),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 20,
                    color: const Color.fromARGB(255, 49, 49, 49),
                    child: Row(
                      children: [
                        Container(
                          color: Colors.blue,
                          width: 40,
                          height: 20,
                          child: Icon(
                            Icons.storefront,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 40,
              width: MediaQuery.of(context).size.width - 400,
              color: const Color.fromARGB(255, 231, 231, 231),
              child: Column(
                children: [
                  Row(
                    children: [],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: const Color.fromARGB(
                                        255, 150, 150, 150),
                                    width: 0.2)),
                            color: Colors.transparent,
                          ),
                          padding: EdgeInsets.only(top: 4, bottom: 4, left: 10),
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  BlocProvider.of<ProductBloc>(context)
                                      .add(productLoad());
                                  setState(() {
                                    _vis = true;
                                    category = 1;
                                    subcategory = 5;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 17, right: 17, bottom: 0),
                                  decoration: BoxDecoration(
                                    color: category == 1
                                        ? const Color.fromARGB(
                                            255, 55, 139, 208)
                                        : const Color.fromARGB(
                                            255, 242, 242, 242),
                                    borderRadius: BorderRadius.circular(0),
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 91, 91, 91),
                                        width: 0.2),
                                  ),
                                  height: 40,
                                  child: Center(
                                      child: Text(
                                    'Pizze',
                                    style: GoogleFonts.publicSans(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: category == 1
                                            ? const Color.fromARGB(
                                                255, 255, 255, 255)
                                            : const Color.fromARGB(
                                                255, 125, 125, 125)),
                                  )),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    category = 2;
                                  });
                                },
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _vis = false;
                                      _vis_sub = true;
                                      category = 2;
                                      subcategory = 6;
                                    });

                                    BlocProvider.of<ProductBloc>(context)
                                        .add(ingredientLoad());
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 17, right: 17, bottom: 0),
                                    decoration: BoxDecoration(
                                      color: category == 2
                                          ? const Color.fromARGB(
                                              255, 55, 139, 208)
                                          : const Color.fromARGB(
                                              255, 242, 242, 242),
                                      borderRadius: BorderRadius.circular(0),
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 91, 91, 91),
                                          width: 0.2),
                                    ),
                                    height: 40,
                                    child: Center(
                                        child: Text(
                                      'Aggiunte',
                                      style: GoogleFonts.publicSans(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: category == 2
                                              ? const Color.fromARGB(
                                                  255, 255, 255, 255)
                                              : const Color.fromARGB(
                                                  255, 125, 125, 125)),
                                    )),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    category = 3;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 17, right: 17, bottom: 0),
                                  decoration: BoxDecoration(
                                    color: category == 3
                                        ? const Color.fromARGB(
                                            255, 55, 139, 208)
                                        : const Color.fromARGB(
                                            255, 242, 242, 242),
                                    borderRadius: BorderRadius.circular(0),
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 91, 91, 91),
                                        width: 0.2),
                                  ),
                                  height: 40,
                                  child: Center(
                                      child: Text('Bibite',
                                          style: GoogleFonts.publicSans(
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              color: category == 3
                                                  ? const Color.fromARGB(
                                                      255, 255, 255, 255)
                                                  : const Color.fromARGB(
                                                      255, 125, 125, 125)))),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    category = 4;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 17, right: 17, bottom: 0),
                                  decoration: BoxDecoration(
                                    color: category == 4
                                        ? const Color.fromARGB(
                                            255, 55, 139, 208)
                                        : const Color.fromARGB(
                                            255, 242, 242, 242),
                                    borderRadius: BorderRadius.circular(0),
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 91, 91, 91),
                                        width: 0.2),
                                  ),
                                  height: 40,
                                  child: Center(
                                      child: Text('Extra',
                                          style: GoogleFonts.publicSans(
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              color: category == 4
                                                  ? const Color.fromARGB(
                                                      255, 255, 255, 255)
                                                  : const Color.fromARGB(
                                                      255, 125, 125, 125)))),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 60,
                            height: 40,
                            color: Colors.transparent,
                            child: Center(
                                child: Text(
                              '19:25',
                              style: GoogleFonts.prompt(
                                  fontSize: 18,
                                  color: const Color.fromARGB(255, 36, 78, 96)),
                            )),
                          ),
                          Column(
                            children: [
                              Container(
                                  width: 45,
                                  child: Column(
                                    children: [
                                      Center(
                                        child: Text(
                                          '+2m',
                                          style: GoogleFonts.prompt(
                                              fontSize: 14, color: Colors.red),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          '315',
                                          style: GoogleFonts.prompt(
                                              fontSize: 14, color: Colors.blue),
                                        ),
                                      )
                                    ],
                                  ))
                            ],
                          )
                        ],
                      )
                    ],
                  ),

// PANNELLO SUBCATEGORIE PIZZE

                  Row(
                    children: [
                      Visibility(
                        visible: _vis,
                        child: Expanded(
                            child: Container(
                          color: Colors.transparent,
                          height: 50,
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 1, right: 5, bottom: 2, top: 2),
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    borderRadius: BorderRadius.circular(0),
                                    border: Border(
                                        top: BorderSide(
                                            color: const Color.fromARGB(
                                                66, 108, 108, 108),
                                            width: 1.2),
                                        bottom: BorderSide(
                                            color: const Color.fromARGB(
                                                66, 108, 108, 108),
                                            width: 1.2)),
                                  ),
                                  height: 50,
                                  child: Row(
                                    spacing: 5,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            subcategory = 0;
                                          });
                                          BlocProvider.of<ProductBloc>(context)
                                              .add(ProductFilterByCategory(
                                                  category: 's'));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              left: 15,
                                              right: 15,
                                              bottom: 5,
                                              top: 5),
                                          decoration: BoxDecoration(
                                            color: subcategory == 0
                                                ? const Color.fromARGB(
                                                    255, 55, 139, 208)
                                                : const Color.fromARGB(
                                                    255, 242, 242, 242),
                                            borderRadius:
                                                BorderRadius.circular(0),
                                            border: Border.all(
                                                color: const Color.fromARGB(
                                                    255, 91, 91, 91),
                                                width: 0.2),
                                          ),
                                          height: 40,
                                          child: Center(
                                              child: Text('Pizze speciali',
                                                  style: GoogleFonts.publicSans(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: subcategory == 0
                                                          ? const Color
                                                              .fromARGB(255,
                                                              255, 255, 255)
                                                          : const Color
                                                              .fromARGB(255,
                                                              125, 125, 125)))),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            subcategory = 1;
                                          });
                                          BlocProvider.of<ProductBloc>(context)
                                              .add(ProductFilterByCategory(
                                                  category: 'c'));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              left: 15, right: 15, bottom: 0),
                                          decoration: BoxDecoration(
                                            color: subcategory == 1
                                                ? const Color.fromARGB(
                                                    255, 55, 139, 208)
                                                : const Color.fromARGB(
                                                    255, 242, 242, 242),
                                            borderRadius:
                                                BorderRadius.circular(0),
                                            border: Border.all(
                                                color: const Color.fromARGB(
                                                    255, 91, 91, 91),
                                                width: 0.2),
                                          ),
                                          height: 40,
                                          child: Center(
                                              child: Text('Pizze classiche',
                                                  style: GoogleFonts.publicSans(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: subcategory == 1
                                                          ? const Color
                                                              .fromARGB(255,
                                                              255, 255, 255)
                                                          : const Color
                                                              .fromARGB(255,
                                                              125, 125, 125)))),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            subcategory = 2;
                                          });
                                          BlocProvider.of<ProductBloc>(context)
                                              .add(ProductFilterByCategory(
                                                  category: 'v'));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              left: 15, right: 15, bottom: 0),
                                          decoration: BoxDecoration(
                                            color: subcategory == 2
                                                ? const Color.fromARGB(
                                                    255, 55, 139, 208)
                                                : const Color.fromARGB(
                                                    255, 242, 242, 242),
                                            borderRadius:
                                                BorderRadius.circular(0),
                                            border: Border.all(
                                                color: const Color.fromARGB(
                                                    255, 91, 91, 91),
                                                width: 0.2),
                                          ),
                                          height: 40,
                                          child: Center(
                                              child: Text(
                                                  'Pizze a base di verdure',
                                                  style: GoogleFonts.publicSans(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: subcategory == 2
                                                          ? const Color
                                                              .fromARGB(255,
                                                              255, 255, 255)
                                                          : const Color
                                                              .fromARGB(255,
                                                              125, 125, 125)))),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            subcategory = 3;
                                          });
                                          BlocProvider.of<ProductBloc>(context)
                                              .add(ProductFilterByCategory(
                                                  category: 'p'));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              left: 15, right: 15, bottom: 0),
                                          decoration: BoxDecoration(
                                            color: subcategory == 3
                                                ? const Color.fromARGB(
                                                    255, 55, 139, 208)
                                                : const Color.fromARGB(
                                                    255, 242, 242, 242),
                                            borderRadius:
                                                BorderRadius.circular(0),
                                            border: Border.all(
                                                color: const Color.fromARGB(
                                                    255, 91, 91, 91),
                                                width: 0.2),
                                          ),
                                          height: 40,
                                          child: Center(
                                              child: Text(
                                                  'Pizze a base di pesce',
                                                  style: GoogleFonts.publicSans(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: subcategory == 3
                                                          ? const Color
                                                              .fromARGB(255,
                                                              255, 255, 255)
                                                          : const Color
                                                              .fromARGB(255,
                                                              125, 125, 125)))),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            subcategory = 4;
                                          });

                                          BlocProvider.of<ProductBloc>(context)
                                              .add(ProductFilterByCategory(
                                                  category: 'cl'));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              left: 15, right: 15, bottom: 0),
                                          decoration: BoxDecoration(
                                            color: subcategory == 4
                                                ? const Color.fromARGB(
                                                    255, 55, 139, 208)
                                                : const Color.fromARGB(
                                                    255, 242, 242, 242),
                                            borderRadius:
                                                BorderRadius.circular(0),
                                            border: Border.all(
                                                color: const Color.fromARGB(
                                                    255, 91, 91, 91),
                                                width: 0.2),
                                          ),
                                          height: 40,
                                          child: Center(
                                              child: Text('Calzoni',
                                                  style: GoogleFonts.publicSans(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: subcategory == 4
                                                          ? const Color
                                                              .fromARGB(255,
                                                              255, 255, 255)
                                                          : const Color
                                                              .fromARGB(255,
                                                              125, 125, 125)))),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            subcategory = 5;
                                          });
                                          BlocProvider.of<ProductBloc>(context)
                                              .add(productLoad());
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              left: 15, right: 15, bottom: 0),
                                          decoration: BoxDecoration(
                                            color: subcategory == 5
                                                ? const Color.fromARGB(
                                                    255, 55, 139, 208)
                                                : const Color.fromARGB(
                                                    255, 242, 242, 242),
                                            borderRadius:
                                                BorderRadius.circular(0),
                                            border: Border.all(
                                                color: const Color.fromARGB(
                                                    255, 91, 91, 91),
                                                width: 0.2),
                                          ),
                                          height: 40,
                                          child: Center(
                                              child: Text('Vista completa',
                                                  style: GoogleFonts.publicSans(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: subcategory == 5
                                                          ? const Color
                                                              .fromARGB(255,
                                                              255, 255, 255)
                                                          : const Color
                                                              .fromARGB(255,
                                                              125, 125, 125)))),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                      ),
                      Visibility(
                        visible: !_vis,
                        child: Expanded(
                            child: Container(
                          color: Colors.transparent,
                          height: 50,
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 1, right: 5, bottom: 2, top: 2),
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    borderRadius: BorderRadius.circular(0),
                                    border: Border(
                                        top: BorderSide(
                                            color: const Color.fromARGB(
                                                66, 108, 108, 108),
                                            width: 1.2),
                                        bottom: BorderSide(
                                            color: const Color.fromARGB(
                                                66, 108, 108, 108),
                                            width: 1.2)),
                                  ),
                                  height: 50,
                                  child: Row(
                                    spacing: 5,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            subcategory = 6;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              left: 15,
                                              right: 15,
                                              bottom: 5,
                                              top: 5),
                                          decoration: BoxDecoration(
                                            color: subcategory == 6
                                                ? const Color.fromARGB(
                                                    255, 55, 139, 208)
                                                : const Color.fromARGB(
                                                    255, 242, 242, 242),
                                            borderRadius:
                                                BorderRadius.circular(0),
                                            border: Border.all(
                                                color: const Color.fromARGB(
                                                    255, 91, 91, 91),
                                                width: 0.2),
                                          ),
                                          height: 40,
                                          child: Center(
                                              child: Text(
                                                  'Aggiunte vista completa',
                                                  style: GoogleFonts.publicSans(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: subcategory == 6
                                                          ? const Color
                                                              .fromARGB(255,
                                                              255, 255, 255)
                                                          : const Color
                                                              .fromARGB(255,
                                                              125, 125, 125)))),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            subcategory = 7;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              left: 15,
                                              right: 15,
                                              bottom: 5,
                                              top: 5),
                                          decoration: BoxDecoration(
                                            color: subcategory == 7
                                                ? const Color.fromARGB(
                                                    255, 55, 139, 208)
                                                : const Color.fromARGB(
                                                    255, 242, 242, 242),
                                            borderRadius:
                                                BorderRadius.circular(0),
                                            border: Border.all(
                                                color: const Color.fromARGB(
                                                    255, 91, 91, 91),
                                                width: 0.2),
                                          ),
                                          height: 40,
                                          child: Center(
                                              child: Text('Salumi',
                                                  style: GoogleFonts.publicSans(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: subcategory == 7
                                                          ? const Color
                                                              .fromARGB(255,
                                                              255, 255, 255)
                                                          : const Color
                                                              .fromARGB(255,
                                                              125, 125, 125)))),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            subcategory = 8;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              left: 15,
                                              right: 15,
                                              bottom: 5,
                                              top: 5),
                                          decoration: BoxDecoration(
                                            color: subcategory == 8
                                                ? const Color.fromARGB(
                                                    255, 55, 139, 208)
                                                : const Color.fromARGB(
                                                    255, 242, 242, 242),
                                            borderRadius:
                                                BorderRadius.circular(0),
                                            border: Border.all(
                                                color: const Color.fromARGB(
                                                    255, 91, 91, 91),
                                                width: 0.2),
                                          ),
                                          height: 40,
                                          child: Center(
                                              child: Text('Verdure',
                                                  style: GoogleFonts.publicSans(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: subcategory == 8
                                                          ? const Color
                                                              .fromARGB(255,
                                                              255, 255, 255)
                                                          : const Color
                                                              .fromARGB(255,
                                                              125, 125, 125)))),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            subcategory = 9;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              left: 15,
                                              right: 15,
                                              bottom: 5,
                                              top: 5),
                                          decoration: BoxDecoration(
                                            color: subcategory == 9
                                                ? const Color.fromARGB(
                                                    255, 55, 139, 208)
                                                : const Color.fromARGB(
                                                    255, 242, 242, 242),
                                            borderRadius:
                                                BorderRadius.circular(0),
                                            border: Border.all(
                                                color: const Color.fromARGB(
                                                    255, 91, 91, 91),
                                                width: 0.2),
                                          ),
                                          height: 40,
                                          child: Center(
                                              child: Text('Pesce',
                                                  style: GoogleFonts.publicSans(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: subcategory == 9
                                                          ? const Color
                                                              .fromARGB(255,
                                                              255, 255, 255)
                                                          : const Color
                                                              .fromARGB(255,
                                                              125, 125, 125)))),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            subcategory = 10;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              left: 15,
                                              right: 15,
                                              bottom: 5,
                                              top: 5),
                                          decoration: BoxDecoration(
                                            color: subcategory == 10
                                                ? const Color.fromARGB(
                                                    255, 55, 139, 208)
                                                : const Color.fromARGB(
                                                    255, 242, 242, 242),
                                            borderRadius:
                                                BorderRadius.circular(0),
                                            border: Border.all(
                                                color: const Color.fromARGB(
                                                    255, 91, 91, 91),
                                                width: 0.2),
                                          ),
                                          height: 40,
                                          child: Center(
                                              child: Text('Latticini',
                                                  style: GoogleFonts.publicSans(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: subcategory == 10
                                                          ? const Color
                                                              .fromARGB(255,
                                                              255, 255, 255)
                                                          : const Color
                                                              .fromARGB(255,
                                                              125, 125, 125)))),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 40,
                          width: 100,
                          color: const Color.fromARGB(255, 69, 69, 69),
                          child: Row(spacing: 1, children: [
                            GestureDetector(
                              onTap: () {
                                if (category == 1) {
                                  BlocProvider.of<ProductBloc>(context).add(
                                      ProductLoadStartWith(letter: ['a', 'b']));
                                } else if (category == 2) {
                                  BlocProvider.of<ProductBloc>(context).add(
                                      IngredientLoadStartWith(
                                          letter: ['a', 'b']));
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 8, right: 8, bottom: 0),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 105, 105, 105),
                                  borderRadius: BorderRadius.circular(0),
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 129, 129, 129),
                                      width: 0.2),
                                ),
                                height: 40,
                                child: Center(
                                    child: Text(
                                  ' A - B ',
                                  style: GoogleFonts.prompt(
                                      fontSize: 15,
                                      color: const Color.fromARGB(
                                          255, 220, 220, 220)),
                                )),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (category == 1) {
                                  BlocProvider.of<ProductBloc>(context).add(
                                      ProductLoadStartWith(letter: ['c', 'd']));
                                } else if (category == 2) {
                                  BlocProvider.of<ProductBloc>(context).add(
                                      IngredientLoadStartWith(
                                          letter: ['c', 'd']));
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 8, right: 8, bottom: 0),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 106, 106, 106),
                                  borderRadius: BorderRadius.circular(0),
                                  border: Border.all(
                                      color:
                                          const Color.fromARGB(255, 91, 91, 91),
                                      width: 0.2),
                                ),
                                height: 40,
                                child: Center(
                                    child: Text(' C - D ',
                                        style: GoogleFonts.prompt(
                                            fontSize: 15,
                                            color: const Color.fromARGB(
                                                255, 220, 220, 220)))),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (category == 1) {
                                  BlocProvider.of<ProductBloc>(context).add(
                                      ProductLoadStartWith(letter: ['e', 'f']));
                                } else if (category == 2) {
                                  BlocProvider.of<ProductBloc>(context).add(
                                      IngredientLoadStartWith(
                                          letter: ['e', 'f']));
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 8, right: 8, bottom: 0),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 107, 106, 106),
                                  borderRadius: BorderRadius.circular(0),
                                  border: Border.all(
                                      color:
                                          const Color.fromARGB(255, 91, 91, 91),
                                      width: 0.2),
                                ),
                                height: 40,
                                child: Center(
                                    child: Text(' E - F ',
                                        style: GoogleFonts.prompt(
                                            fontSize: 15,
                                            color: const Color.fromARGB(
                                                255, 220, 220, 220)))),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (category == 1) {
                                  BlocProvider.of<ProductBloc>(context).add(
                                      ProductLoadStartWith(letter: ['g', 'h']));
                                } else if (category == 2) {
                                  BlocProvider.of<ProductBloc>(context).add(
                                      IngredientLoadStartWith(
                                          letter: ['g', 'h']));
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 8, right: 8, bottom: 0),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 105, 105, 105),
                                  borderRadius: BorderRadius.circular(0),
                                  border: Border.all(
                                      color:
                                          const Color.fromARGB(255, 91, 91, 91),
                                      width: 0.2),
                                ),
                                height: 40,
                                child: Center(
                                    child: Text(' G - H ',
                                        style: GoogleFonts.prompt(
                                            fontSize: 15,
                                            color: const Color.fromARGB(
                                                255, 220, 220, 220)))),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (category == 1) {
                                  BlocProvider.of<ProductBloc>(context).add(
                                      ProductLoadStartWith(letter: ['i', 'l']));
                                } else if (category == 2) {
                                  BlocProvider.of<ProductBloc>(context).add(
                                      IngredientLoadStartWith(
                                          letter: ['i', 'l']));
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 8, right: 8, bottom: 0),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 104, 104, 104),
                                  borderRadius: BorderRadius.circular(0),
                                  border: Border.all(
                                      color:
                                          const Color.fromARGB(255, 91, 91, 91),
                                      width: 0.2),
                                ),
                                height: 40,
                                child: Center(
                                    child: Text(' I - L ',
                                        style: GoogleFonts.prompt(
                                            fontSize: 15,
                                            color: const Color.fromARGB(
                                                255, 220, 220, 220)))),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (category == 1) {
                                  BlocProvider.of<ProductBloc>(context).add(
                                      ProductLoadStartWith(letter: ['m', 'n']));
                                } else if (category == 2) {
                                  BlocProvider.of<ProductBloc>(context).add(
                                      IngredientLoadStartWith(
                                          letter: ['m', 'n']));
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 8, right: 8, bottom: 0),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 105, 105, 105),
                                  borderRadius: BorderRadius.circular(0),
                                  border: Border.all(
                                      color:
                                          const Color.fromARGB(255, 91, 91, 91),
                                      width: 0.2),
                                ),
                                height: 40,
                                child: Center(
                                    child: Text(' M - N ',
                                        style: GoogleFonts.prompt(
                                            fontSize: 15,
                                            color: const Color.fromARGB(
                                                255, 220, 220, 220)))),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (category == 1) {
                                  BlocProvider.of<ProductBloc>(context).add(
                                      ProductLoadStartWith(letter: ['o', 'p']));
                                } else if (category == 2) {
                                  BlocProvider.of<ProductBloc>(context).add(
                                      IngredientLoadStartWith(
                                          letter: ['o', 'p']));
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 8, right: 8, bottom: 0),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 105, 105, 105),
                                  borderRadius: BorderRadius.circular(0),
                                  border: Border.all(
                                      color:
                                          const Color.fromARGB(255, 91, 91, 91),
                                      width: 0.2),
                                ),
                                height: 40,
                                child: Center(
                                    child: Text(' O - P ',
                                        style: GoogleFonts.prompt(
                                            fontSize: 15,
                                            color: const Color.fromARGB(
                                                255, 220, 220, 220)))),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (category == 1) {
                                  BlocProvider.of<ProductBloc>(context).add(
                                      ProductLoadStartWith(letter: ['q', 'r']));
                                } else if (category == 2) {
                                  BlocProvider.of<ProductBloc>(context).add(
                                      IngredientLoadStartWith(
                                          letter: ['q', 'r']));
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 8, right: 8, bottom: 0),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 104, 104, 104),
                                  borderRadius: BorderRadius.circular(0),
                                  border: Border.all(
                                      color:
                                          const Color.fromARGB(255, 91, 91, 91),
                                      width: 0.2),
                                ),
                                height: 40,
                                child: Center(
                                    child: Text(' Q - R ',
                                        style: GoogleFonts.prompt(
                                            fontSize: 15,
                                            color: const Color.fromARGB(
                                                255, 220, 220, 220)))),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (category == 1) {
                                  BlocProvider.of<ProductBloc>(context).add(
                                      ProductLoadStartWith(letter: ['s', 't']));
                                } else if (category == 2) {
                                  BlocProvider.of<ProductBloc>(context).add(
                                      IngredientLoadStartWith(
                                          letter: ['s', 't']));
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 8, right: 8, bottom: 0),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 105, 105, 105),
                                  borderRadius: BorderRadius.circular(0),
                                  border: Border.all(
                                      color:
                                          const Color.fromARGB(255, 91, 91, 91),
                                      width: 0.2),
                                ),
                                height: 40,
                                child: Center(
                                    child: Text(' S - T ',
                                        style: GoogleFonts.prompt(
                                            fontSize: 15,
                                            color: const Color.fromARGB(
                                                255, 220, 220, 220)))),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (category == 1) {
                                  BlocProvider.of<ProductBloc>(context).add(
                                      ProductLoadStartWith(letter: ['u', 'v']));
                                } else if (category == 2) {
                                  BlocProvider.of<ProductBloc>(context).add(
                                      IngredientLoadStartWith(
                                          letter: ['u', 'v']));
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 8, right: 8, bottom: 0),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 105, 105, 105),
                                  borderRadius: BorderRadius.circular(0),
                                  border: Border.all(
                                      color:
                                          const Color.fromARGB(255, 91, 91, 91),
                                      width: 0.2),
                                ),
                                height: 40,
                                child: Center(
                                    child: Text(' U - V ',
                                        style: GoogleFonts.prompt(
                                            fontSize: 15,
                                            color: const Color.fromARGB(
                                                255, 220, 220, 220)))),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (category == 1) {
                                  BlocProvider.of<ProductBloc>(context).add(
                                      ProductLoadStartWith(letter: ['z', '*']));
                                } else if (category == 2) {
                                  BlocProvider.of<ProductBloc>(context).add(
                                      IngredientLoadStartWith(
                                          letter: ['z', '*']));
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 8, right: 8, bottom: 0),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 104, 104, 104),
                                  borderRadius: BorderRadius.circular(0),
                                  border: Border.all(
                                      color:
                                          const Color.fromARGB(255, 91, 91, 91),
                                      width: 0.2),
                                ),
                                height: 40,
                                child: Center(
                                    child: Text(' Z ',
                                        style: GoogleFonts.prompt(
                                            fontSize: 15,
                                            color: const Color.fromARGB(
                                                255, 220, 220, 220)))),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (category == 1) {
                                  BlocProvider.of<ProductBloc>(context)
                                      .add(productLoad());
                                } else if (category == 2) {
                                  BlocProvider.of<ProductBloc>(context)
                                      .add(ingredientLoad());
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 8, right: 8, bottom: 0),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 105, 105, 105),
                                  borderRadius: BorderRadius.circular(0),
                                  border: Border.all(
                                      color:
                                          const Color.fromARGB(255, 91, 91, 91),
                                      width: 0.2),
                                ),
                                height: 40,
                                child: Center(
                                    child: Icon(
                                  Icons.sort_by_alpha,
                                  color: const Color.fromARGB(255, 77, 234, 98),
                                )),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _suggestion = !_suggestion;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 8, right: 8, bottom: 0),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 105, 105, 105),
                                  borderRadius: BorderRadius.circular(0),
                                  border: Border.all(
                                      color:
                                          const Color.fromARGB(255, 91, 91, 91),
                                      width: 0.2),
                                ),
                                height: 40,
                                child: Center(
                                    child: Icon(
                                  Icons.settings_accessibility,
                                  color:
                                      const Color.fromARGB(255, 98, 148, 240),
                                )),
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(left: 8, right: 8, bottom: 0),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 106, 106, 106),
                                borderRadius: BorderRadius.circular(0),
                                border: Border.all(
                                    color:
                                        const Color.fromARGB(255, 91, 91, 91),
                                    width: 0.2),
                              ),
                              height: 40,
                              child: Center(
                                  child: Icon(
                                Icons.app_registration,
                                color: const Color.fromARGB(255, 230, 243, 89),
                              )),
                            ),
                            Expanded(
                                child: Container(
                              height: 40,
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  
                                ],
                              ),
                            ))
                          ]),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      spacing: 0,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Container(
                              width: 65,
                              color: const Color.fromARGB(255, 219, 219, 219),
                              child: Column(
                                children: [
                                  Container(
                                    width: 65,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            0, 226, 138, 7),
                                        border: Border.all(
                                            width: 0.2, color: Colors.black45)),
                                    child: TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          '1/2MT',
                                          style: GoogleFonts.publicSans(
                                              fontSize: 13,
                                              color: const Color.fromARGB(
                                                  255, 59, 59, 59)),
                                        )),
                                  ),
                                  Container(
                                    width: 65,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            0, 128, 5, 204),
                                        border: Border.all(
                                            width: 0.2, color: Colors.black45)),
                                    child: TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          '1MT',
                                          style: GoogleFonts.publicSans(
                                              fontSize: 13,
                                              color: const Color.fromARGB(
                                                  255, 62, 62, 62)),
                                        )),
                                  ),
                                  Container(
                                    width: 65,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color:
                                            const Color.fromARGB(0, 62, 62, 62),
                                        border: Border.all(
                                            width: 0.2, color: Colors.black45)),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Image(
                                        image: const AssetImage(
                                            'assets/images/safety_divider.png'),
                                        width: 30,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 65,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            0, 55, 139, 208),
                                        border: Border.all(
                                            width: 0.2, color: Colors.black45)),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Image(
                                        image: const AssetImage(
                                            'assets/images/schedule_send.png'),
                                        width: 30,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 65,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            0, 55, 139, 208),
                                        border: Border.all(
                                            width: 0.2, color: Colors.black45)),
                                    child: TextButton(
                                        onPressed: () {},
                                        child: Image(
                                          image: const AssetImage(
                                              'assets/images/view_list.png'),
                                          width: 30,
                                        )),
                                  ),
                                  Container(
                                    width: 65,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            0, 55, 139, 208),
                                        border: Border.all(
                                            width: 0.2,
                                            color: const Color.fromARGB(
                                                115, 61, 61, 61))),
                                    child: TextButton(
                                        onPressed: () {},
                                        child: Image(
                                          image: const AssetImage(
                                              'assets/images/receipt_long.png'),
                                          width: 30,
                                        )),
                                  ),
                                  Container(
                                    width: 65,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            0, 55, 139, 208),
                                        border: Border.all(
                                            width: 0.2, color: Colors.black45)),
                                    child: TextButton(
                                        onPressed: () {},
                                        child: Image(
                                          image: const AssetImage(
                                              'assets/images/network_node.png'),
                                          width: 30,
                                        )),
                                  ),
                                  Container(
                                    width: 65,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            0, 55, 139, 208),
                                        border: Border.all(
                                            width: 0.2, color: Colors.black45)),
                                    child: TextButton(
                                        onPressed: () {},
                                        child: Image(
                                          image: const AssetImage(
                                              'assets/images/discover_tune.png'),
                                          width: 30,
                                        )),
                                  ),
                                  Container(
                                    width: 65,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            0, 55, 139, 208),
                                        border: Border.all(
                                            width: 0.2, color: Colors.black45)),
                                    child: TextButton(
                                        onPressed: () {},
                                        child: Image(
                                          image: const AssetImage(
                                              'assets/images/ssid_chart.png'),
                                          width: 30,
                                        )),
                                  ),
                                  Container(
                                    width: 65,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            0, 55, 139, 208),
                                        border: Border.all(
                                            width: 0.2, color: Colors.black45)),
                                    child: TextButton(
                                        onPressed: () {},
                                        child: Image(
                                          image: const AssetImage(
                                              'assets/images/event_note.png'),
                                          width: 30,
                                        )),
                                  ),
                                  Container(
                                    width: 65,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            0, 180, 200, 28),
                                        border: Border.all(
                                            width: 0.2, color: Colors.black45)),
                                    child: TextButton(
                                        onPressed: () {},
                                        child: Image(
                                          image: const AssetImage(
                                              'assets/images/point_of_sale.png'),
                                          width: 30,
                                        )),
                                  ),
                                  Container(
                                    width: 65,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 123, 43, 208),
                                        border: Border.all(
                                            width: 0.2, color: Colors.black45)),
                                    child: TextButton(
                                        onPressed: () {},
                                        child: Icon(
                                          Icons.add,
                                          size: 22,
                                          color: const Color.fromARGB(
                                              255, 232, 232, 232),
                                        )),
                                  ),
                                   Container(
                                    width: 65,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(255, 223, 43, 43),
                                        border: Border.all(
                                            width: 0.2, color: Colors.black45)),
                                    child: TextButton(
                                        onPressed: () {},
                                        child: Icon(
                                          Icons.remove,
                                          size: 22,
                                          color: const Color.fromARGB(
                                              255, 232, 232, 232),
                                        )),
                                  ),
                                ],
                              ),
                            )),
                            Container(
                                height: 20,
                                width: 65,
                                child: Row(
                                  children: [
                                    Container(
                                      color: Colors.black,
                                      height: 20,
                                      child: Row(
                                        children: [],
                                      ),
                                    ),
                                  ],
                                ),
                                color: const Color.fromARGB(255, 51, 51, 51)),
                          ],
                        ),
                        Expanded(
                          child: BlocBuilder<ProductBloc, ProductState>(
                            builder: (context, state) {
                              if (state is ProductLoad) {
                                return productListContainer(
                                  lstP: state.productList,
                                );
                              }
                              if (state is IngredientLoad) {
                                return IngredientListContainer(
                                  lst: state.ingredientList,
                                );
                              }

                              return Text('');
                            },
                          ),
                        ),
                        Column(
                          children: [
                            Visibility(
                              visible: true,
                              child: Expanded(
                                  child: Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 219, 219, 219),
                                    border: Border(
                                        left: BorderSide(
                                            color: const Color.fromARGB(
                                                255, 33, 33, 33),
                                            width: 0.3))),
                                width: 30,
                                child: Column(
                                    spacing: 3,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: []),
                              )),
                            ),
                          ],
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
    ));
  }

  void setName(String name) {
    nameController.text = name;
  }

  void setHour(String hour) {
    hourController.text = hour;
  }
}
