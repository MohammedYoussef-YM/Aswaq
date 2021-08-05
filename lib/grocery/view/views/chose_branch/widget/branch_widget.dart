import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/data/models/branch_model.dart';
import 'package:flutter_ui_kit/grocery/provider/branch_provider.dart';
import 'package:flutter_ui_kit/grocery/utility/colorResources.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:provider/provider.dart';

class ChooseBranchWidget extends StatelessWidget {
  final int index;
  final BranchModel branchModel;

  ChooseBranchWidget({this.index, this.branchModel});

  @override
  Widget build(BuildContext context) {
    return Consumer<BranchProvider>(
      builder: (context, branchProvider, child) => InkWell(
        onTap: () {
          branchProvider.changeSelectBranchIndex(index);
        },
        child: Container(
          margin: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_DEFAULT),
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: branchProvider.selectBranchIndex == index ? ColorResources.COLOR_PRIMARY : null,
              border: Border.all(color: ColorResources.COLOR_GRAY.withOpacity(.2))),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: ColorResources.COLOR_PANACHE,
                        radius: 15,
                        child: Icon(
                          branchModel.branchIcon,
                          size: 15,
                          color: ColorResources.COLOR_GRAY,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        branchModel.name,
                        style: poppinsRegular.copyWith(
                            color: branchProvider.selectBranchIndex == index ? ColorResources.COLOR_WHITE : ColorResources.COLOR_BLACK),
                      )
                    ],
                  ),
                  Text(
                    branchModel.distance,
                    style: poppinsRegular.copyWith(
                        color: branchProvider.selectBranchIndex == index ? ColorResources.COLOR_WHITE : ColorResources.COLOR_BLACK),
                  )
                ],
              ),
              FittedBox(
                child: Row(
                  children: [
                    SizedBox(width: 40),
                    Text(branchModel.address,
                        style: poppinsRegular.copyWith(
                            color: branchProvider.selectBranchIndex == index ? ColorResources.COLOR_WHITE : ColorResources.COLOR_DIM_GRAY,
                            fontSize: 14))
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(branchModel.price,
                      style: poppinsRegular.copyWith(
                          color: branchProvider.selectBranchIndex == index ? ColorResources.COLOR_WHITE : ColorResources.COLOR_PRIMARY))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
