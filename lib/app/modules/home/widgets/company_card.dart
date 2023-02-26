import 'package:flutter/material.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../../core/values/text_styles.dart';

class CompanyCardWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  const CompanyCardWidget({
    super.key,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppValues.radius_10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        margin: const EdgeInsets.all(AppValues.margin_10),
        height: MediaQuery.of(context).size.width / 2,
        width: MediaQuery.of(context).size.width / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(
                AppValues.smallPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: cardTitleTextStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Stock : 000',
                    style: cardSubTitleTextStyle,
                  ),
                  Text(
                    'total : 000',
                    style: cardSubTitleTextStyle,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                right: AppValues.smallPadding,
              ),
              alignment: Alignment.centerRight,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(AppValues.radius_10),
                  bottomRight: Radius.circular(AppValues.radius_10),
                ),
                color: AppColors.secondaryColorPrimary,
              ),
              child: const Icon(Icons.arrow_forward),
            )
          ],
        ),
      ),
    );
  }
}
