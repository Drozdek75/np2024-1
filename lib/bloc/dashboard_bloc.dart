import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:np2024_01/bloc/product_bloc.dart';
import 'package:np2024_01/models/products/Product.dart';
import 'package:np2024_01/repositories/ProductsRepository.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  Productsrepository productRepo;

  DashboardBloc({required this.productRepo}) : super(DashboardInitial()) {
    on<DashboardEvent>((event, emit) {
      // TODO: implement event handler
    });

    
  }
}
