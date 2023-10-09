import 'package:ecommerce/models/offer_banner_model.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/themes/colors.dart';
import 'package:ecommerce/themes/flutter_font_icons.dart';
import 'package:ecommerce/widgets/flash_sale_image_widget.dart';
import 'package:ecommerce/widgets/grid_product_item_widget.dart';
import 'package:flutter/material.dart';

class SuperFlashSaleScreen extends StatelessWidget {
  final OfferBannerModel offerBannerModel;
  SuperFlashSaleScreen({super.key, required this.offerBannerModel});

  List<ProductModel> listOfSaleProducts = [
    ProductModel(
      image: 'assets/images/product01.png',
      name: 'FS - Nike Air Max 270 React...',
      price: 299.43,
      oldPrice: 534.33,
      discount: 24,
    ),
    ProductModel(
      image: 'assets/images/product02.png',
      name: 'FS - QUILTED MAXI 300 CROS...',
      price: 399.40,
      oldPrice: 599.33,
      discount: 33,
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
      price: 29.43,
      oldPrice: 534.3,
      discount: 24,
    ),
    ProductModel(
      image: 'assets/images/product01.png',
      name: 'FS - Nike Air Max 270 React...',
      price: 299.4,
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
    ProductModel(
      image: 'assets/images/product02.png',
      name: 'FS - QUILTED MAXI 300 CROS...',
      price: 399.43,
      oldPrice: 599.33,
      discount:33,
    ),
    ProductModel(
      image: 'assets/images/product01.png',
      name: 'FS - Nike Air Max 270 React...',
      price: 299.43,
      oldPrice: 534.33,
      discount: 24,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 78),
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 8, right: 15),
          child: AppBar(
            title: const Text('Super Flash Sale'),
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
              /*=Container(
                margin: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
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
                        Text(
                          'Super Flash Sale',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryDarkColor,
                            letterSpacing: 0.5,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
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
              ),*/

              /// divider
              Container(
                child: Divider(
                  thickness: 1,
                  color: AppColors.lightGrey,
                ),
              ),

              /// flash sale img
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: FlashSaleImageWidget(
                    offerBannerModel: offerBannerModel,
                  )),

              /// gridview products
              Expanded(
                child: SingleChildScrollView(
                  child: saleProductsGridViewWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget saleProductsGridViewWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 165 / 300,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        physics: NeverScrollableScrollPhysics(),
        itemCount: listOfSaleProducts.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GridProductItemWidget(productModel: listOfSaleProducts[index]);
        },
      ),
    );
  }
}
