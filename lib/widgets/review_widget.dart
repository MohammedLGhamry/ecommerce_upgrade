import 'package:ecommerce/models/review_model.dart';
import 'package:ecommerce/themes/colors.dart';
import 'package:flutter/material.dart';

class ReviewWidget extends StatelessWidget {
  final ReviewModel reviewModel;
  const ReviewWidget({super.key, required this.reviewModel});



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// profile picture
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(reviewModel.profilePicture),
              ),
              const SizedBox(width: 16,),

              /// username & rating stars
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    reviewModel.username,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.primaryDarkColor,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                      height: 1.5
                    ),
                  ),
                  const SizedBox(height: 4,),

                  // TODO rating
                  Image.asset(
                    'assets/images/stars.png',
                    width: 96,
                    height: 18,
                  ),
                ],

              ),
            ],
          ),

          const SizedBox(height: 16,),

          /// review description
          Text(
            reviewModel.reviewDescription,
            style: TextStyle(
              fontSize: 12,
              height: 1.8,
              fontWeight: FontWeight.w400,
              color: AppColors.grey,
              letterSpacing: 0.5,
            ),
          ),

          const SizedBox(height: 16,),

          /// images
          SizedBox(
            height: 72,
            child: ListView.separated(
              itemCount: reviewModel.listOfImages!.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                return Container(
                  width: 72,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(
                      image: AssetImage(reviewModel.listOfImages![index]),
                      fit: BoxFit.cover,
                    )
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
               return const SizedBox(width: 10,);
              },
            ),
          ),
          const SizedBox(height: 16,),

          /// date
          Text(
            reviewModel.date,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: AppColors.grey,
              height: 1.5,
              letterSpacing: 0.5,
            ),
          )
        ],
      ),
    );
  }
}
