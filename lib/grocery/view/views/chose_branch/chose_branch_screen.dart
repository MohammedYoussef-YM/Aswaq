import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/provider/branch_provider.dart';
import 'package:flutter_ui_kit/grocery/utility/colorResources.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/grocery/view/views/chose_branch/widget/branch_widget.dart';
import 'package:flutter_ui_kit/grocery/view/views/home/widgets/search_widget.dart';
import 'package:provider/provider.dart';

class ChooseBranchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<BranchProvider>(context,listen: false).initializeBranch();

    return Scaffold(
      backgroundColor: ColorResources.COLOR_WHITE,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: ColorResources.COLOR_GRAY,size: 20,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text(Strings.choose_branch,style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE),),
      ),
      body: Container(
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
        child: Column(
          children: [
            SearchWidget(hintText: Strings.type_what_you_want,),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE,),
            Expanded(
              child: ListView.builder(
                  itemCount: Provider.of<BranchProvider>(context).getAllBranch.length,
                  itemBuilder: (context,index)=>ChooseBranchWidget(index: index,branchModel: Provider.of<BranchProvider>(context).getAllBranch[index],)),
            ),
          ],
        ),
      ),
    );
  }
}
