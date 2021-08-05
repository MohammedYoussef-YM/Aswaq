import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/color_resources.dart';

void showCustomSnackBar(String message, BuildContext context, {bool isError = true}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: isError ? RestaurantDeliveryBoyColorResources.COLOR_GREY : Colors.green,
    content: Text(message),
  ));
}
