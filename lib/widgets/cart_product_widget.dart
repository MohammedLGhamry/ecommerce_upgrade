import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/themes/colors.dart';
import 'package:flutter/material.dart';

class CartProductWidget extends StatefulWidget {
  final ProductModel productModel;
  CartProductWidget({Key? key, required this.productModel}) : super(key: key);

  @override
  State<CartProductWidget> createState() => _CartProductWidgetState();
}

class _CartProductWidgetState extends State<CartProductWidget> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: AppColors.lightGrey,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// image
          Image.asset(
            widget.productModel.image,
            width: 72,
            height: 72,
          ),
          const SizedBox(width: 12,),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// title
                    SizedBox(
                      width: 155,
                      child: Text(
                        widget.productModel.name,
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
                    ),

                    const SizedBox(width: 13,),

                    /// fav & delete icons
                    Icon(
                      Icons.favorite,
                      color: AppColors.lightRed,
                    ),
                    const SizedBox(width: 8,),
                    Icon(
                      Icons.delete_outline_rounded,
                      color: AppColors.grey,
                    ),
                  ],
                ),

                const SizedBox(height: 18,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// price
                    Text(
                      '\$${widget.productModel.price}',
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.5,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryColor,
                        letterSpacing: .5,
                      ),
                    ),

                    const SizedBox(width: 70,),
                    ///  - + counter
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: AppColors.lightGrey,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: (){
                              setState(() {
                                if(counter > 0){
                                  counter -= 1;
                                }
                              });
                            },
                            child: Icon(
                              Icons.remove,
                              color: AppColors.grey,
                              size: 16,
                            ),
                          ),
                          const SizedBox(width: 8,),
                          Container(
                            color: AppColors.lightGrey,
                            width: 40,
                            child: Text(
                              '$counter',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.5,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primaryDarkColor,
                                letterSpacing: .5,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8,),
                          InkWell(
                            onTap: (){
                              setState(() {
                                counter += 1;
                              });
                            },
                            child: Icon(
                              Icons.add,
                              color: AppColors.grey,
                              size: 16,
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
