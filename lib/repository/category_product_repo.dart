import 'package:dio/dio.dart';
import 'package:ecommerce/models/category_product_model.dart';

class CategoryProductRepo {
  final Dio dio = Dio(BaseOptions(
    baseUrl: 'https://student.valuxapps.com/api/',
  ));

  Future<List<CategoryProductItemModel>> fetchCategoryProducts(int id) async {
    final response = await dio.get('products?category_id=$id');

    final productModel = CategoryProductModel.fromJson(response.data);
    final product = productModel.data.categoryProductData;
    return product;
  }
}
