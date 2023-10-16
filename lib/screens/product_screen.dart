import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/models/review_model.dart';
import 'package:ecommerce/repository/category_product_repo.dart';
import 'package:ecommerce/repository/product_details_repo.dart';
import 'package:ecommerce/themes/colors.dart';
import 'package:ecommerce/widgets/product_item_widget.dart';
import 'package:ecommerce/widgets/review_widget.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  final int id;
  final String name;
  ProductScreen({super.key, required this.id, required this.name});


  List<ProductModel> listOfSuggestedProducts = [
    ProductModel(
      image: 'assets/images/product01.png',
      name: 'FS - Nike Air Max 270 React...',
      price: 299.2,
      oldPrice: 534.2,
      discount: 24,
    ),
    ProductModel(
      image: 'assets/images/product02.png',
      name: 'FS - QUILTED MAXI 300 CROS...',
      price: 399.43,
      oldPrice: 599.33,
      discount: 33,
    ),
    ProductModel(
      image: 'assets/images/product01.png',
      name: 'FS - Nike Air Max 270 React...',
      price: 299.3,
      oldPrice: 534.33,
      discount: 24,
    ),
    ProductModel(
      image: 'assets/images/product02.png',
      name: 'FS - QUILTED MAXI 300 CROS...',
      price: 399.43,
      oldPrice: 599.33,
      discount: 33,
    ),
  ];
  List<ReviewModel> listOfReviews = [
    ReviewModel(
      profilePicture: 'assets/images/profile_picture.png',
      username: 'Mohamed Ahmed',
      reviewDescription: 'air max are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit, not sure if the box was always this small but the 90s are and will always be one of my favorites.',
      date: 'July 3, 2021',
      ratingStars: 4,
      listOfImages: ['assets/images/product01.png','assets/images/product02.png']
    ),
    ReviewModel(
      profilePicture: 'assets/images/profile_picture.png',
      username: 'Jason Mason',
      reviewDescription: 'air max are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit.',
      date: 'December 10, 2023',
      ratingStars: 4,
      listOfImages: ['assets/images/promotion_image.png']
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(

      appBar: PreferredSize(
        preferredSize: const Size(0, 78),
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 8, right: 15),
          child: AppBar(
            title: Text(name),
            titleSpacing: 0,
            titleTextStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryDarkColor,
              letterSpacing: 0.5,
              height: 1.5,
              fontFamily: 'poppins',
            ),
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.grey,
              ),
            ),
            actions: [
              // TODO search tap
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              /// title & icons
             /* Container(
                margin: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.grey,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    SizedBox(
                      width: 195,
                      child: Text(
                        productModel.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryDarkColor,
                          letterSpacing: 0.5,
                          height: 1.5,
                          overflow: TextOverflow.ellipsis,
                          fontFamily: 'poppins',
                        ),
                      ),
                    ),

                    const SizedBox(
                      width: 25,
                    ),
                    // TODO search tap
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: AppColors.grey,
                      ),
                    ),

                    // TODO more tap
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.more_vert,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),*/


              FutureBuilder(
                future: ProductDetailsRepo().fetchProductsDetails(id),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasData) {
                    final list = snapshot.data!;
                    print(list);
                    return Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            /// product image
                            SizedBox(
                              height: 240,
                              width: width,
                              child: Image.network(
                                list.image,
                                fit: BoxFit.cover,
                              ),
                            ),

                            // TODO dots indictors

                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// product title & favorite icon
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: width * 0.7,
                                        child: Text(
                                          list.name,
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.primaryDarkColor,
                                            height: 1.5,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.favorite_border_outlined,
                                          color: AppColors.grey,
                                          size: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),

                                  /// TODO rating
                                  Image.asset(
                                    'assets/images/stars.png',
                                    width: 96,
                                    height: 18,
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),

                                  /// price
                                  Text(
                                    '\$${list.price}',
                                    style: TextStyle(
                                      fontSize: 20,
                                      height: 1.5,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.primaryColor,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),

                                  /// size section
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Select Size',
                                        style: TextStyle(
                                          fontSize: 14,
                                          height: 1.5,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.primaryDarkColor,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      SizedBox(
                                        height: 48,
                                        child: ListView.builder(
                                          itemCount: 5,
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              padding: const EdgeInsets.only(right: 16),
                                              child: CircleAvatar(
                                                radius: 25,
                                                backgroundColor: AppColors.lightGrey,
                                                child: CircleAvatar(
                                                  radius: 23,
                                                  backgroundColor: Colors.white,
                                                  child: Text(
                                                    '5',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: AppColors.primaryDarkColor,
                                                      fontWeight: FontWeight.w700,
                                                      height: 1.5,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),

                                  /// color section
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Color Size',
                                        style: TextStyle(
                                          fontSize: 14,
                                          height: 1.5,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.primaryDarkColor,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      SizedBox(
                                        height: 48,
                                        child: ListView.builder(
                                          itemCount:5,
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              padding: const EdgeInsets.only(right: 16),
                                              child: CircleAvatar(
                                                radius: 25,
                                                backgroundColor: AppColors.primaryColor,
                                                child: CircleAvatar(
                                                  radius: 0,
                                                  backgroundColor: Colors.white,
                                                  child: Text(
                                                    '',
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),

                                  /// Specification section
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Specification',
                                        style: TextStyle(
                                          fontSize: 14,
                                          height: 1.5,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.primaryDarkColor,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Shown:',
                                            style: TextStyle(
                                              fontSize: 12,
                                              height: 1.8,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.primaryDarkColor,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 127,
                                          ),
                                          Expanded(
                                            child: Text(
                                              'Laser Blue/Anthracite/Whit/Watermelon',
                                              maxLines: 5,
                                              style: TextStyle(
                                                fontSize: 12,
                                                height: 1.8,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.grey,
                                                letterSpacing: 0.5,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Style:',
                                            style: TextStyle(
                                              fontSize: 12,
                                              height: 1.8,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.primaryDarkColor,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          Text(
                                            'CD0113-400',
                                            maxLines: 2,
                                            style: TextStyle(
                                              fontSize: 12,
                                              height: 1.8,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.grey,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  /// description section
                                  const SizedBox(
                                    height: 16,
                                  ),

                                  Text(
                                    'The Nike Air Max 270 React ENG combines a full-length React foam midsole with a 270 Max Air unit for unrivaled comfort and a striking visual experience.',
                                    style: TextStyle(
                                      fontSize: 12,
                                      height: 1.8,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.grey,
                                      letterSpacing: 0.5,
                                    ),
                                  ),

                                  /// review section
                                  const SizedBox(
                                    height: 24,
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Review Product',
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
                                    height: 8,
                                  ),

                                  // TODO rating
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/stars.png',
                                        width: 96,
                                        height: 18,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        '4.0',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                          height: 1.5,
                                          letterSpacing: 0.5,
                                          color: AppColors.grey,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        '(${listOfReviews.length} Reviews)',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          height: 1.5,
                                          letterSpacing: 0.5,
                                          color: AppColors.grey,
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(
                                    height: 16,
                                  ),
                                  SingleChildScrollView(
                                    child: ListView.separated(
                                      itemCount: listOfReviews.length,
                                      scrollDirection: Axis.vertical,
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return ReviewWidget(
                                            reviewModel: listOfReviews[index]);
                                      },
                                      separatorBuilder: (BuildContext context, int index) {
                                        return const SizedBox(height: 16,);
                                      },
                                    ),
                                  ),

                                  /// suggested products
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  Text(
                                    'Review Product',
                                    style: TextStyle(
                                      fontSize: 14,
                                      height: 1.5,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.primaryDarkColor,
                                      letterSpacing: .5,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    height: 250,
                                    child: ListView.builder(
                                      itemCount: listOfSuggestedProducts.length,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return ProductItemWidget(
                                            productModel:
                                            listOfSuggestedProducts[index]);
                                      },
                                    ),
                                  ),

                                  /// add to cart button
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primaryColor,
                                      fixedSize: Size(width, 55),
                                    ),
                                    child: Text(
                                      'Add To Cart',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        height: 1.8,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: .5,
                                      ),
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

                  return const SizedBox();
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
