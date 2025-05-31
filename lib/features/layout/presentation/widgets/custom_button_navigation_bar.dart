
import 'package:flutter/material.dart';
import 'package:remindus/assets_manager.dart';
import 'package:remindus/core/functions/helper.dart';
import 'package:remindus/core/resources/color_manager.dart';
import 'package:remindus/core/resources/style_manager.dart';
import 'package:remindus/core/resources/values_manager.dart';
import 'package:remindus/l10n/app_localizations.dart';




class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });

  final int currentIndex;
  final Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:Theme.of(context).bottomAppBarTheme.color?.withOpacity(0.5),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: BottomNavigationBar(
        elevation: 0,
        // backgroundColor: ColorManager.darkText.withOpacity(0.1),
        items: [
          BottomNavigationBarItem(
            icon: buildIcon(Assets.homeSvg, 0, currentIndex),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: buildIcon(Assets.eventsSvg, 1, currentIndex),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: buildIcon(Assets.categoriesSvg, 2, currentIndex),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: buildIcon(Assets.categoriesSvg, 3, currentIndex),
            label: AppLocalizations.of(context)!.home,
          ),
        ],
        selectedFontSize: AppSize.s10,
        selectedLabelStyle: getSemiBoldStyle(color: ColorManager.accent),
        unselectedLabelStyle: getSemiBoldStyle(color: ColorManager.primary),
        currentIndex: currentIndex,
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorManager.primary,
      ),
    );
  }
}
