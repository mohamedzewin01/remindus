import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remindus/core/resources/app_constants.dart';
import 'package:remindus/core/resources/color_manager.dart';
import 'package:remindus/core/resources/routes_manager.dart';
import 'package:remindus/features/AddEvent/presentation/pages/AddEvent_page.dart';
import 'package:remindus/features/layout/presentation/cubit/layout_cubit.dart';
import 'custom_button_navigation_bar.dart';

class LayoutMobileView extends StatelessWidget {
  const LayoutMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: ColorManager.primary,
            mini: true,
elevation: 0,
            child: Icon(Icons.add, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, RoutesManager.addEventPage);
            },
          ),
          bottomNavigationBar: AnimatedBottomNavigationBar(
            icons: [Icons.home, Icons.event, Icons.category, Icons.settings],
            height: 55,
            activeIndex: cubit.index,
            gapLocation: GapLocation.center,
            backgroundColor: Colors.white,
            activeColor: ColorManager.accent,
            inactiveColor: Colors.grey,
            notchSmoothness: NotchSmoothness.softEdge,
            onTap: (index) {
              cubit.changeIndex(index);
            },

            elevation: 0,
            //other params
          ),

          body: AppConstants.viewOptions[cubit.index],
        );
      },
    );
  }
}
