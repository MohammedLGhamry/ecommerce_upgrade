import 'package:ecommerce/models/offer_banner_model.dart';
import 'package:ecommerce/themes/colors.dart';
import 'package:flutter/material.dart';

class FlashSaleImageWidget extends StatelessWidget {
  final BannerItemModel bannerData;
  const FlashSaleImageWidget({super.key, required this.bannerData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 205,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
            image: NetworkImage(bannerData.image),
            fit: BoxFit.cover,
          ),
        ),

       /* child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Super Flash Sale',
                    style: TextStyle(
                      fontSize: 24,
                      height: 1.5,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: .5,
                    ),
                  ),
                  Text(
                    '50% Off',
                    style: TextStyle(
                      fontSize: 24,
                      height: 1.5,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: .5,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 24, top: 29),
                  width: 42,
                  height: 41,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: Text(
                    '08',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryDarkColor,
                      letterSpacing: .5,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 12, top: 29),
                  width: 42,
                  height: 41,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: Text(
                    '34',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryDarkColor,
                      letterSpacing: .5,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 12, top: 29),
                  width: 42,
                  height: 41,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: Text(
                    '52',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryDarkColor,
                      letterSpacing: .5,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30,),
          ],
        ),*/

      ),
    );
  }
}
