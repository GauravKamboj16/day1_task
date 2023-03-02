import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive_tutorial/constant/app_colors.dart';
import 'package:hive_tutorial/model/product.dart';
import 'package:hive_tutorial/modules/controller/products_controller.dart';
import 'package:hive_tutorial/modules/view/MusicAnimation.dart';
import 'package:hive_tutorial/modules/view/product_details.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final ProductController controller;
  const ProductItem({super.key, required this.product, required this.controller});

  @override
  Widget build(BuildContext context) {
    Product item=this.product;
    return OpenContainer(
      closedBuilder: (context, action) {
        return  Card(
      color: AppColors.whiteColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                FadeInImage(
                  placeholder: const NetworkImage(
                      'https://th.bing.com/th/id/OIP.knDD5nFJTOXO5pi-FHhMkgAAAA?pid=ImgDet&w=183&h=137&c=7&dpr=1.3'),
                  image: NetworkImage(item.image),
                  placeholderErrorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/images/product_item.dart');
                    //  Image.network(
                    //     'https://th.bing.com/th/id/OIP.knDD5nFJTOXO5pi-FHhMkgAAAA?pid=ImgDet&w=183&h=137&c=7&dpr=1.3');
                  },
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        this.controller.addToCart(product);
                      },
                      icon: this.controller.favList
                              .contains(item)
                          ? Icon(Icons.shopping_cart_checkout)
                          : Icon(Icons.shopping_cart_sharp),
                      color: Colors.red,
                    )),
              ]),
              const SizedBox(
                height: 4,
              ),
              Text(
                item.price,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                item.name,
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    fontWeight: FontWeight.w400),
              )
            ]),
      ),
    );
      },
     openBuilder:(context, action) {
       return ProductDetails(product: item,);
     },)
    ;
  }
}
