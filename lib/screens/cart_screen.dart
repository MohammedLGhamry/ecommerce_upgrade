import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/screens/shipping_screen.dart';
import 'package:ecommerce/themes/colors.dart';
import 'package:ecommerce/widgets/cart_product_widget.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  List<ProductModel> listOfCart = [
    ProductModel(
      image: 'assets/images/product01.png',
      name: 'FS - Nike Air Max 270 React Sneakers',
      price: 299.43,
      oldPrice: 534.33,
      discount: 24,
      listOfColors: [
        Colors.yellow,
        Colors.pink,
        Colors.blue,
        Colors.black,
        Colors.purpleAccent,
        Colors.lightGreen
      ],
      listOfSizes: ['5', '6', '7', '8', '9', '10', '11'],
    ),
    ProductModel(
      image: 'assets/images/product02.png',
      name: 'FS - QUILTED MAXI 300 CROSS PLUS BAG',
      price: 20.43,
      oldPrice: 30.33,
      discount: 33,
      listOfColors: [Colors.green, Colors.pink, Colors.blue, Colors.black],
      listOfSizes: ['S', 'M', 'L', 'XL', 'XXL'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 78),
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 16, right: 15),
          child: AppBar(
            title: const Text('Your Cart'),
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

              Expanded(
                child: SingleChildScrollView(
                  /// list of products
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemCount: listOfCart.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return CartProductWidget(
                                productModel: listOfCart[index]);
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 16,
                            );
                          },
                        ),

                        const SizedBox(
                          height: 32,
                        ),

                        /// coupon
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: AppColors.lightGrey,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  SizedBox(
                                    width: 180,
                                    child: TextFormField(
                                      decoration: InputDecoration.collapsed(
                                        hintText: 'Enter Coupon Code',
                                        hintStyle: TextStyle(
                                          fontSize: 12,
                                          height: 1.5,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.grey,
                                          letterSpacing: .5,
                                        ),
                                      ),
                                      style: TextStyle(
                                        fontSize: 12,
                                        height: 1.5,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.grey,
                                        letterSpacing: .5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 55,
                                  width: 88,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5),
                                        bottomRight: Radius.circular(5)),
                                    color: AppColors.primaryColor,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Apply',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        height: 1.8,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: .5,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 16,
                        ),

                        /// price details
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: AppColors.lightGrey,
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Items (${listOfCart.length})',
                                    style: TextStyle(
                                      fontSize: 12,
                                      height: 1.5,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.grey,
                                      letterSpacing: .5,
                                    ),
                                  ),
                                  Text(
                                    '\$599.99',
                                    style: TextStyle(
                                      fontSize: 12,
                                      height: 1.5,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.primaryDarkColor,
                                      letterSpacing: .5,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Shipping',
                                    style: TextStyle(
                                      fontSize: 12,
                                      height: 1.5,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.grey,
                                      letterSpacing: .5,
                                    ),
                                  ),
                                  Text(
                                    '\$40',
                                    style: TextStyle(
                                      fontSize: 12,
                                      height: 1.5,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.primaryDarkColor,
                                      letterSpacing: .5,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Import charges',
                                    style: TextStyle(
                                      fontSize: 12,
                                      height: 1.5,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.grey,
                                      letterSpacing: .5,
                                    ),
                                  ),
                                  Text(
                                    '\$129.99',
                                    style: TextStyle(
                                      fontSize: 12,
                                      height: 1.5,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.primaryDarkColor,
                                      letterSpacing: .5,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: List.generate(
                                  150 ~/ 2,
                                  (index) => Expanded(
                                    child: Container(
                                      color: index % 2 == 0
                                          ? AppColors.lightGrey
                                          : Colors.transparent,
                                      height: 1,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total Price',
                                    style: TextStyle(
                                      fontSize: 12,
                                      height: 1.5,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.primaryDarkColor,
                                      letterSpacing: .5,
                                    ),
                                  ),
                                  Text(
                                    '\$729.99',
                                    style: TextStyle(
                                      fontSize: 12,
                                      height: 1.5,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.primaryColor,
                                      letterSpacing: .5,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 16,
                        ),

                        /// check out button
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShippingScreen()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            fixedSize:
                                Size(MediaQuery.of(context).size.width, 55),
                          ),
                          child: Text(
                            'Check Out',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              height: 1.8,
                              fontWeight: FontWeight.w700,
                              letterSpacing: .5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
