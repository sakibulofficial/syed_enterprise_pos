import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../routes/app_pages.dart';
import '../model/products_model.dart';
import '../values/app_colors.dart';
import '../values/app_values.dart';
import '../values/text_styles.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          Routes.PRODUCTDETAILS,
          arguments: product,
        );
      },
      child: Container(
          decoration: BoxDecoration(color: AppColors.colorWhite, boxShadow: [
            BoxShadow(
              color: AppColors.textColorSecondary.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ]),
          padding: const EdgeInsets.all(AppValues.padding),
          margin: const EdgeInsets.symmetric(
            vertical: AppValues.margin_10,
            horizontal: AppValues.margin,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title!,
                overflow: TextOverflow.ellipsis,
                style: productListTitleTextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price : ${product.buyingPrice.toString()}',
                    style: productListSubTitleTextStyle,
                  ),
                  Text(
                    'Stock : ${product.stockCount}',
                    style: product.stockCount! < 10
                        ? productListSubTitleRedTextStyle
                        : productListSubTitleTextStyle,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Unit : ${product.unit}',
                    style: productListSubTitleTextStyle,
                  ),
                  Text(
                    'Value : ${product.buyingPrice! * product.stockCount!}',
                    style: productListSubTitleTextStyle,
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
