part of 'detail_order_bloc.dart';

abstract class DetailOrderState extends Equatable {
  const DetailOrderState();

  @override
  List<Object> get props => [];
}

class DetailOrderInitial extends DetailOrderState {}

class DetailOrderLoad extends DetailOrderState {
  List<OrderDetail> lst = [];

  DetailOrderLoad({required this.lst});

  @override
  List<Object> get props => [lst];
}

class DetailOrderAddState extends DetailOrderState {
  List<OrderDetail> ord = [];
  int inc, inx = 0;


  DetailOrderAddState({required this.ord, required this.inc, required inx}) {
    print('-->${ord.length}');
  }

  @override
  List<Object> get props => [ord.hashCode, inc];
}



