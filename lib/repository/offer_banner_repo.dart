import 'package:dio/dio.dart';
import 'package:ecommerce/models/offer_banner_model.dart';

class OfferBannerRepo {

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
    )
  );

  Future<List<BannerItemModel>> fetchOfferBanner() async {
    final response =
    await dio.get('banners');

    final bannerModel = OfferBannerModel.fromJson(response.data);
    final bannerData = bannerModel.data;
    return bannerData;

    /*if (response.statusCode == 200) {
      final jsonData = response.data;
      final bannerData = jsonData['data'] as List;
      return bannerData
          .map((bannerJson) => OfferBannerModel.fromJson(bannerJson))
          .toList();
    } else {
      throw Exception('Failed to load categories');
    }*/
  }
}