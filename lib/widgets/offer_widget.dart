import 'package:ecommerce/models/offer_model.dart';
import 'package:ecommerce/themes/colors.dart';
import 'package:flutter/material.dart';

class OfferWidget extends StatelessWidget {
  final OfferModel offerModel;
  const OfferWidget({Key? key, required this.offerModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.local_offer_outlined,
            color: AppColors.primaryColor,
            size: 24,
          ),
          const SizedBox(width: 12,),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                offerModel.title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryDarkColor,
                  letterSpacing: 0.5,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 8,),
              SizedBox(
                width: 300,
                child: Text(
                  offerModel.description,
                  maxLines: 10,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey,
                    letterSpacing: 0.5,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 8,),
              Text(
                offerModel.date,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryDarkColor,
                  letterSpacing: 0.5,
                  height: 1.5,
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
