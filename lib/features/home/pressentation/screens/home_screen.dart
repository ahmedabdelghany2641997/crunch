import 'package:crunch/features/home/pressentation/cubit/Products_cubit.dart';
import 'package:crunch/features/home/pressentation/cubit/products_states.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(Dio())..getProuducts(),
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = BlocProvider.of<ProductCubit>(context);
          return Scaffold(
            backgroundColor: Colors.grey[50],

            body: SafeArea(
              child: state is LoadingProductState
                  ? Center(child: CircularProgressIndicator())
                  : state is ErrorProductState
                  ? Text(state.errMsg)
                  : state is SuccessProductState
                  ? state.products.isEmpty
                        ? Text("there is no products")
                        : Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 0.55,
                                  ),
                              itemCount: state.products.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 9),
                                        blurRadius: 15,
                                        color: Colors.black.withValues(
                                          alpha: 0.10,
                                        ),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment: .start,
                                    children: [
                                      Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(12),
                                            ),
                                            child: Image.network(
                                              state.products[index].imageUrl ??
                                                  "assets/images/product.png",
                                              fit: .cover,
                                              width: double.infinity,
                                            ),
                                          ),
                                          Positioned(
                                            right: 4,
                                            top: 4,
                                            child: IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Column(
                                            crossAxisAlignment: .start,
                                            mainAxisAlignment: .spaceEvenly,
                                            children: [
                                              Text(
                                                state.products[index].title,
                                                overflow: .visible,
                                                maxLines: 1,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              SizedBox(height: 4,),
                                              Text(

                                                overflow: .ellipsis,
                                                maxLines: 2,
                                                state
                                                    .products[index]
                                                    .description,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 11,
                                                  color: Colors.grey
                                                ),
                                              ),

                                              SizedBox(height: 25),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      "${state.products[index].price}",
                                                      style: TextStyle(
                                                        color: Color(
                                                          0xFF80B9AD,
                                                        ),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),

                                                  ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                              Radius.circular(
                                                                12,
                                                              ),
                                                            ),
                                                      ),
                                                      backgroundColor: Color(
                                                        0xFF80B9AD,
                                                      ),
                                                    ),
                                                    onPressed: () {},
                                                    child: Text(
                                                      "Add",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10,
                                                        fontWeight: .bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                  : SizedBox(),
            ),
          );
        },
      ),
    );
  }
}
