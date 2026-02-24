import 'package:crunch/features/home/data/models/product_model.dart';

abstract class ProductState {}

class InitialProductState extends ProductState {}

class LoadingProductState extends ProductState {}

class ErrorProductState extends ProductState {
  final String errMsg;

  ErrorProductState({required this.errMsg});
}

class SuccessProductState extends ProductState {
  List<ProductModel> products = [];
  SuccessProductState({required this.products});
}