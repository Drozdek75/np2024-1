import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:np2024_01/bloc/product_bloc.dart';
import 'package:np2024_01/models/products/Product.dart';
import 'package:np2024_01/repositories/ProductsRepository.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';

import 'dart:io';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  Productsrepository productRepo;

  DashboardBloc({required this.productRepo}) : super(DashboardInitial()) {
    on<PrinterDiscovered>((event, emit) async {
      /*   print('avvio socket');
      connectToWebSocket(
    socketUrl: 'ws://127.0.0.1:9977',
  ).then((webSocket) {
    if (webSocket != null) {
      // WebSocket connection successful, you can now interact with the server
      webSocket.listen(
        (data) {
          print('Received message: $data');
        },
        onError: (error) {
          print('Error occurred: $error');
        },
        onDone: () {
          print('WebSocket connection closed');
        },
      );

      webSocket.add('Hello, Server!');

      // To close the WebSocket connection, you can use:
      // webSocket.close();
    } else {
      // WebSocket connection failed
      print('WebSocket connection failed.');
    }
  });*/
    });
  }
}
