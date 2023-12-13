import 'package:dio/dio.dart';
import 'package:game/model/products.dart';
import 'package:game/service/base_product.dart';

abstract class QuestionService extends BaseService {
  Future<List<Products>> getAllProduct();
}

class QuestionServiceImp extends QuestionService {
  @override
  Future<List<Products>> getAllProduct() async {
    Response response = await dio.get(baseUrl);
    // print(response.data);
    if (response.statusCode == 200) {
      dynamic temp = response.data;
      List<Products> questions =
          List.generate(temp.length, (index) => Products.fromMap(temp[index]));
      print(questions);
      return questions;
    } else {
      return [];
    }
  }
}
