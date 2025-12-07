import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_source_flutter_portfolio/core/constants/app_constant.dart';
import 'package:open_source_flutter_portfolio/core/constants/app_strings.dart';
import 'package:open_source_flutter_portfolio/core/utils/dprint.dart';
import 'package:open_source_flutter_portfolio/core/utils/url_launcher_service.dart';

class HomeController extends GetxController {
  RxString selectedOption = AppStrings.aboutMe.obs;
  final ScrollController scrollController = ScrollController();
  final GlobalKey aboutSection = GlobalKey();
  final GlobalKey workSection = GlobalKey();
  final GlobalKey skillSection = GlobalKey();
  final GlobalKey contactSection = GlobalKey();

  void selectOption(String option) {
    selectedOption.value = option;

    BuildContext? context;

    if (option == AppStrings.aboutMe) {
      context = aboutSection.currentContext;
    } else if (option == AppStrings.work) {
      context = workSection.currentContext;
    } else if (option == AppStrings.skills) {
      context = skillSection.currentContext;
    } else if (option == AppStrings.contact) {
      context = contactSection.currentContext;
    }

    if (context == null) return;

    final RenderObject? scrollRenderObject = scrollController
        .position
        .context
        .notificationContext
        ?.findRenderObject();

    final RenderBox box = context.findRenderObject() as RenderBox;

    final double y = box
        .localToGlobal(Offset.zero, ancestor: scrollRenderObject)
        .dy;

    scrollController.animateTo(
      y + scrollController.offset - 120,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  void openUrl(String url) async {
    try {
      await UrlLauncherService.launchUrlLink(url);
    } catch (e) {
      dprint("Error:$e");
    }
  }

  void openEmail() async {
    try {
      await UrlLauncherService.openEmail(AppConstants.email);
    } catch (e) {
      dprint("Error:$e");
    }
  }
}
