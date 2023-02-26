import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syed_enterprise_pos/app/core/values/app_colors.dart';
import 'package:syed_enterprise_pos/app/core/values/app_values.dart';

import '../../../core/values/text_styles.dart';
import '../models/report_model.dart';

class ReportCard extends StatelessWidget {
  final ReportModel reportModel;
  final VoidCallback onTap;
  const ReportCard({
    super.key,
    required this.reportModel,
    required this.onTap,
  });

  String getFormatedDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    DateFormat dateFormat = DateFormat("dd-MM-yyyy");
    String formatedDate = dateFormat.format(dateTime);
    return formatedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppValues.padding),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.colorWhite,
            borderRadius: BorderRadius.circular(AppValues.radius),
            boxShadow: [
              BoxShadow(
                color: AppColors.textColorSecondary.withOpacity(.5),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          height: MediaQuery.of(context).size.width / 4,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: reportModel.isPaid == false
                          ? AppColors.nonPaidColor
                          : AppColors.paidColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(AppValues.radius_10),
                        topLeft: Radius.circular(AppValues.radius_10),
                      ),
                    ),
                    width: 10,
                    height: MediaQuery.of(context).size.height,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: AppValues.margin),
                    height: MediaQuery.of(context).size.width / 4 - 30,
                    width: MediaQuery.of(context).size.width / 4 - 30,
                    decoration: BoxDecoration(
                      color: AppColors.colorWhite,
                      borderRadius: BorderRadius.circular(AppValues.radius_10),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.textColorSecondary.withOpacity(.5),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '1',
                          style: cardTitleTextStyle,
                        ),
                        Text(
                          'Items',
                          style: cardSubTitleTextStyle,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: AppValues.padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      reportModel.customerName!,
                      overflow: TextOverflow.ellipsis,
                      style: cardTitleTextStyle,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        top: AppValues.padding_4,
                      ),
                      child: Text(
                        "Date : ${getFormatedDate(reportModel.buyingDate!)}",
                        style: cardSubTitleTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppValues.padding,
                  vertical: AppValues.smallPadding,
                ),
                margin: const EdgeInsets.only(
                  right: AppValues.margin,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppValues.radius_10),
                  color: reportModel.isPaid == false
                      ? AppColors.nonPaidColor.withOpacity(.3)
                      : AppColors.paidColor.withOpacity(.3),
                ),
                child: Text(
                  reportModel.isPaid == false ? 'Due' : 'Paid',
                  style: GoogleFonts.inter(
                    color: reportModel.isPaid == false
                        ? AppColors.nonPaidColor
                        : AppColors.paidColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
