import 'dart:convert';
import 'package:flutter/cupertino.dart';
import '../../Model/Product.dart';
import '../../services/NetworkUtil.dart';
 
class ProductController with ChangeNotifier {
  bool isLoading = true;
  List<Product> productList = [];
  final networkUtil = NetworkUtil();
    
  List<Product> _favList = [];
  List<Product> get favList=>_favList;  

  void getProducts() async {
    
    var res = await networkUtil.networkGet();

    if (res != null) {
      //print("______________-------------------_________${res.body}");
      var result = jsonDecode(res.body);
      //print(result.toString());

      print(result[0]["brand"]);
      for (var item in result) {
        Product product =
        Product(id: item["id"], image: item["image_link"], name: item["name"],price:item["price"] );

        productList.add(product);
        print(item["image_link"]);
        isLoading = false;
      }
    } else {
      print("Data is null");
    }
    notifyListeners();
  }

  void addToCart(Product product)async{
    if(_favList.contains(product)){
      _favList.remove(product);
    }else{
     _favList.add(product);
    }
   
    notifyListeners();

    
  }
  void remove(Product item){
  favList.remove(item);
  notifyListeners();
}

updatePrice(){ 
}
  
}
