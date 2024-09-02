import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/resources/app_dimens.dart';
import '../../../constant/resources/app_string.dart';
import '../../../constant/routing/app_route.dart';
import '../../../core/base/base_view.dart';
import '../../../widget/default_app_bar_widget.dart';
import '../../../widget/text_view_widget.dart';
import '../controller/home_controller.dart';

class HomeScreen extends BaseView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return DefaultAppBar(
      title: AppString.hello.tr,
      trillingIcon: Icons.language,
      trillingIconOnClick: () => Get.toNamed(Routes.changeTheme),
    );
  }

  @override
  Widget body(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Flexible(
            child: CustomScrollView(slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.all(
                        AppDimens.MARGIN_MEDIUM,
                      ),
                      color: const Color(0xffe45c5c).withOpacity(0.1),
                      child: ListTile(
                        title: TextViewWidget(
                          controller.patientList[index].name ?? "Patient Name",
                          fontWeight: FontWeight.bold,
                          textSize: AppDimens.TEXT_REGULAR_2X,
                        ),
                        subtitle: TextViewWidget(
                          controller.patientList[index].code ?? "Patient Code",
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    );
                  },
                  childCount: controller.patientList.length,
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
