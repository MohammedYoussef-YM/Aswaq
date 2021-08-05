
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/category_model.dart';
import 'package:flutter_ui_kit/restaurant/provider/category_provider.dart';
import 'package:flutter_ui_kit/restaurant/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant/utill/styles.dart';
import 'package:flutter_ui_kit/restaurant/view/base/no_data_screen.dart';
import 'package:flutter_ui_kit/restaurant/view/base/product_shimmer.dart';
import 'package:flutter_ui_kit/restaurant/view/base/product_widget.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  final CategoryModel categoryModel;
  CategoryScreen({@required this.categoryModel});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> with TickerProviderStateMixin {
  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();
    Provider.of<RestCategoryProvider>(context, listen: false).getSubCategoryList(context, widget.categoryModel.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<RestCategoryProvider>(
        builder: (context, category, child) {
          return category.subCategoryList != null ? CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [

              SliverAppBar(
                expandedHeight: 200,
                toolbarHeight: 50 + MediaQuery.of(context).padding.top,
                pinned: true,
                floating: false,
                backgroundColor: ColorResources.COLOR_PRIMARY,
                leading: IconButton(icon: Icon(Icons.chevron_left, color: ColorResources.COLOR_WHITE), onPressed: () => Navigator.pop(context)),
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(widget.categoryModel.name, style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE, color: ColorResources.COLOR_WHITE)),
                  titlePadding: EdgeInsets.only(bottom: 54 + (MediaQuery.of(context).padding.top/2), left: 50),
                  background: Container(
                    margin: EdgeInsets.only(bottom: 50),
                    child: Image.asset(
                      widget.categoryModel.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(30.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: ColorResources.COLOR_WHITE,
                    child: TabBar(
                      controller: TabController(initialIndex: _tabIndex, length: category.subCategoryList.length+1, vsync: this),
                      isScrollable: true,
                      unselectedLabelColor: ColorResources.COLOR_GREY,
                      indicatorWeight: 3,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: ColorResources.COLOR_PRIMARY,
                      labelColor: ColorResources.COLOR_BLACK,
                      tabs: _tabs(category),
                      onTap: (int index) {
                        _tabIndex = index;
                        if(index == 0) {
                          category.getCategoryProductList(context, widget.categoryModel.id.toString());
                        }else {
                          category.getCategoryProductList(context, category.subCategoryList[index-1].id.toString());
                        }
                      },
                    ),
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: category.categoryProductList != null ? category.categoryProductList.length > 0 ? ListView.builder(
                  itemCount: category.categoryProductList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                  itemBuilder: (context, index) {
                    return ProductWidget(product: category.categoryProductList[index]);
                  },
                ) : NoDataScreen() : ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                  itemBuilder: (context, index) {
                    return ProductShimmer(isEnabled: category.categoryProductList == null);
                  },
                ),
              ),

            ],
          ) : Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)));
        },
      ),
    );
  }

  List<Tab> _tabs(RestCategoryProvider category) {
    List<Tab> tabList = [];
    tabList.add(Tab(text: 'All'));
    category.subCategoryList.forEach((subCategory) => tabList.add(Tab(text: subCategory.name)));
    return tabList;
  }
}
