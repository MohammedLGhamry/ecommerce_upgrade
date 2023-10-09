import 'package:ecommerce/models/offer_model.dart';
import 'package:ecommerce/themes/colors.dart';
import 'package:ecommerce/widgets/offer_widget.dart';
import 'package:flutter/material.dart';

class NotificationOfferScreen extends StatelessWidget {
  NotificationOfferScreen({Key? key}) : super(key: key);

  List<OfferModel> listOfOffers = [
    OfferModel(
      title: 'The Best Title',
      description: 'Culpa cillum consectetur labore nulla nulla magna irure. Id veniam culpa officia aute dolor amet deserunt ex proident commodo',
      date: 'April 30, 2014 1:01 PM',
    ),
    OfferModel(
      title: 'SUMMER OFFER 98% Cashback',
      description: 'Culpa cillum consectetur labore nulla nulla magna irure. Id veniam culpa officia aute dolor',
      date: 'April 30, 2014 1:01 PM',
    ),
    OfferModel(
      title: 'Special Offer 25% OFF',
      description: 'Culpa cillum consectetur labore nulla nulla magna irure. Id veniam culpa officia aute dolor amet deserunt ex proident commodo',
      date: 'April 30, 2014 1:01 PM',
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
            title: const Text('Offer'),
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
                itemCount: listOfOffers.length,
                itemBuilder: (context,index){
                  return OfferWidget(offerModel: listOfOffers[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
