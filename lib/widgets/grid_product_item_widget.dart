import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/themes/colors.dart';
import 'package:flutter/material.dart';

class GridProductItemWidget extends StatelessWidget {
  final ProductModel productModel;
  const GridProductItemWidget({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        border: Border.all(color: AppColors.lightGrey),
      ),
      child: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              productModel.image,
              width: 150,
              height: 150,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              productModel.name,
              maxLines: 2,
              style: TextStyle(
                fontSize: 12,
                height: 1.5,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryDarkColor,
                letterSpacing: .5,
              ),
            ),
            const SizedBox(
              height: 4,
            ),

            // TODO rating
            Image.asset(
              'assets/images/stars.png',
              width: 68,
              height: 12,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              '\$${productModel.price}',
              style: TextStyle(
                fontSize: 12,
                height: 1.8,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryColor,
                letterSpacing: .5,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '\$${productModel.oldPrice}',
                  style: TextStyle(
                    fontSize: 10,
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey,
                    letterSpacing: .5,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  '${productModel.discount}% Off',
                  style: TextStyle(
                    fontSize: 10,
                    height: 1.5,
                    fontWeight: FontWeight.w700,
                    color: AppColors.lightRed,
                    letterSpacing: .5,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
