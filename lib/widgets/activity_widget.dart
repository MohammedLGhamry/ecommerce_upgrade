import 'package:ecommerce/models/activity_model.dart';
import 'package:ecommerce/themes/colors.dart';
import 'package:flutter/material.dart';

class ActivityWidget extends StatelessWidget {
  final ActivityModel activityModel;
  const ActivityWidget({Key? key, required this.activityModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/transaction.png',
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 12,),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 300,
                child: Text(
                  activityModel.title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryDarkColor,
                    letterSpacing: 0.5,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 8,),
              SizedBox(
                width: 300,
                child: Text(
                  activityModel.description,
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
                activityModel.date,
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
