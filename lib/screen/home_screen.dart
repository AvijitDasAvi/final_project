
import 'package:final_project/models/product_model.dart';
import 'package:final_project/services/api_helper.dart';
import 'package:final_project/widgets/product_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<ProductModel>> _productFuture;

  @override
  void initState() {
    _productFuture = ApiHelper.getProduct(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 20.0,
        shadowColor: Color.fromARGB(255, 102, 101, 101),
        backgroundColor: Colors.redAccent,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
          topRight: Radius.circular(40.0),
          bottomRight: Radius.circular(40.0)
        )),

        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('User: Avijit Das'), 
              accountEmail: Text('Gmail: avijitavi338895@gmail.com',style: TextStyle(color: Colors.black),),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/man_user.png'),
              ),
              decoration: BoxDecoration(
                color: Colors.teal
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: (){
                HomeScreen();
              },
            ),
            ListTile(
              leading: Icon(Icons.games),
              title: Text('Product'),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: (){},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Center(
          child: Text(
            'Online Shop',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0
            ),
          ),
        ),
        actions: [
          SizedBox(width: 8,),
          IconButton(
              icon: Icon(Icons.shopping_bag_outlined),
              onPressed: () {
              },
            ),
            SizedBox(width: 8,),
          IconButton(
              icon: Icon(Icons.message_outlined),
              onPressed: () {
              },
            ),
        ],
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: _productFuture, 
        builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data == null) {
            return Center(
              child: Text('No data'),
            );
          }
          if (snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                'Data empty'
              ),
            );
          }
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.9,
                crossAxisSpacing: 10,
                mainAxisSpacing: 0,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (context,index){
              final product = snapshot.data![index];
              return ProductCard(
                product: product,
              );
            }, 
          );
        }
      ),
    );
  }
}