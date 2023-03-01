 /*
Developer- Gaurav Kamboj
  Provider class for fetching products from Api 
  Managing cart products list (_favList) 
  Adding & removing products from cart
  Updating TotalPrice in (price) variable

  function addToCart() simply add product in _favList later working as cart list
  _favList manages cart products
*/
import 'package:flutter/cupertino.dart';
import 'package:hive_tutorial/services/network_util.dart';
import '../../model/product.dart';

class ProductController with ChangeNotifier {
  bool isLoading = true;
  double price=0.00;
  List<Product> productList = [];
  final networkUtil = NetworkUtil();
  List<Product> _favList = [];
  List<Product> get favList=>_favList;

  void getProducts() async {
    
    var res = await networkUtil.getData();
    

    if (res != null) {
      
       
      print("Ok");
      var prod=res[0]["name"];
      print(prod);
      for(var item in res){
        Product product=Product(
          id: item["id"],
         image: item["image_link"],
          name: item["name"],
           price: item["price"]);
           productList.add(product);
           print(product);
      }

       isLoading=false;

       notifyListeners();
    } else {
      print("Data is null");
    }
    notifyListeners();
  }



  void addToCart(Product product)async{
    if(_favList.contains(product)){
      _favList.remove(product);
      updatePrice(favList);
    }else{
     _favList.add(product);
     updatePrice(favList);
    }
   
    notifyListeners();

    
  }
  void remove(Product item)async{
  favList.remove(item);
     await  updatePrice(favList);
  notifyListeners();
}

updatePrice(List<Product> list){
  double pp=0;
  for(var item in list){
      pp =pp+double.parse(item.price);
    
  } 
  price=pp; 
  notifyListeners();
}
  
}
