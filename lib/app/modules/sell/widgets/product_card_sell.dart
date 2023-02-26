import 'package:flutter/material.dart';
import 'package:syed_enterprise_pos/app/modules/sell/models/product_confirm_model.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../../core/values/text_styles.dart';

class ProductCardSell extends StatelessWidget {
  final ProductConfirmModel product;
  final FormFieldValidator<String>? onChange;
  final VoidCallback delete;

  const ProductCardSell({
    super.key,
    required this.product,
    required this.onChange,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: AppValues.margin_10),
      color: AppColors.borderColor.withOpacity(0.5),
      child: InkWell(
        child: Row(
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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.title!,
                          overflow: TextOverflow.ellipsis,
                          style: productListTitleTextStyle,
                        ),
                        IconButton(
                          onPressed: delete,
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: AppValues.margin_4),
                      width: MediaQuery.of(context).size.width,
                      height: 2,
                      color: AppColors.borderColor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Price : ${product.sellingPrice.toString()}',
                                style: productListSubTitleTextStyle,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: AppValues.smallPadding,
                                ),
                                child: Text(
                                  'Unit : ${product.unit}',
                                  style: productListSubTitleTextStyle,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(AppValues.padding_4),
                            child: SizedBox(
                              height: 50,
                              child: TextField(
                                onChanged: onChange,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: AppColors.colorWhite,
                                    hintText: '000',
                                    hintStyle: hintTextStyleTwo,
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: AppColors.textFieldBorderColor,
                                      ), //<-- SEE HERE
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: AppColors.textFieldBorderColor,
                                      ), //<-- SEE HERE
                                    )),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
