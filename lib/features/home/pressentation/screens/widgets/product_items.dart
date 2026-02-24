import 'package:flutter/material.dart';

class ProductItems extends StatelessWidget {
  final String text;

  final String text1;

  final String text2;

  final String price;

  final String image;

  ProductItems({
    required this.image,
    required this.text,
    required this.text1,
    required this.text2,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.vertical(
                  top: Radius.circular(20),
                ),
                child: Image.asset(
                  image,
                  height: 200,
                  width: double.infinity,
                  fit: .cover,
                ),
              ),
            ],
          ),
          Positioned(
            top: 12,
            right: 12,
            child: IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  text,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  text1,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 8),
                Text(text2, style: TextStyle(color: Colors.grey, fontSize: 14)),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                        color: Color(0xFF80B9AD),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(12),
                        ),
                        backgroundColor: Color(0xFF80B9AD),
                      ),
                      onPressed: () {},
                      child: const Text(
                         "Add to card",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
