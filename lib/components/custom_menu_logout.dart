import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/styles.dart';
import 'custom_text.dart';

class CustomMenuLogout extends StatelessWidget{
  const CustomMenuLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.greyBgColor,
      child: Column(
        children: [
          const Divider(
            height: 1,
            color: AppColors.black87,
          ),
          Container(
            width: double.infinity,
            color: AppColors.greyBgColor,
            padding: const EdgeInsets.all(12),
            child: CustomText(
              text: "Keluar",
              color: AppColors.primaryColor,
              style: AppStyles.bold16,
              align: TextAlign.center,
            ),
          ),
          const Divider(
            height: 1,
            color: AppColors.black87,
          ),
        ],
      ),
    );
  }

}