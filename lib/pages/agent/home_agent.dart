import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tirtaasri_app/components/custom_appbar.dart';
import 'package:tirtaasri_app/components/custom_avatar.dart';
import 'package:tirtaasri_app/components/custom_button.dart';
import 'package:tirtaasri_app/components/custom_menu.dart';
import 'package:tirtaasri_app/components/custom_text.dart';
import 'package:tirtaasri_app/components/custom_title_menu.dart';
import 'package:tirtaasri_app/pages/agent/history_transaction.dart';
import 'package:tirtaasri_app/theme/colors.dart';
import 'package:tirtaasri_app/theme/styles.dart';
import 'package:tirtaasri_app/utils/dialog.dart';
import 'package:tirtaasri_app/utils/navigation.dart';

import '../../components/custom_menu_logout.dart';
import '../../utils/preferences_util.dart';
import '../../utils/strings.dart';

class HomeAgent extends StatelessWidget {
  const HomeAgent({super.key, this.user});
  final dynamic user;

  @override
  Widget build(BuildContext context) {
    // final userSaved =
    //     PreferencesUtil.getString(Strings.kUserLogin, defValue: null);
    // dynamic user;
    // if (user != null) {
    //   debugPrint("user");
    //   user = jsonDecode(userSaved);
    // }

    return Scaffold(
      appBar: CustomAppBar(
        titleWidget: Image.asset(
          "assets/png/app_bar_logo.png",
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
           CustomAvatar(
            name: user?["agentName"] ?? "",
          ),
          CustomText(
              text: "Agen",
              color: AppColors.primaryColor,
              style: AppStyles.regular12),
          const CustomTitleMenu(
            title: "Profile",
          ),
          CustomMenu(
              leading:
                  SvgPicture.asset('assets/svg/iconoir_profile-circle.svg'),
              text: user?["name"] ?? "",
              trailing: SvgPicture.asset(
                  'assets/svg/material-symbols_edit-square-outline-sharp.svg')),
          CustomMenu(
              leading: SvgPicture.asset('assets/svg/ic_home_menu.svg'),
              text: user?["address"] ?? "",
              trailing: SvgPicture.asset(
                  'assets/svg/material-symbols_edit-square-outline-sharp.svg')),
          CustomMenu(
              leading: SvgPicture.asset(
                  'assets/svg/material-symbols_perm-phone-msg-sharp.svg'),
              text: user?["phoneNumber"] ?? "",
              trailing: SvgPicture.asset(
                  'assets/svg/material-symbols_edit-square-outline-sharp.svg')),
          CustomMenu(
            leading: SvgPicture.asset('assets/svg/mdi_box-variant.svg'),
            text: "4 Galon",
          ),
          const Divider(color: AppColors.black87),
          const SizedBox(
            height: 12,
          ),
          const CustomTitleMenu(
            title: "Fitur",
          ),
          CustomMenu(
            onTap: () {
              CustomDialog.show(context, const UpdateStokGalon());
            },
            leading: SvgPicture.asset('assets/svg/mdi_box-variant-add.svg'),
            text: "Update Stok Galon",
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.primaryColor,
            ),
          ),
          CustomMenu(
            onTap: () {
              CustomNavigation.pushNavigate(
                  context: context, screen: const HistoryTransaction());
            },
            leading:
                SvgPicture.asset('assets/svg/pixelarticons_notes-multiple.svg'),
            text: "Riwayat Transaksi",
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          CustomMenuLogout()
        ],
      )),
    );
  }
}

class UpdateStokGalon extends StatelessWidget {
  const UpdateStokGalon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: SvgPicture.asset("assets/svg/mdi_box-variant-add.svg"),
          title: CustomText(
              text: "REQUEST GALON",
              color: AppColors.primaryColor,
              style: AppStyles.bold16),
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.minimize, color: AppColors.primaryColor),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 50),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.aquaLessColor),
              child: CustomText(
                  align: TextAlign.center,
                  text: "0",
                  color: AppColors.primaryColor,
                  style: AppStyles.bold16),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add, color: AppColors.primaryColor),
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: const CustomButtonElevation(
              textColor: AppColors.primaryColor,
              backgroundColor: AppColors.aquaMiddleColor,
              text: "Simpan"),
        )
      ],
    );
  }
}