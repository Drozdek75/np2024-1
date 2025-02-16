import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:np2024_01/models/products/Product.dart';

class productListContainer extends StatefulWidget {
  List<Product> lstP;

  productListContainer({super.key, required this.lstP});

  @override
  State<productListContainer> createState() => _productListContainerState();
}

class _productListContainerState extends State<productListContainer> {
  final GlobalKey gk = GlobalKey();

  var f = NumberFormat("###.0#", "en_US");
  var eurosInUSFormat = NumberFormat.currency(locale: "en_US", symbol: "€");

  // ignore: prefer_typing_uninitialized_variables

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int index = -1;
    return LayoutBuilder(
      builder: (context, constraints) {
        final sgk = gk.currentContext;
        if (sgk != null) {
          final box = sgk!.findRenderObject() as RenderBox;
        }
        return Container(
          key: gk,
          padding: EdgeInsets.all(0),
          width: MediaQuery.of(context).size.width,
          color: const Color.fromARGB(255, 219, 219, 219),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: SingleChildScrollView(
                child: Wrap(                  
                  spacing: 0,
                  runSpacing: 0,
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.start,
                  runAlignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: widget.lstP.map((element) {
                    final pricestr = element.price!.toStringAsPrecision(2);
                    index++;
                    return GestureDetector(
                        onTap: () {
                          getSize();
                        },
                        onDoubleTap: () {
                          print('long pressed');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(255, 188, 188, 188),
                                width: 0.2),
                            color: index % 2 != 0
                                ? const Color.fromARGB(255, 255, 255, 255)
                                : const Color.fromARGB(255, 248, 250, 250),
                          ),
                          width: (((MediaQuery.of(context).size.width) - 30) -
                                  465) /
                              5,
                          height: 100,
                          padding: EdgeInsets.all(5),

                          //child: Center(child: Text(element.name!))),

                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        '${eurosInUSFormat.format(element.price)}',
                                        style: GoogleFonts.publicSans(
                                            fontSize: 10,
                                            color: const Color.fromARGB(
                                                255, 45, 45, 45)),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(right: 10, left: 10),
                                      child: Text(
                                        'disp 7/30',
                                        style: GoogleFonts.publicSans(
                                            fontSize: 10,
                                            color: const Color.fromARGB(
                                                180, 36, 36, 36)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Expanded(
                                child: Container(
                                  child: Center(
                                    child: Text('${element.name}',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.publicSans(
                                            fontSize: 19,
                                            color: const Color.fromARGB(
                                                220, 20, 20, 20))),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ));
                  }).toList(),
                ),
              )),
              Container(
                height: 20,
                color: const Color.fromARGB(255, 49, 49, 49),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.chat_bubble,
                        color: Colors.white,
                        size: 17,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );


    
  }

  void getSize() {
    final sgk = gk.currentContext;
    if (sgk != null) {
      final box = sgk!.findRenderObject() as RenderBox;
      print('tap on container');
    }
  }
}
