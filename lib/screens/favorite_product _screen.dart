import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/themes/colors.dart';
import 'package:ecommerce/widgets/favorite_product_item_widget.dart';
import 'package:ecommerce/widgets/grid_product_item_widget.dart';
import 'package:flutter/material.dart';

class FavoriteProductScreen extends StatelessWidget {
  final List<ProductModel> listOfFavoriteProducts;
  const FavoriteProductScreen ({super.key, required this.listOfFavoriteProducts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 78),
        child: Padding(
          padding: const EdgeInsets.only(top: 15,left: 8,right: 8),
          child: AppBar(
            title: const Text('Favorite Product'),
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
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.grey,
              ),
            ),
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
              /*Container(
                margin: EdgeInsets.all(16),
                child: Row(
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
                      'Favorite Product',
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
              ),*/

              /// divider
              Container(
                child: Divider(
                  thickness: 1,
                  color: AppColors.lightGrey,
                ),
              ),

              /// products
              Expanded(
                child: SingleChildScrollView(
                  child: favoriteProductsGridViewWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget favoriteProductsGridViewWidget() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 165 / 300,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        physics: NeverScrollableScrollPhysics(),
        itemCount: listOfFavoriteProducts.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return FavoriteProductItemWidget(productModel: listOfFavoriteProducts[index]);
        },
      ),
    );
  }

}
