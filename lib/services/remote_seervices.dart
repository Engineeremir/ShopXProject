import 'package:http/http.dart' as http;
import 'package:models/models/product.dart';

class RemoteService {
  static var client = http.Client();

  static Future<List<Product>?> fetchProducts() async {
    var response = await client.get(Uri.parse("http://makeup-api.herokuapp.com/api/v1/products.json"));

    if (response.statusCode == 200) {
      var jsonString = response.body;

      return productFromJson(jsonString);

    } else {
      //show error message
      return null;
    }
  }
}