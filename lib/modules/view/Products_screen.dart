import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive_tutorial/constant/app_colors.dart';
import 'package:hive_tutorial/widgets/product_item.dart';
import 'package:page_transition/page_transition.dart';
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
                    Navigator.push(
                  context,
                  PageTransition(
                      alignment: Alignment.bottomRight,
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 600),
                      reverseDuration: const Duration(milliseconds: 600),
                      type: PageTransitionType.topToBottomJoined,
                      child: const CartScreen(),
                      childCurrent: widget),
                );
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<ProductController>(
              builder: (BuildContext context, value, Widget? child) {
                return value.isLoading == true
                    ? 
                    
                    const Center(child: SpinKitCubeGrid(
                  color: Colors.red,
                  size: 50.0,
                ))
                    : Expanded(
                        child: GridView.builder(
                            itemCount: value.productList.length,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    childAspectRatio: 3 / 5,
                                    crossAxisSpacing: 5,
                                    mainAxisSpacing:5),
                            itemBuilder: (context, index) {
                              return ProductItem(product: value.productList.elementAt(index), controller: value);
                            }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
