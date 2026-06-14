import 'package:apppp/core/constant/app_color.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static const logo = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w900,
    color: AppColor.orange,
  );

  static const title = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: AppColor.white,
  );

  static const productTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColor.white,
  );

  static const description = TextStyle(
    fontSize: 14,
    color: AppColor.grey,
  );

  static const price = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColor.orange,
  );
}