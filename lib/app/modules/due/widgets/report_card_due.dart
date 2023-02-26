import 'package:flutter/material.dart';
import 'package:syed_enterprise_pos/app/modules/due/model/due_product_model.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../../core/values/text_styles.dart';

class ReportCardDue extends StatelessWidget {
  final DueProductModel product;
  const ReportCardDue({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: AppColors.imageColor,
                ),
              ),
            ),
            padding: const EdgeInsets.all(AppValues.padding),
            margin: const EdgeInsets.only(
              top: AppValues.margin,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Price : ${product.sellingPrice.toString()}',
                      style: productListSubTitleTextStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: AppValues.padding,
                      ),
                      child: Text(
                        'Unit : ${product.unit}',
                        style: productListSubTitleTextStyle,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
