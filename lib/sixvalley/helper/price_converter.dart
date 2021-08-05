import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/provider/splash_provider.dart';
import 'package:provider/provider.dart';

class PriceConverter {
  static String convertPrice(BuildContext context, double price, {String discount, String discountType}) {
    if(discount != null && discountType != null){
      if(discountType == 'amount') {
        price = price - double.parse(discount);
      }else if(discountType == 'percent') {
        price = price - ((double.parse(discount) / 100) * price);
      }
    }
    return '${Provider.of<SixSplashProvider>(context, listen: false).currency.symbol}${(price *
        double.parse(Provider.of<SixSplashProvider>(context, listen: false).currency.exchangeRate)).toStringAsFixed(2)
        .replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}';
  }

  static double convertWithDiscount(BuildContext context, double price, String discount, String discountType) {
    if(discountType == 'amount') {
      price = price - double.parse(discount);
    }else if(discountType == 'percent') {
      price = price - ((double.parse(discount) / 100) * price);
    }
    return price;
  }

  static double calculation(double amount, double discount, String type, int quantity) {
    double calculatedAmount = 0;
    if(type == 'amount') {
      calculatedAmount = discount * quantity;
    }else if(type == 'percent') {
      calculatedAmount = (discount / 100) * (amount * quantity);
    }
    return calculatedAmount;
  }

  static String percentageCalculation(BuildContext context, String price, String discount, String discountType) {
    //return discountType == 'percent' ? double.parse(discount).toStringAsFixed(2) : ((100 / double.parse(price)) * double.parse(discount)).toStringAsFixed(2);

    return '$discount${discountType == 'percent' ? '%' : Provider.of<SixSplashProvider>(context, listen: false).currency.symbol} OFF';
  }
}