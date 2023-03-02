import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_tutorial/model/product.dart';

class ProductDetails extends StatelessWidget {
  final Product product;
  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
             FadeInImage(placeholder: const AssetImage("assets/images/placeholder.jpg"),
              image: NetworkImage(product.image.toString()),
              imageErrorBuilder: (context, error, stackTrace) {
                return Image.asset("assets/images/placeholder.jpg");
              },),
              Text(product.name,style: GoogleFonts.lato(color:Colors.black,fontSize: 20),),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text(product.price,style: GoogleFonts.poppins(color: Colors.blue,fontWeight: FontWeight.w600,fontSize: 24),),
                  Spacer(),
                  IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart)),
                  SizedBox(width: 10,),
      
                ],
              ),SizedBox(height: 10,),
              
      
            ],
          ),
        ),
      ),
    );
  }
}