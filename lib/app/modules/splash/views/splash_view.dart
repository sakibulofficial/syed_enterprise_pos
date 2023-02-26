import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syed_enterprise_pos/app/core/values/app_colors.dart';
import 'package:syed_enterprise_pos/app/core/values/app_values.dart';
import '../../../core/base/base_view.dart';
import '../controllers/splash_controller.dart';

class SplashView extends BaseView<SplashController> {
  SplashView({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Image(
              width: MediaQuery.of(context).size.width / 2,
              image: const AssetImage('assets/images/syed_enterprise.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: AppValues.padding_4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Developed by',
                  style: GoogleFonts.inter(
                      color: AppColors.textColorSecondary, fontSize: 18),
                ),
                Image(
                  width: MediaQuery.of(context).size.width / 2,
                  image: const AssetImage('assets/images/elotalablogo.png'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
