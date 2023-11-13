import 'package:ecommerce/cubits/indicator_dots/indicator_dots_cubit.dart';
import 'package:ecommerce/models/category_model.dart';
import 'package:ecommerce/models/offer_banner_model.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/repository/category_repo.dart';
import 'package:ecommerce/repository/offer_banner_repo.dart';
import 'package:ecommerce/repository/category_product_repo.dart';
import 'package:ecommerce/screens/category_product_screen.dart';
import 'package:ecommerce/screens/favorite_product%20_screen.dart';
import 'package:ecommerce/screens/notification_screen.dart';
import 'package:ecommerce/screens/super_flash_sale_screen.dart';
import 'package:ecommerce/themes/colors.dart';
import 'package:ecommerce/themes/flutter_font_icons.dart';
import 'package:ecommerce/widgets/product_item_widget.dart';
import 'package:ecommerce/widgets/flash_sale_image_widget.dart';
import 'package:ecommerce/widgets/grid_product_item_widget.dart';
import 'package:ecommerce/widgets/test_product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:badges/badges.dart' as badges;
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Dio dio = Dio();

  Future<List<ProductModel>> fetchFlashSaleProducts() async {
    final response = await dio
        .get('https://student.valuxapps.com/api/products?category_id=44');
    if (response.statusCode == 200) {
      final jsonData = response.data;
      final productsData = jsonData['data']['data'] as List;
      return productsData
          .map((productJson) => ProductModel.fromJson(productJson))
          .toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  late Future<List<BannerItemModel>> bannersData;
  late Future<List<CategoryItemModel>> categoriesData;
  late Future<List<ProductModel>> flashSaleData;

  List<ProductModel> listOfProducts = [
    ProductModel(
      image: 'assets/images/product01.png',
      name: 'FS - Nike Air Max 270 React Sneakers',
      price: 299.43,
      oldPrice: 534.33,
      discount: 24,
      listOfColors: [
        Colors.yellow,
        Colors.pink,
        Colors.blue,
        Colors.black,
        Colors.purpleAccent,
        Colors.lightGreen
      ],
      listOfSizes: ['5', '6', '7', '8', '9', '10', '11'],
    ),
    ProductModel(
      image: 'assets/images/product02.png',
      name: 'FS - QUILTED MAXI 300 CROSS PLUS BAG',
      price: 20.43,
      oldPrice: 30.33,
      discount: 33,
      listOfColors: [Colors.green, Colors.pink, Colors.blue, Colors.black],
      listOfSizes: ['S', 'M', 'L', 'XL', 'XXL'],
    ),
    ProductModel(
      image: 'assets/images/product01.png',
      name: 'FS - Nike Air Max 270 React Sneakers',
      price: 299.4,
      oldPrice: 534.33,
      discount: 24,
      listOfColors: [Colors.yellow, Colors.pink, Colors.blue, Colors.black],
      listOfSizes: ['5', '6', '7', '8'],
    ),
    ProductModel(
      image: 'assets/images/product02.png',
      name: 'FS - QUILTED MAXI 300 CROSS PLUS BAG',
      price: 399.43,
      oldPrice: 599.33,
      discount: 33,
      listOfColors: [Colors.white, Colors.green, Colors.blue, Colors.black],
      listOfSizes: ['M', 'L', 'XL', 'XXL'],
    ),
  ];


  @override
  void initState() {
    super.initState();
    bannersData = OfferBannerRepo().fetchOfferBanner();
    categoriesData = CategoryRepo().fetchCategories();
    flashSaleData = fetchFlashSaleProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IndicatorDotsCubit(),
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Center(
              child: Column(
                children: [
                  /// search bar & icons
                  Container(
                    margin: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            style: TextStyle(
                              fontSize: 12,
                              height: 1.8,
                              fontWeight: FontWeight.w500,
                              color: AppColors.grey,
                              letterSpacing: .5,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Search Product',
                              hintStyle: TextStyle(
                                fontSize: 12,
                                height: 1.8,
                                fontWeight: FontWeight.w400,
                                color: AppColors.grey,
                                letterSpacing: .5,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(
                                      width: 1, color: AppColors.lightGrey)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.primaryColor)),
                              prefixIcon: Icon(
                                Icons.search,
                                color: AppColors.primaryColor,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => FavoriteProductScreen(
                                      listOfFavoriteProducts: listOfProducts,
                                    )));
                          },
                          icon: Icon(
                            Icons.favorite_border_outlined,
                            color: AppColors.grey,
                          ),
                        ),
                        badges.Badge(
                          position:
                              badges.BadgePosition.topEnd(top: 12, end: 12),
                          badgeStyle: badges.BadgeStyle(
                            shape: badges.BadgeShape.circle,
                            badgeColor: AppColors.lightRed,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => NotificationScreen()));
                            },
                            icon: Icon(
                              FlutterFontIcons.notification,
                              color: AppColors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// divider
                  Container(
                    child: Divider(
                      thickness: 1,
                      color: AppColors.lightGrey,
                    ),
                  ),

                  /// slider
                  FutureBuilder<List<BannerItemModel>>(
                    future: bannersData,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        final banners = snapshot.data!;
                        // bannersLength = banners.length;
                        return offersBannerSliderWidget(context, banners);
                      }
                    },
                  ),

                  /// rest of home
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Column(
                          children: [
                            /// category & more
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Category',
                                  style: TextStyle(
                                    fontSize: 14,
                                    height: 1.5,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primaryDarkColor,
                                    letterSpacing: .5,
                                  ),
                                ),
                                Text(
                                  'More Category',
                                  style: TextStyle(
                                    fontSize: 14,
                                    height: 1.5,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primaryColor,
                                    letterSpacing: .5,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),

                            /// category list
                            FutureBuilder<List<CategoryItemModel>>(
                              future: CategoryRepo().fetchCategories(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                if (snapshot.hasData) {
                                  final categories = snapshot.data!;
                                  return categoryListWidget(categories);
                                }

                                return const SizedBox();
                              },
                            ),

                            const SizedBox(
                              height: 24,
                            ),

                            /// flash sale & more
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Flash Sale',
                                  style: TextStyle(
                                    fontSize: 14,
                                    height: 1.5,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primaryDarkColor,
                                    letterSpacing: .5,
                                  ),
                                ),
                                Text(
                                  'See More',
                                  style: TextStyle(
                                    fontSize: 14,
                                    height: 1.5,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primaryColor,
                                    letterSpacing: .5,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),

                            /// flash sale list

                            FutureBuilder<List<ProductModel>>(
                              future: flashSaleData,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (snapshot.hasError) {
                                  return Center(
                                    child: Text("Error: ${snapshot.error}"),
                                  );
                                } else {
                                  final products = snapshot.data!;
                                  return Container(
                                    height: 255,
                                    child: ListView.builder(
                                      itemCount: products.length,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        final product = products[index];
                                        return APIProductItemWidget(
                                            productModel: product);
                                      },
                                    ),
                                  );
                                }
                              },
                            ),

                            const SizedBox(
                              height: 24,
                            ),

                            /// mega sale & more
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Mega Sale',
                                  style: TextStyle(
                                    fontSize: 14,
                                    height: 1.5,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primaryDarkColor,
                                    letterSpacing: .5,
                                  ),
                                ),
                                Text(
                                  'See More',
                                  style: TextStyle(
                                    fontSize: 14,
                                    height: 1.5,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primaryColor,
                                    letterSpacing: .5,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),

                            /// mega sale list
                            FutureBuilder<List<ProductModel>>(
                              future: flashSaleData,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (snapshot.hasError) {
                                  return Center(
                                    child: Text("Error: ${snapshot.error}"),
                                  );
                                } else {
                                  final products = snapshot.data!;
                                  return Container(
                                    height: 255,
                                    child: ListView.builder(
                                      itemCount: products.length,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        final product = products[index];
                                        return APIProductItemWidget(
                                            productModel: product);
                                      },
                                    ),
                                  );
                                }
                              },
                            ),

                            const SizedBox(
                              height: 10,
                            ),

                            /// banner
                            recommendedBanner(),
                            const SizedBox(
                              height: 16,
                            ),

                            /// recommended products gridview
                            recommendedGridViewWidget(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget recommendedGridViewWidget() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 165 / 300,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      physics: NeverScrollableScrollPhysics(),
      itemCount: listOfProducts.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GridProductItemWidget(productModel: listOfProducts[index]);
      },
    );
  }

  Widget categoryListWidget(List list) {
    return Container(
      height: 108,
      child: ListView.builder(
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CategoryProductScreen(
                        name: list[index].name,
                        id: list[index].id,
                      )));
            },
            child: Container(
              height: 108,
              width: 70,
              margin: EdgeInsets.only(right: 12),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 31,
                    backgroundColor: AppColors.lightGrey,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Image.network(
                        list[index].image,
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '${list[index].name}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10,
                      height: 1.5,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey,
                      letterSpacing: .5,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget offersBannerSliderWidget(BuildContext context, List list) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            child: CarouselSlider.builder(
              itemCount: list.length,
              options: CarouselOptions(
                viewportFraction: 1,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  context.read<IndicatorDotsCubit>().ChangeIndicatorStatus(index,list);
                },
              ),
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SuperFlashSaleScreen(
                                      bannerItemModel: list[itemIndex],
                                    )));
                          },
                          child: FlashSaleImageWidget(
                            bannerData: list[itemIndex],
                          )),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          buildIndicatorDots(),
        ],
      ),
    );
  }

  Widget buildIndicatorDots() {
    return BlocBuilder<IndicatorDotsCubit, IndicatorDotsState>(
      builder: (context, state) {

        if (state is IndicatorDotsInitial) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: state.indicatorStatus.asMap().entries.map((entry) {
              final bool isSelected = entry.value;

              return Container(
                width: 10,
                height: 10,
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected
                      ? AppColors.primaryColor
                      : AppColors.lightGrey, // Set dot color based on selection.
                ),
              );
            }).toList(),
          );
        }

        if (state is IndicatorChangedSuccessfully) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: state.indicatorStatus.asMap().entries.map((entry) {
              final bool isSelected = entry.value;

              return Container(
                width: 10,
                height: 10,
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected
                      ? AppColors.primaryColor
                      : AppColors.lightGrey, // Set dot color based on selection.
                ),
              );
            }).toList(),
          );
        }

       return const Text('error');
      },
    );
  }

  Widget recommendedBanner() {
    return Container(
      height: 206,
      width: MediaQuery.of(context).size.width,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
            image: AssetImage('assets/images/reconmended_image.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 48,
            ),
            Container(
              margin: const EdgeInsets.only(left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recommended',
                    style: TextStyle(
                      fontSize: 24,
                      height: 1.5,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: .5,
                    ),
                  ),
                  Text(
                    'Product',
                    style: TextStyle(
                      fontSize: 24,
                      height: 1.5,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: .5,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'We recommend the best for you',
                    style: TextStyle(
                      fontSize: 12,
                      height: 1.8,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      letterSpacing: .5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
