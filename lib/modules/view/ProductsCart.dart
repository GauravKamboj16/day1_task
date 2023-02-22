import 'package:day1_task/Constants/AppColors.dart';
import 'package:day1_task/modules/controller/ProductsController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  
  @override
  Widget build(BuildContext context) {
    final controller1=Provider.of<ProductController>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("My Cart"),
      ),

      body: SafeArea(
        child:Column(
          children: [
            Expanded( 
            child: Consumer<ProductController>(
              builder: (context, controller, child) {
             return  controller.favList.length==0?
             Center(
              child: Image.asset("assets/images/vector.png"),
             )
             :ListView.separated(
                 itemCount: controller.favList.length,
                 itemBuilder: (context,index){
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(controller.favList.elementAt(index).image,height: 90,width: 90,),
                        SizedBox(width: 6,),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(controller.favList.elementAt(index).name,
                              style: GoogleFonts.poppins(color: Colors.black87,textStyle:   TextStyle( )),),
                              Text(controller.favList.elementAt(index).price,
                              style: GoogleFonts.poppins(color: Colors.black87,textStyle:   TextStyle(fontSize: 21,fontWeight: FontWeight.w600, overflow: TextOverflow.ellipsis)),),

                            ],
                          ),
                        ) ,IconButton(onPressed: (){
                          controller.remove(controller.favList.elementAt(index));
                        }, icon: Icon(Icons.delete,color: Colors.red,size: 25,))

                      ],
                    )
                    
                    // ListTile(
                    //   leading: Image.network(controller.favList.elementAt(index).image),
                    //   title: Text(controller.favList.elementAt(index).name),
                    // ),
                  );
                 },
                  separatorBuilder: (context,index){
                    return SizedBox(height: 8,);
                  },
                 );
                    
              },
  
            ),),
          ],
        ) ),

        bottomNavigationBar: Container(
          padding: EdgeInsets.all(8),
          color: AppColors.mesageBack,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Your total amount",style: TextStyle(color: Colors.white70),),
                  SizedBox(height: 4,),
                  Text("44.77",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),)
                ],
              ),
              Spacer(),
              Container(
                color: Colors.green,
                padding: EdgeInsets.all(10),
                child: Text("Check Out",style: TextStyle(color: Colors.white),),
              )
            ],
          ),
        ),

    );
  }
}