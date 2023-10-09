import 'package:ecommerce/models/feed_model.dart';
import 'package:ecommerce/themes/colors.dart';
import 'package:ecommerce/widgets/feed_widget.dart';
import 'package:flutter/material.dart';

class NotificationFeedScreen extends StatelessWidget {
  NotificationFeedScreen({Key? key}) : super(key: key);

  List<FeedModel> listOfFeed = [
    FeedModel(
      image: 'assets/images/product01.png',
      title: 'New Product',
      description: 'Nike Air Zoom Pegasus 36 Miami - Special For your Activity',
      date: 'June 3, 2015 5:06 PM',
    ),
    FeedModel(
      image: 'assets/images/product02.png',
      title: 'Best Product',
      description: 'Nike Air Zoom Pegasus 36 Miami - Special For your Activity',
      date: 'June 3, 2015 5:06 PM',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 78),
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 8, right: 8),
          child: AppBar(
            title: const Text('Feed'),
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
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              /// divider
              Container(
                child: Divider(
                  thickness: 1,
                  color: AppColors.lightGrey,
                ),
              ),

              /// offers
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: listOfFeed.length,
                itemBuilder: (context,index){
                  return FeedWidget(feedModel: listOfFeed[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
