import 'package:ecommerce/repository/category_product_repo.dart';
import 'package:ecommerce/screens/product_screen.dart';
import 'package:ecommerce/themes/colors.dart';
import 'package:ecommerce/widgets/grid_product_item_widget.dart';
import 'package:flutter/material.dart';

class CategoryProductScreen extends StatelessWidget {
  final String name;
  final int id;
  const CategoryProductScreen({Key? key, required this.name, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 78),
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 8, right: 8),
          child: AppBar(
            title: Text(name),
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
      body: FutureBuilder(
        future: CategoryProductRepo().fetchCategoryProducts(id),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData) {
            final list = snapshot.data!;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 165 / 300,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              physics: NeverScrollableScrollPhysics(),
              itemCount: list.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductScreen(
                          id: list[index].id, name: list[index].name),
                    ));
                  },
                  child: Container(
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
                          Image.network(
                            list[index].image,
                            width: 150,
                            height: 150,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            list[index].name,
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
                            '\$${list[index].price}',
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
                                '\$${list[index].oldPrice}',
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
                                '${list[index].discount}% Off',
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
                  ),
                );
                ;
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
