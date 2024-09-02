import 'package:MultiCal/app/constant/resources/app_images.dart';
import 'package:MultiCal/app/core/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/resources/app_colors.dart';
import '../../../../constant/resources/app_dimens.dart';
import '../../../../constant/translation/app_translation.dart';
import '../../../../widget/secondary_button_widget.dart';
import '../../../../widget/text_view_widget.dart';
import '../controller/select_language_controller.dart';


class SelectLanguageScreen extends BaseView<SelectLanguageController> {
  SelectLanguageScreen({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 0.65,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.icSplash), fit: BoxFit.fill),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(AppImages.icLogo),
                const Flexible(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextViewWidget(
                          "Welcome",
                          textColor: AppColors.textColorWhite,
                          fontWeight: FontWeight.bold,
                          textSize: AppDimens.TEXT_HEADING_1X,
                        ),
                        SizedBox(height: AppDimens.MARGIN_MEDIUM,),
                        TextViewWidget(
                          "Stay organized and on track with our Calendar App",
                          textColor: AppColors.textColorWhite,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: AppDimens.MARGIN_MEDIUM_3,
        ),
        const TextViewWidget(
          "Select Language",
          textColor: AppColors.colorBlackText,
          fontWeight: FontWeight.bold,
          textSize: AppDimens.TEXT_HEADING_1X,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.languageList.length,
                itemBuilder: (_, index) => changeLanguageWidget(index))),
      ],
    );
  }

  @override
  Widget? bottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: AppDimens.MARGIN_MEDIUM_3,
          horizontal: AppDimens.MARGIN_MEDIUM),
      child: SecondaryButtonWidget(
        child: const TextViewWidget(
          "Start",
          textColor: Colors.white,
        ),
        onPress: () {
          controller.changeLanguage(
            AppTranslation.locales[controller.selectLanguageGroupLanguage.value]
                [translationLocaleKey],
          );
        },
        height: 56,
      ),
    );
  }

  Widget changeLanguageWidget(int radioValue) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(AppDimens.MARGIN_MEDIUM_2),
        margin: const EdgeInsets.only(bottom: AppDimens.MARGIN_MEDIUM),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grayColor, width: 1),
          borderRadius:
              const BorderRadius.all(Radius.circular(AppDimens.MARGIN_MEDIUM)),
        ),
        child: Center(
          child: ListTile(
            title: TextViewWidget(
              controller.languageList[radioValue].name ?? "",
            ),
            trailing: Radio(
              value: radioValue,
              groupValue: controller.selectLanguageGroupLanguage.value,
              onChanged: (value) {
                controller.selectLanguageGroupLanguage.value = radioValue;
              },
              activeColor: AppColors.primaryColor,
            ),
            leading:
                Image.asset(controller.languageList[radioValue].image ?? ""),
          ),
        ),
      ),
    );
  }
}
