import 'package:flutter/material.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../models/dashboard_card_model.dart';

class DashboardCard extends StatelessWidget {
  final DashboardCardModel dashboardCardModel;

  const DashboardCard({
    super.key,
    required this.dashboardCardModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: dashboardCardModel.onTap,
      child: Container(
          margin: const EdgeInsets.all(AppValues.margin_6),
          decoration: BoxDecoration(
            color: AppColors.colorWhite,
            borderRadius: BorderRadius.circular(
              AppValues.radius_10,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.24),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, 4), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(
                  AppValues.smallPadding,
                ),
                child: Image(
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/dashboard/${dashboardCardModel.image}',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(
                  AppValues.smallPadding,
                ),
                alignment: Alignment.centerRight,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(AppValues.radius_10),
                    bottomRight: Radius.circular(AppValues.radius_10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      dashboardCardModel.name,
                    ),
                    const Icon(Icons.arrow_forward),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
