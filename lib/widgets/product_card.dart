import 'package:final_project/models/product_model.dart';
import 'package:final_project/screen/product/product_detail_screen.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailScreen(product: product,)));
                  },
                  child: Card(
                    elevation: 15,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                                product.image.toString(),
                                height: 100,
                                width: 100,
                            ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("${product.title}",
                            maxLines: 2,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("\$${product.price}"),
                            IconButton(onPressed: (){
                                  
                            }, 
                            icon: Icon(Icons.favorite_border))
                          ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
  }
}