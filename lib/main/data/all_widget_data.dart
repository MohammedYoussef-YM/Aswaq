import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/model/app_model.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/Icon/icon.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/align/align.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/beforeafter/before_after.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/card/card.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/chip/chip_widget.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/cliprreact/clip_r_react.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/column/column_widget.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/container/container_widget.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/customscrollview/custom_scroll_view.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/dialog/dialog.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/dismissible/dismissible.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/divider/divider.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/drawer/drawer.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/expanded/expanded.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/expansionpanel/expansion_panel.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/firebase/insert_data.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/floatingaction/floating_action_button.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/foldingcell/list_folded.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/form/form_widget.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/gesture/gesture_detector.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/gridview/gridview.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/hero/hero_widget.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/image/image.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/liquidswipe/liquid_swipe.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/listtile/list_tile.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/listview/listview.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/map/map.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/marquee/marquee_widget.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/motion/motion_animation.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/navigation/bottom_navigation.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/padding/padding.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/popupmenu/pop_up_menu.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/positioned/positioned.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/progressindicator/progress_indicator.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/refresh/refresh_indicator.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/row/row_widget.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/shadermask/shader_mask.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/shimmer/custom_shimmer.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/showcase/show_case.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/signeture/signeture.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/snackbar/snackbar_widget.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/stack/stack_widget.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/stepper/custom_stepper_widget.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/tabbar/tabbar_widget.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/tinder/tinder_widget.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/wave/wave_widget.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/wheelscrollview/wheel_scroll.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/notification/local_notification_screen.dart';

class AllWidgetData {

  static List<WidgetsModel> getAllWidgetList() {
    return [
      WidgetsModel(
          widgetName: 'Motion',
          icon: Icons.auto_awesome_motion,
          iconColor: Color(0xff05856C),
          widgetData: TransitionsPage()
      ),
      WidgetsModel(
          widgetName: 'LiquidSwipe',
          icon: Icons.swipe,
          iconColor: Colors.pink,
          widgetData: LiquidSwipeWidget()
      ),
      WidgetsModel(
          widgetName: 'TinderCard',
          icon: Icons.format_indent_decrease_rounded,
          iconColor: Color(0xffEF09C9),
          widgetData: TinderCardWidget()
      ),
      WidgetsModel(
        widgetName: 'Firebase',
        icon: Icons.local_fire_department_outlined,
        iconColor: Colors.blue,
        widgetData: NewFirebaseInsert(),
      ),
      WidgetsModel(
        widgetName: 'Local Notification',
        icon: Icons.notifications,
        iconColor: Colors.orange,
        widgetData: LocalNotificationScreen(),
      ),
      WidgetsModel(
        widgetName: 'Progress Indicator',
        icon: Icons.refresh_outlined,
        iconColor: Color(0xff15A6A9),
        widgetData: ProgressBarIndicator(),
      ),
      WidgetsModel(
        widgetName: 'Wave',
        icon: Icons.waves,
        iconColor: Color(0xff2582C3),
        widgetData: WaveWidgetScreen(),
      ),
      WidgetsModel(
        widgetName: 'Form Field',
        icon: Icons.wysiwyg_outlined,
        iconColor: Color(0xff0E7995),
        widgetData: FormFieldWidget(),
      ),
      WidgetsModel(
          widgetName: 'Stepper',
          icon: Icons.local_convenience_store_outlined,
          iconColor: Color(0xffF51CE8),
          widgetData: CustomStepper()
      ),
      WidgetsModel(
          widgetName: 'Shimmer',
          icon: Icons.shield,
          iconColor: Colors.purpleAccent,
          widgetData: TestShimmerList()
      ),
      WidgetsModel(
          widgetName: 'Folding Cell',
          icon: Icons.folder_shared_outlined,
          iconColor: Color(0xffEA3219),
          widgetData: FoldingCellListViewDemo()
      ),
      WidgetsModel(
          widgetName: 'Marquee',
          icon: Icons.drive_file_move_outline,
          iconColor: Color(0xff3FC814),
          widgetData: MarqueeTextWidget()
      ),
      WidgetsModel(
          widgetName: 'Before After',
          icon: Icons.broken_image_outlined,
          iconColor: Color(0xff969B05),
          widgetData: BeforeAfterWidget()
      ),
      WidgetsModel(
          widgetName: 'ShowCase',
          icon: Icons.show_chart,
          iconColor: Colors.indigo,
          widgetData: ShowCase()
      ),
      WidgetsModel(
          widgetName: 'Map',
          icon: Icons.map,
          iconColor: Colors.lightGreen,
          widgetData: GoogleMapWidget()
      ),
      WidgetsModel(
          widgetName: 'WheelScroll',
          icon: Icons.score_rounded,
          iconColor: Colors.deepOrangeAccent,
          widgetData: WheelScrollView()
      ),
      WidgetsModel(
        widgetName: 'Navigation',
        icon: Icons.tablet_mac_outlined,
        iconColor: Color(0xff0D9983),
        widgetData: NavigationBar(),
      ),
      WidgetsModel(
          widgetName: 'Dismissible',
          icon: Icons.design_services_sharp,
          iconColor: Color(0xffF461BE),
          widgetData: DismissWidget()
      ),
      WidgetsModel(
          widgetName: 'PopUpMenu',
          icon: Icons.workspaces_outline,
          iconColor: Color(0xffC5CD10),
          widgetData: PopUpMenuBar()
      ),
      WidgetsModel(
          widgetName: 'ExpansionPanel',
          icon: Icons.expand,
          iconColor: Color(0xffDC0FA1),
          widgetData: ExpansionPanelWidget()
      ),
      WidgetsModel(
        widgetName: 'SnackBar',
        icon: Icons.border_style_sharp,
        iconColor: Color(0xff12D33B),
        widgetData: SnackBarWidget(),
      ),
      WidgetsModel(
        widgetName: 'TabBar',
        icon: Icons.table_chart,
        iconColor: Color(0xff2582C3),
        widgetData: TabBarWidget(),
      ),
      WidgetsModel(
          widgetName: 'Signature',
          icon: Icons.post_add_sharp,
          iconColor: Colors.amberAccent,
          widgetData: SignaturePad()
      ),
      WidgetsModel(
          widgetName: 'Refresh',
          icon: Icons.refresh_outlined,
          iconColor: Colors.lightGreen,
          widgetData: RefreshIndicators()
      ),
      WidgetsModel(
          widgetName: 'CustomScrollView',
          icon: Icons.center_focus_weak,
          iconColor: Color(0xffB919F9),
          widgetData: CustomScrollViewWidget()
      ),
      WidgetsModel(
        widgetName: 'Expanded',
        icon: Icons.compare_arrows_outlined,
        iconColor: Color(0xff0C7D73),
        widgetData: ExpandedWidget(),
      ),
      WidgetsModel(
        widgetName: 'Drawer',
        icon: Icons.menu,
        iconColor: Color(0xff8A14D2),
        widgetData: DrawerWidget(),
      ),
      WidgetsModel(
        widgetName: 'Dialog',
        icon: Icons.calendar_today_outlined,
        iconColor: Color(0xffF83D3A),
        widgetData: DialogWidget(),
      ),
      WidgetsModel(
        widgetName: 'Gesture Detector',
        icon: Icons.person_pin_outlined,
        iconColor: Color(0xff00B911),
        widgetData: GestureDetectorWidget(),
      ),
      WidgetsModel(
        widgetName: 'Hero Animation',
        icon: Icons.sports_baseball_outlined,
        iconColor: Color(0xff202020),
        widgetData: HeroWidget(),
      ),
      WidgetsModel(
          widgetName: 'ListTile',
          icon: Icons.featured_play_list_outlined,
          iconColor: Colors.blue,
          widgetData: ListTileWidgetButton()
      ),
      WidgetsModel(
          widgetName: 'FloatingButton',
          icon: Icons.radio_button_checked,
          iconColor: Colors.indigo,
          widgetData: FloatingActionButtons()
      ),
      WidgetsModel(
        widgetName: 'GridView',
        icon: Icons.grid_view,
        iconColor: Color(0xffF52FB6),
        widgetData: GridViewWidget(),
      ),
      WidgetsModel(
        widgetName: 'ListView',
        icon: Icons.list,
        iconColor: Color(0xff969B05),
        widgetData: ListViewWidget(),
      ),
      WidgetsModel(
        widgetName: 'Image',
        icon: Icons.image,
        iconColor: Color(0xff2F2FF5),
        widgetData: ImageViewWidget(),
      ),
      WidgetsModel(
        widgetName: 'Container',
        icon: Icons.check_box_outline_blank_outlined,
        iconColor: Color(0xffF6B566),
        widgetData: ContainerWidget(),
      ),
      WidgetsModel(
        widgetName: 'Icon',
        icon: Icons.android_outlined,
        iconColor: Color(0xff42F83F),
        widgetData: IconWidget(),
      ),
      WidgetsModel(
        widgetName: 'ClipRReact',
          icon: Icons.repeat_one_outlined,
          iconColor: Color(0xffBF107F),
        widgetData: ClipRReactWidget()
      ),
      WidgetsModel(
        widgetName: 'Chip Widget',
          icon: Icons.label_important,
          iconColor: Color(0xffF44646),
        widgetData: ChipWidget()
      ),

      WidgetsModel(
        widgetName: 'Column',
        icon: Icons.view_agenda_rounded,
        iconColor: Color(0xffCBB722),
        widgetData: ColumnWidget(),
      ),
      WidgetsModel(
        widgetName: 'Card',
        icon: Icons.add_box,
        iconColor: Color(0xffA3BB0C),
        widgetData: CardViewWidget(),
      ),
      WidgetsModel(
        widgetName: 'Divider',
        icon: Icons.drag_handle_sharp,
        iconColor: Color(0xff171717),
        widgetData: DividerWidget(),
      ),
      WidgetsModel(
        widgetName: 'Positioned',
        icon: Icons.photo_size_select_small_outlined,
        iconColor: Color(0xff2582C3),
        widgetData: PositionedWidget(),
      ),
      WidgetsModel(
        widgetName: 'Stack',
        icon: Icons.table_view_sharp,
        iconColor: Color(0xffC0CB06),
        widgetData: StackWidget(),
      ),
      WidgetsModel(
          widgetName: 'ShaderMasks',
          icon: Icons.wb_shade,
          iconColor: Colors.indigo,
          widgetData: ShaderMaskWidget()
      ),
      WidgetsModel(
        widgetName: 'Row',
        icon: Icons.view_array_rounded,
        iconColor: Color(0xff1AC9BE),
        widgetData: RowWidget(),
      ),
      WidgetsModel(
          widgetName: 'Align',
          icon: Icons.format_align_center,
          iconColor: Color(0xff2582C3),
          widgetData: AlignWidget()
      ),
      WidgetsModel(
        widgetName: 'Padding',
        icon: Icons.padding,
        iconColor: Color(0xff66F69D),
        widgetData: PaddingWidget(),
      ),

    ];
  }
}