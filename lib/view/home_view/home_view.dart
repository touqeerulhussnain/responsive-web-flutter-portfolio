import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_source_flutter_portfolio/core/constants/app_constant.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/app_styles.dart';
import '../../core/constants/app_theme.dart';
import '../../core/utils/app_responsiveness.dart';
import '../../view/home_view/home_controller.dart';
import '../../widget/app_drawer.dart';
import '../../widget/custom_svg.dart';
import '../../widget/horizontal_button_list.dart';
import '../../widget/project_card.dart';
import '../../widget/skill_card.dart';
import '../../widget/social_icons.dart';

import '../../widget/left_bubble.dart';
import '../../widget/left_icons.dart';
import '../../widget/right_bubble.dart';
import '../../widget/right_icons.dart';
import '../../widget/spaces.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  var controller = Get.put(HomeController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          bottom: AppResponsiveness.getSize(onWeb: 0, onMobile: 0),
        ),
        child: FloatingActionButton.extended(
          onPressed: () {
            controller.openUrl(AppConstants.resumePdfUrl);
          },
          backgroundColor: AppTheme.primary(context),
          label: Text(
            AppStrings.downloadCV,
            style: AppStyles.secondaryStyle(
              context: context,
              color: AppColors.whiteText,
              fontSize: AppResponsiveness.getSize(
                onWeb: AppSizes.font14,
                onMobile: AppSizes.font14,
                onTablet: AppSizes.font14,
              ),
            ),
          ),
        ),
      ),
      body: Scaffold(
        key: _scaffoldKey,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
        floatingActionButton: Container(
          height: AppSizes.height56,
          margin: EdgeInsets.symmetric(vertical: AppSizes.margin32),
          child: Obx(
            () => AppResponsiveness.getDynamic(
              onWeb: HorizontalButtonList(
                options: [
                  AppStrings.aboutMe,
                  AppStrings.work,
                  AppStrings.skills,
                  AppStrings.contact,
                ],
                onTap: (String option) {
                  controller.selectOption(option);
                },
                selectedOption: controller.selectedOption.value,
              ),
              onMobile: Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: AppSizes.padding32),
                child: IconButton.filled(
                  style: IconButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(
                        AppSizes.radius10,
                      ),
                      side: BorderSide(color: Colors.white),
                    ),
                  ),
                  onPressed: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                  icon: Icon(Icons.menu),
                ),
              ),

              smallMobile: Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: AppSizes.padding32),
                child: IconButton.filled(
                  style: IconButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(
                        AppSizes.radius10,
                      ),
                      side: BorderSide(color: Colors.white),
                    ),
                  ),
                  onPressed: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                  icon: Icon(Icons.menu),
                ),
              ),
            ),
          ),
        ),
        drawer: Obx(
          () => SimpleAppDrawer(
            options: [
              AppStrings.aboutMe,
              AppStrings.work,
              AppStrings.skills,
              AppStrings.contact,
            ],
            onTap: (String option) {
              controller.selectOption(option);
            },
            selectedOption: controller.selectedOption.value,
          ),
        ),
        body: SingleChildScrollView(
          controller: controller.scrollController,
          child: Column(
            children: [
              AppResponsiveness.getDynamic(
                onWeb: SpaceH130(),
                onMobile: SpaceH50(),
                smallMobile: SpaceH50(),
              ),
              SizedBox(
                // color: Colors.amber,
                key: controller.aboutSection,
                height: AppSizes.height330,
                width: AppResponsiveness.setWidth(context),
                child: Stack(
                  alignment: Alignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    LeftIcons(),
                    RightIcons(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        Container(
                          height: AppResponsiveness.getSize(
                            onWeb: AppSizes.size200,
                            onMobile: AppSizes.size150,
                          ),
                          width: AppResponsiveness.getSize(
                            onWeb: AppSizes.size200,
                            onMobile: AppSizes.size150,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.transparent,
                            image: DecorationImage(
                              image: AssetImage(AppAssets.profile),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              AppStrings.developerName,
                              style: AppStyles.secondaryStyle(
                                context: context,
                                color: AppTheme.primaryText(context),
                                fontSize: AppResponsiveness.adjustSize(
                                  AppSizes.font20,
                                ),
                              ),
                            ),
                            Text(
                              AppStrings.profession,
                              style: AppStyles.secondaryStyle(
                                context: context,
                                color: AppTheme.blackText(context),
                                fontSize: AppResponsiveness.adjustSize(
                                  AppSizes.font20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(
                width: AppResponsiveness.setWidth(context, width: .8),
                child: Column(
                  spacing: 10,
                  children: [
                    Text(
                      AppStrings.coreValue,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: AppStyles.primaryStyle(
                        context: context,
                        fontSize: AppResponsiveness.getSize(
                          onWeb: AppSizes.font48,
                          onMobile: AppSizes.font24,
                          onTablet: AppSizes.font24,
                        ),
                        color: AppTheme.primary(context),
                      ),
                    ),

                    Text(
                      AppStrings.description,
                      textAlign: TextAlign.center,
                      style: AppStyles.secondaryStyle(
                        context: context,
                        fontSize: AppResponsiveness.getSize(
                          onWeb: AppSizes.font24,
                          onMobile: AppSizes.font18,
                          onTablet: AppSizes.font18,
                        ),
                        color: AppTheme.blackText(context),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: AppSizes.margin32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(),
                    Flexible(
                      child: SocialIcon(
                        width: AppSizes.width40,
                        height: AppSizes.height32,
                        assetPath: AppAssets.email,
                        text: AppStrings.email,
                        color: AppTheme.primary(context),
                        onTap: () {
                          controller.openEmail();
                        },
                      ),
                    ),
                    Flexible(
                      child: SocialIcon(
                        assetPath: AppAssets.facebook,
                        text: AppStrings.facebook,
                        color: AppTheme.primary(context),
                        onTap: () {
                          controller.openUrl(AppConstants.facebookUrl);
                        },
                      ),
                    ),
                    Flexible(
                      child: SocialIcon(
                        assetPath: AppAssets.instagram,
                        text: AppStrings.instagram,
                        onTap: () {
                          controller.openUrl(AppConstants.instagramUrl);
                        },
                        color: AppTheme.primary(context),
                      ),
                    ),
                    Flexible(
                      child: SocialIcon(
                        assetPath: AppAssets.linkedIn,
                        text: AppStrings.linkedin,
                        onTap: () {
                          controller.openUrl(AppConstants.linkedInUrl);
                        },
                        color: AppTheme.primary(context),
                      ),
                    ),
                    SizedBox(),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: AppSizes.margin20,
                    ),
                    child: CustomSvg(
                      assetPath: AppAssets.arrowDown,
                      color: AppTheme.primary(context),
                      height: AppResponsiveness.getSize(
                        onWeb: AppSizes.size56,
                        onTablet: AppSizes.size48,
                        onMobile: AppSizes.size40,
                      ),
                      width: AppResponsiveness.getSize(
                        onWeb: AppSizes.size56,
                        onTablet: AppSizes.size48,
                        onMobile: AppSizes.size40,
                      ),
                    ),
                  ),
                ],
              ),

              // Example: floating an icon
              SpaceH40(),
              SizedBox(
                key: controller.workSection,
                width: AppResponsiveness.setWidth(context, width: .8),
                child: Column(
                  spacing: 20,
                  children: [
                    Text(
                      AppStrings.recentWorkTitle,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: AppStyles.primaryStyle(
                        context: context,
                        fontSize: AppResponsiveness.getSize(
                          onWeb: AppSizes.font48,
                          onMobile: AppSizes.font24,
                          onTablet: AppSizes.font24,
                        ),
                        fontWeight: AppStyles.w700,
                        color: AppTheme.primary(context),
                      ),
                    ),
                    Text(
                      AppStrings.recentWorkDescription,
                      textAlign: TextAlign.center,
                      style: AppStyles.secondaryStyle(
                        context: context,
                        fontSize: AppResponsiveness.getSize(
                          onWeb: AppSizes.font24,
                          onMobile: AppSizes.font18,
                          onTablet: AppSizes.font18,
                        ),
                        color: AppTheme.blackText(context),
                      ),
                    ),
                  ],
                ),
              ),
              SpaceH40(),

              ProjectCard(
                assetPath: AppAssets.iphoneBody,
                title: AppStrings.projectOneTitle,
                description: AppStrings.projectOneDescription,
                onPlayStoreTap: () {},
                onAppStoreTap: () {},
                uniqueColor: AppColors.blue,
                lableText: AppStrings.chipOneText,
              ),
              SpaceH20(),
              ProjectCard(
                assetPath: AppAssets.iphoneBody,
                title: AppStrings.projectOneTitle,
                description: AppStrings.projectOneDescription,
                onPlayStoreTap: () {},
                onAppStoreTap: () {},
                uniqueColor: AppColors.purple,
                lableText: AppStrings.chipOneText,
              ),
              SpaceH20(),
              ProjectCard(
                assetPath: AppAssets.iphoneBody,
                title: AppStrings.projectOneTitle,
                description: AppStrings.projectOneDescription,
                onPlayStoreTap: () {},
                onAppStoreTap: () {},
                uniqueColor: AppColors.orange,
                lableText: AppStrings.chipOneText,
              ),
              SpaceH40(),
              SpaceH40(),
              SizedBox(
                key: controller.skillSection,
                width: AppResponsiveness.setWidth(context, width: .8),
                child: Column(
                  spacing: 20,
                  children: [
                    Text(
                      AppStrings.skillStrength,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: AppStyles.primaryStyle(
                        context: context,
                        fontSize: AppResponsiveness.getSize(
                          onWeb: AppSizes.font48,
                          onMobile: AppSizes.font24,
                          onTablet: AppSizes.font24,
                        ),
                        fontWeight: AppStyles.w700,
                        color: AppTheme.primaryText(context),
                      ),
                    ),
                    Text(
                      AppStrings.skillStrengthDescription,
                      textAlign: TextAlign.center,
                      style: AppStyles.secondaryStyle(
                        context: context,
                        fontSize: AppResponsiveness.getSize(
                          onWeb: AppSizes.font24,
                          onMobile: AppSizes.font18,
                          onTablet: AppSizes.font18,
                        ),
                        color: AppTheme.blackText(context),
                      ),
                    ),
                  ],
                ),
              ),
              SpaceH40(),
              SkillCard(
                assetPath: AppAssets.draws,
                title: AppStrings.skillOneTitle,
                description: AppStrings.skillOneDescription,
                bullets: [
                  AppStrings.skillBulletOne,
                  AppStrings.skillBulletOne,
                  AppStrings.skillBulletOne,
                ],
              ),
              SpaceH40(),
              SkillCard(
                assetPath: AppAssets.abacus,
                title: AppStrings.skillOneTitle,
                description: AppStrings.skillOneDescription,
                bullets: [
                  AppStrings.skillBulletOne,
                  AppStrings.skillBulletOne,
                  AppStrings.skillBulletOne,
                ],
              ),
              SpaceH40(),
              SkillCard(
                assetPath: AppAssets.mobiles,
                title: AppStrings.skillOneTitle,
                description: AppStrings.skillOneDescription,
                bullets: [
                  AppStrings.skillBulletOne,
                  AppStrings.skillBulletOne,
                  AppStrings.skillBulletOne,
                ],
              ),
              SpaceH80(),
              Container(
                key: controller.contactSection,
                width: AppResponsiveness.setWidth(context),
                decoration: BoxDecoration(color: AppTheme.primary(context)),
                child: Center(
                  child: SizedBox(
                    width: AppResponsiveness.setWidth(context, width: 1),
                    child: Column(
                      children: [
                        SpaceH40(),
                        SizedBox(
                          width: AppResponsiveness.setWidth(context, width: .8),
                          child: Column(
                            spacing: 20,
                            children: [
                              Text(
                                AppStrings.thankyouForExploringProfile,
                                maxLines: 3,
                                textAlign: TextAlign.center,
                                style: AppStyles.primaryStyle(
                                  context: context,
                                  fontSize: AppResponsiveness.getSize(
                                    onWeb: AppSizes.font40,
                                    onMobile: AppSizes.font28,
                                    onTablet: AppSizes.font28,
                                  ),
                                  fontWeight: AppStyles.w700,
                                  color: AppTheme.whiteText(context),
                                ),
                              ),
                              Text(
                                AppStrings.thankyouForExploringProfileDetail,
                                textAlign: TextAlign.center,
                                style: AppStyles.secondaryStyle(
                                  context: context,
                                  fontSize: AppResponsiveness.getSize(
                                    onWeb: AppSizes.font24,
                                    onMobile: AppSizes.font18,
                                    onTablet: AppSizes.font18,
                                  ),
                                  color: AppTheme.whiteText(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SpaceH40(),
                        SizedBox(
                          width: AppResponsiveness.setWidth(context, width: .8),
                          child: Column(
                            spacing: AppSizes.padding20,
                            children: [RightBubble(), LeftBubble()],
                          ),
                        ),
                        SpaceH40(),
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: AppSizes.margin32,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(),
                              Flexible(
                                child: SocialIcon(
                                  width: AppSizes.width40,
                                  height: AppSizes.height32,
                                  assetPath: AppAssets.email,
                                  text: AppStrings.email,
                                  color: AppColors.whiteText,
                                  onTap: () {
                                    controller.openEmail();
                                  },
                                ),
                              ),
                              Flexible(
                                child: SocialIcon(
                                  assetPath: AppAssets.facebook,
                                  text: AppStrings.facebook,
                                  color: AppColors.whiteText,
                                  onTap: () {
                                    controller.openUrl(
                                      AppConstants.facebookUrl,
                                    );
                                  },
                                ),
                              ),
                              Flexible(
                                child: SocialIcon(
                                  assetPath: AppAssets.instagram,
                                  text: AppStrings.instagram,
                                  onTap: () {
                                    controller.openUrl(
                                      AppConstants.instagramUrl,
                                    );
                                  },
                                  color: AppColors.whiteText,
                                ),
                              ),
                              Flexible(
                                child: SocialIcon(
                                  assetPath: AppAssets.linkedIn,
                                  text: AppStrings.linkedin,
                                  onTap: () {
                                    controller.openUrl(
                                      AppConstants.linkedInUrl,
                                    );
                                  },
                                  color: AppColors.whiteText,
                                ),
                              ),
                              SizedBox(),
                            ],
                          ),
                        ),
                        SpaceH20(),
                        SizedBox(
                          width: AppResponsiveness.setWidth(context, width: .8),
                          child: Text(
                            AppStrings.endNote,
                            textAlign: TextAlign.center,
                            style: AppStyles.secondaryStyle(
                              context: context,
                              fontSize: AppResponsiveness.getSize(
                                onWeb: AppSizes.font18,
                                onMobile: AppSizes.font16,
                                onTablet: AppSizes.font16,
                              ),
                              color: AppColors.whiteText,
                            ),
                          ),
                        ),
                        SpaceH100(),
                      ],
                    ),
                  ),
                ),
              ),
              ///// giving proper credit.
              Row(
                mainAxisAlignment: AppResponsiveness.getDynamic(
                  onWeb: MainAxisAlignment.center,
                  onMobile: MainAxisAlignment.start,
                ),
                children: [
                  Column(
                    crossAxisAlignment: AppResponsiveness.getDynamic(
                      onWeb: CrossAxisAlignment.center,
                      onMobile: CrossAxisAlignment.start,
                    ),
                    children: [
                      /// If you use this code in your own project, please consider giving proper credit.
                      /// A small mention goes a long way. Thank you!
                      TextButton(
                        onPressed: () async {
                          final Uri uri = Uri.parse(
                            "https://touqeerulhussnain.com/",
                          );

                          if (await canLaunchUrl(uri)) {
                            await launchUrl(
                              uri,
                              mode: LaunchMode.externalApplication,
                            );
                          } else {}
                        },
                        child: Text(
                          "All design  rights are reserved by  Touqeer ul Hussnain",
                          style: AppStyles.secondaryStyle(
                            context: context,
                            color: AppTheme.blackText(context),
                            fontSize: AppSizes.font12,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          /// If you use this code in your own project, please consider
                          /// giving proper credit.
                          /// A small mention goes a long way. Thank you!
                          final Uri uri = Uri.parse(
                            "https://touqeerulhussnain.com/",
                          );

                          if (await canLaunchUrl(uri)) {
                            await launchUrl(
                              uri,
                              mode: LaunchMode.externalApplication,
                            );
                          } else {}
                        },
                        child: Text(
                          "Built in Flutter  by Touqeer ul Hussnain",
                          style: AppStyles.secondaryStyle(
                            context: context,
                            color: AppTheme.blackText(context),
                            fontSize: AppSizes.font12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
