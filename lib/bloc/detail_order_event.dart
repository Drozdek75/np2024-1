part of 'detail_order_bloc.dart';

abstract class DetailOrderEvent extends Equatable {
  const DetailOrderEvent();

  @override
  List<Object> get props => [];
}

class detailOrderLoadEvent extends DetailOrderEvent {}

class detailOrderAdd extends DetailOrderEvent {
  OrderDetail det;

  detailOrderAdd({required this.det});
}

class detailOrderAddProduct extends DetailOrderEvent {
  orderDetailFF addDetail;
  int index;

  detailOrderAddProduct({required this.addDetail, required this.index});
}

class selectTupla extends DetailOrderEvent {
  int cod_select;

  selectTupla({required this.cod_select});
}

class changeQT extends DetailOrderEvent {
  int cod_select;
  int qt;

  changeQT({required this.cod_select, required this.qt});
}

class incDecQT extends DetailOrderEvent {
  int cod_select;
  String op;

  incDecQT({required this.cod_select, required this.op});
}

class minusPlus extends DetailOrderEvent {
  int cod_macro;
  int cod_ingredient;
  int op;

  minusPlus({required this.cod_macro, required this.cod_ingredient,  required this.op});
}
