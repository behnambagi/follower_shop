import 'package:shared_preferences/shared_preferences.dart';

class Cart {
  static Future<bool> addProduct(
      String title, String idProduct, int price, String imgUrl) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('id');
    if (id != null) {
      if (id.indexOf(idProduct) >= 0) {
        await changeNumberProductAdd(idProduct);
      } else {
        print("ezafe.shod ba id jadid");
        String date = id + idProduct + "_";
        prefs.setString('id', date);
        dateProduct(title, idProduct, price, imgUrl);
      }
    } else {
      print("por shod .vared if aval nashod");
      String date = idProduct + "_";
      prefs.setString('id', date);
      dateProduct(title, idProduct, price, imgUrl);
    }
    return true;
  }

  static dateProduct(
      String title, String idProduct, int price, String imgUrl) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('title_' + idProduct, title);
    prefs.setString('imgUrl_' + idProduct, imgUrl);
    prefs.setInt('price_' + idProduct, price);
    prefs.setInt('number_' + idProduct, 1);
  }

  static Future<bool> changeNumberProductAdd(String idProduct) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? n = prefs.getInt('number_' + idProduct);
    n = n! + 1;
    prefs.setInt('number_' + idProduct, n);
    return true;
  }
  static Future<bool> changeNumberProductRemove(String idProduct) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? n = prefs.getInt('number_' + idProduct);
    if(n!>1){
      n = n - 1;
      prefs.setInt('number_' + idProduct, n);
    }else{
      removeOneProduct(idProduct);

    }

    return true;
  }

  static Future<bool> removeOneProduct(String idProduct) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? idProducts = prefs.getString('id');
    idProducts = idProducts!.replaceAll(idProduct + '_', '');
    if (idProducts.isEmpty) {
      prefs.remove('id');
    } else {
      prefs.setString('id', idProducts);
    }
    prefs.remove('title_' + idProduct);
    prefs.remove('price_' + idProduct);
    prefs.remove('imgUrl_' + idProduct);
    prefs.remove('number_' + idProduct);

    return true;
  }

  static Future<bool> removeAllProduct() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? idProducts = prefs.getString('id');
    List<String> idP = idProducts!.split('-');
    for (int i = 0; i < (idP.length - 1); i++) {
      prefs.remove('title_' + idP[i]);
      prefs.remove('price_' + idP[i]);
      prefs.remove('imgUrl_' + idP[i]);
      prefs.remove('number_' + idP[i]);
    }
    prefs.remove('id');
    return true;
  }

  static Future<String?> getProductCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? productCart = prefs.getString('id');
    return productCart;
  }

  static Future<Map<String, dynamic>?> getCartData(String idProduct) async {
    Map<String, dynamic> dataCart =  Map();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? title = prefs.getString('title_' + idProduct);
    int? price = prefs.getInt('price_' + idProduct);
    String? imgUrl = prefs.getString('imgUrl_' + idProduct);
    int? number = prefs.getInt('number_' + idProduct);
    dataCart['title'] = title;
    dataCart['price'] = price;
    dataCart['imgUrl'] = imgUrl;
    dataCart['number'] = number;
    dataCart['idProduct'] = idProduct;

    return dataCart;
  }
}
