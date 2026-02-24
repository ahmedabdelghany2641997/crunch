import 'package:bloc/bloc.dart';
import 'package:crunch/features/home/data/models/product_model.dart';
import 'package:crunch/features/home/pressentation/cubit/products_states.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.dio) : super(InitialProductState());

  static ProductCubit get(context) => BlocProvider.of(context);

  final Dio dio;

  List<ProductModel> products = [];

 Future<void> getProuducts() async {
    emit(LoadingProductState());
    try {
      final res = await dio.get("https://dummyjson.com/products");
      if (res.statusCode == 200) {
        products = [];
        for (var product in res.data["products"]) {
          products.add(ProductModel.fromJson(product));
        }
        emit(SuccessProductState(products: products));
      } else {
        emit(ErrorProductState(errMsg: "Status not good"));
      }
    } on Exception catch (e) {
      emit(ErrorProductState(errMsg: e.toString()));
    }
  }
}
