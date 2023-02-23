import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:hive_tutorial/constant/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import '../controller/products_controller.dart';
import 'products_cart.dart';

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
          backgroundColor: AppColors.redColor,
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
                      badgeStyle: BadgeStyle(badgeColor: Colors.green),
                    badgeContent: Text(value.favList.length.toString()),
                    child: Icon(Icons.shopping_cart),
                 
                     ),
                  ),
                );
              },
             
            ),
            SizedBox(width: 20,)
          ],
        ),
        body: Column(
          children: [
            Consumer<ProductController>(
              builder: (BuildContext context, value, Widget? child) {
                return value.isLoading == true
                    ? const Center(child: CircularProgressIndicator(color: AppColors.redColor,))
                    : Expanded(
                        child: GridView.builder(
                            itemCount: value.productList.length,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    childAspectRatio: 3 / 5,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10),
                            itemBuilder: (context, index) {
                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                          value.productList.elementAt(index).price,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          value.productList.elementAt(index).name,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ]),
                                ),
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
