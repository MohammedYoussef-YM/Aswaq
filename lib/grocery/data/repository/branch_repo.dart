import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/data/models/branch_model.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';

class BranchRepo {
  List<BranchModel> getAllBranch = [
    BranchModel(
        branchIcon: Icons.card_travel,
        name: Strings.costco_branch,
        address: Strings.address_one,
        distance: Strings.distance_12_km,
        price: Strings.doller_9),
    BranchModel(
        branchIcon: Icons.card_travel,
        name: Strings.burey_branch,
        address: Strings.address_two,
        distance: Strings.distance_32_km,
        price: Strings.doller_9),
    BranchModel(
        branchIcon: Icons.card_travel,
        name: Strings.muscow_branch,
        address: Strings.address_three,
        distance: Strings.distance_54_km,
        price: Strings.doller_9),
  ];
}
