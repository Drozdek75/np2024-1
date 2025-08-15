import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:np2024_01/models/order/orderDetail.dart';
import 'package:np2024_01/models/order/orderDetailFf.dart';
import 'package:np2024_01/models/products/Ingredient.dart';
import 'package:np2024_01/models/products/Product.dart';

part 'detail_order_event.dart';
part 'detail_order_state.dart';

class DetailOrderBloc extends Bloc<DetailOrderEvent, DetailOrderState> {
  List<OrderDetail> ordDet = [];
  DetailOrderBloc() : super(DetailOrderInitial()) {
    Random random = Random();
    int cod_maro_select = 1;
    int cod_odd_select = 1;

    on<detailOrderAdd>((event, emit) async {
      ordDet.add(event.det);
      print('order lengfht: ${ordDet.length}');

      emit(DetailOrderAddState(
          ord: ordDet, inc: random.nextInt(99999), inx: (ordDet.length + 1)));
    });

    on<detailOrderAddProduct>(
      (event, emit) {
        print('dentro ad add product');
        //  ordDet.elementAt(1).odd.add(event.addDetail);

        ordDet.forEach(
          (element) {
            print('controllo bloc: ${element.progressivo} vs ${event.index}');

            if (element.progressivo == event.index) {
              print('dentro add: ${element.name}');
              element.odd.add(event.addDetail);
            }
          },
        );
        emit(DetailOrderAddState(
            ord: ordDet, inc: random.nextInt(99999), inx: (ordDet.length + 1)));
      },
    );

    on<selectTupla>(
      (event, emit) {
        cod_maro_select = event.cod_select;
      },
    );

    on<changeQT>(
      (event, emit) {
        ordDet.forEach(
          (element) {
            if (element.progressivo == event.cod_select) {
              element.qt = event.qt;
            }
          },
        );
        emit(DetailOrderAddState(
            ord: ordDet, inc: random.nextInt(99999), inx: (ordDet.length + 1)));
      },
    );

    on<incDecQT>(
      (event, emit) {
        ordDet.forEach(
          (element) {
            if (element.progressivo == event.cod_select) {
              if (event.op == '++') {
                element.qt = ++element.qt;
              } else if (event.op == '--' && element.qt > 1) {
                element.qt = --element.qt;
              }
            }
          },
        );
        emit(DetailOrderAddState(
            ord: ordDet, inc: random.nextInt(99999), inx: (ordDet.length + 1)));
      },
    );

    on<minusPlus>(
      (event, emit) {
        ordDet.forEach(
          (prodotto) {
            if (prodotto.progressivo == event.cod_macro) {
              prodotto.odd.forEach(
                (element) {
                  if (element.id == event.cod_ingredient) {
                    element.type = event.op;
                  }
                },
              );
            }
          },
        );
        emit(DetailOrderAddState(
            ord: ordDet, inc: random.nextInt(99999), inx: (ordDet.length + 1)));
      },
    );
  }

  double getTotale(int cod_sel) {
    double tot = 0;
    ordDet.forEach(
      (element) {
        if (element.progressivo == cod_sel) {
          tot += element.price * element.qt;
          element.odd.forEach(
            (addOdd) {
              if (addOdd.type == 1) {
                tot += ListIngredients.getPriceByCod(addOdd.cod_product!);
              } else if (addOdd.type == -1) {
                tot -= ListIngredients.getPriceByCod(addOdd.cod_product!);
              }
            },
          );
        }
      },
    );

    return tot;
  }

  bool isPresentIngredient(int cod_ingredient, int cod_macro) {
    bool ret = false;

    listProducts.lstProduct.forEach(
      (element) {
        if (element.id == getCodByProgressivo(cod_macro)) {
          element.ingredientsList!.forEach(
            (element) {
              //print('${element.id} - ${element.name}');
              if (element.id == cod_ingredient && ret == false) {
                ret = true;
              }
            },
          );
        }
      },
    );

    return ret;
  }

  int getCodByProgressivo(int progressivo) {
    int cod = -1;
    ordDet.forEach(
      (element) {
        if (element.progressivo == progressivo) {
          cod = element.id;
        }
      },
    );
    return cod;
  }

  int get cod_macro_sel => cod_macro_sel;
}
