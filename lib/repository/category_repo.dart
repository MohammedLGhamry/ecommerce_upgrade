import 'package:dio/dio.dart';
import 'package:ecommerce/models/category_model.dart';

class CategoryRepo {

  final Dio dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
      )
  );

  Future<List<CategoryItemModel>> fetchCategories() async {
    final response =
    await dio.get('categories');

    final categoryModel = CategoryModel.fromJson(response.data);
    final category = categoryModel.data.categoryData;
    return category;

    /*if (response.statusCode == 200) {
      final jsonData = response.data;
      final categoriesData = jsonData['data']['data'] as List;
      return categoriesData
          .map((categoryJson) => CategoryModel.fromJson(categoryJson))
          .toList();
    } else {
      throw Exception('Failed to load categories');
    }*/
  }
}