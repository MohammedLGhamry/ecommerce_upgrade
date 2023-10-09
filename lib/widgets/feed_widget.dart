import 'package:ecommerce/models/feed_model.dart';
import 'package:ecommerce/themes/colors.dart';
import 'package:flutter/material.dart';

class FeedWidget extends StatelessWidget {
  final FeedModel feedModel;
  const FeedWidget({Key? key, required this.feedModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            feedModel.image,
            width: 48,
            height: 48,
          ),
          const SizedBox(width: 12,),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                feedModel.title,
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
                  feedModel.description,
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
                feedModel.date,
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
