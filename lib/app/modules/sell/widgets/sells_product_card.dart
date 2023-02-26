import 'package:flutter/material.dart';
import '../../../core/model/products_model.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../../core/values/text_styles.dart';

class SellsProductCard extends StatelessWidget {
  final ProductModel productListModel;
  final VoidCallback onTap;
  final Color color;
  const SellsProductCard({
    super.key,
    required this.productListModel,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: AppValues.margin_10,
          horizontal: AppValues.margin,
        ),
        decoration: BoxDecoration(
          color: AppColors.colorWhite,
          borderRadius: BorderRadius.circular(AppValues.radius_10),
          boxShadow: [
            BoxShadow(
              color: AppColors.searchFieldTextColor.withOpacity(0.4),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        padding: const EdgeInsets.all(AppValues.padding),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productListModel.title!,
                    overflow: TextOverflow.ellipsis,
                    style: productListTitleTextStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: AppValues.padding,
                        ),
                        child: Text(
                          'Unit : ${productListModel.unit}',
                          style: productListSubTitleTextStyle,
                        ),
                      ),
                      Text(
                        'Stock : ${productListModel.stockCount}',
                        style: productListModel.stockCount! <= 10
                            ? productListSubTitleRedTextStyle
                            : productListSubTitleTextStyle,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  AppValues.largeRadius,
                ),
                border: Border.all(color: color, width: 1),
              ),
              child: Icon(
                Icons.done,
                color: color,
              ),
            )
          ],
        ),
      ),
    );
  }
}
