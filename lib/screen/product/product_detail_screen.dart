import 'package:final_project/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackButton(),
                      IconButton(
                        onPressed: (){}, 
                        icon: Icon(Icons.favorite_border_outlined)),
                      IconButton(
                        onPressed: (){}, 
                        icon: Icon(Icons.shopping_bag_outlined)),
              ],
            ),
            Expanded(child: Image.network("${product.image}")),
            Container(
              padding: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                color: Color.fromARGB(255, 255, 222, 219)
              ),
              child: Column(
                children: [
                  Text(
                    "\Title: "
                    "${product.title}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                    ),
                  Text(
                    "\Price: \$${product.price}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                    ),
                    ),
                  Text(
                    "${product.description}",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic,
                      fontSize: 15
                    ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
                  ),
                    onPressed: (){},
                    child: Text(
                      'Order',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ),
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}