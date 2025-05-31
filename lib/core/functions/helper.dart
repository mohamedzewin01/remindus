import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import '../resources/color_manager.dart';
import '../resources/values_manager.dart';


Widget buildIcon(String assetPath, int index, int currentIndex) {
  bool isSelected = index == currentIndex;

  return Container(
    padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p20, vertical: AppPadding.p4),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
    ),
    child: SvgPicture.asset(
      assetPath,
      width: 16,
      height: 16,
      colorFilter: ColorFilter.mode(
        isSelected ? ColorManager.primaryDark : ColorManager.primaryLight,
        BlendMode.srcIn,
      ),
    ),
  );
}

String? validatePassword({
  required String password,
  required String message,
  required String messageLength,
  required String messageInvalid,
}) {
  final RegExp passwordRegExp =
      RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{8,}$');
  if (password.trim().isEmpty) {
    return message;
  } else if (password.length < 8) {
    return messageLength;
  } else if (!passwordRegExp.hasMatch(password)) {
    return messageInvalid;
  }
  return null;
}

String? validateString({
  required String value,
  required String message,
  required String messageLength,
  required String messageInvalid,
}) {
  final RegExp valueRegExp = RegExp(r'^[A-Za-z]+$');
  if (value.trim().isEmpty) {
    return message;
  } else if (value.length < 3) {
    return messageLength;
  } else if (!valueRegExp.hasMatch(value)) {
    return messageInvalid;
  }
  return null;
}
