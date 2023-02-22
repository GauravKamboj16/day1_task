import 'package:badges/badges.dart';
import 'package:day1_task/modules/controller/ProductsController.dart';
import 'package:day1_task/services/NetworkUtil.dart';
import 'package:flutter/material.dart';
 
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import 'ProductsCart.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final productController =
        Provider.of<ProductController>(context, listen: false);
    productController.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Cosmetics'),
          centerTitle: true,
          actions: [
            Consumer<ProductController>(
              builder: (context, value, child) {
                return InkWell(
                   onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return CartScreen();
                    }));
                  },
                  child: Center(
                    child: Badge(
                    badgeContent: Text(value.favList.length.toString()),
                    child: Icon(Icons.shopping_cart),
                 
                     ),
                  ),
                );
              },
             
            ),
            SizedBox(width: 10,)
          ],
        ),
        body: Column(
          children: [
            Consumer<ProductController>(
              builder: (BuildContext context, value, Widget? child) {
                return value.isLoading == true
                    ? Center(child: CircularProgressIndicator())
                    : Expanded(
                        child: GridView.builder(
                            itemCount: value.productList.length,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    childAspectRatio: 3 / 5,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                            itemBuilder: (context, index) {
                              return Card(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Stack(children: [
                                        FadeInImage(
                                          placeholder: NetworkImage(
                                              'https://th.bing.com/th/id/OIP.knDD5nFJTOXO5pi-FHhMkgAAAA?pid=ImgDet&w=183&h=137&c=7&dpr=1.3'),
                                          image: NetworkImage(value.productList
                                              .elementAt(index)
                                              .image),
                                          placeholderErrorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.network(
                                                'https://th.bing.com/th/id/OIP.knDD5nFJTOXO5pi-FHhMkgAAAA?pid=ImgDet&w=183&h=137&c=7&dpr=1.3');
                                          },
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: IconButton(
                                              onPressed: () {
                                                value.addToCart(value.productList.elementAt(index));
                                              },
                                              icon: value.favList.contains(value.productList.elementAt(index))? Icon(
                                               Icons.shopping_cart_checkout) :
                                                Icon(Icons.shopping_cart_sharp),
                                                color: Colors.red,
                                              )),
                                    
                                      ]),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        value.productList.elementAt(index).name,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ]),
                              );
                            }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
