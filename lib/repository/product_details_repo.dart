import 'package:dio/dio.dart';
import 'package:ecommerce/models/product_details_model.dart';

class ProductDetailsRepo {
  final Dio dio = Dio(BaseOptions(
    baseUrl: 'https://student.valuxapps.com/api/',
  ));

  Future<ProductItemModel> fetchProductsDetails(int id) async {
    final response = await dio.get('products/$id');

    final productModel = ProductDetailsModel.fromJson(response.data);
    final product = productModel.data;
    return product;
  }
}