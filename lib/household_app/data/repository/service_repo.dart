import 'package:flutter_ui_kit/household_app/data/models/faq_model.dart';
import 'package:flutter_ui_kit/household_app/data/models/review_model.dart';
import 'package:flutter_ui_kit/household_app/data/models/service_model.dart';
import 'package:flutter_ui_kit/household_app/utility/images.dart';
import 'package:flutter_ui_kit/household_app/utility/strings.dart';

class ServiceRepo {
  List<String> getAllFeature = [
    Strings.genuine_branded_product,
    Strings.on_time_work_completion,
    Strings.well_equipped_prepared_specialist,
    Strings.genuine_branded_product,
    Strings.on_time_work_completion,
    Strings.well_equipped_prepared_specialist,
    Strings.genuine_branded_product,
    Strings.on_time_work_completion,
    Strings.well_equipped_prepared_specialist
  ];

  List<FaqModel> getAllFaq = [
    FaqModel(isExpanded: false, question: Strings.how_is_the_cost_calculated_for_painting, answer: Strings.the_cost_is_calculated_based_on_the),
    FaqModel(isExpanded: false, question: Strings.how_is_the_cost_calculated_for_painting, answer: Strings.the_cost_is_calculated_based_on_the),
    FaqModel(isExpanded: false, question: Strings.how_is_the_cost_calculated_for_painting, answer: Strings.the_cost_is_calculated_based_on_the),
  ];

  List<ReviewModel> getAllReview = [
    ReviewModel(imageUrl: Images.person_1, name: Strings.mehedi_hasan, ratting: 4, feedback: Strings.awesome_and_super_smooth),
    ReviewModel(imageUrl: Images.person_2, name: Strings.ajoy_paul, ratting: 5, feedback: Strings.typesetting_industry_lorem_impsm),
    ReviewModel(imageUrl: Images.person_3, name: Strings.salah_akbar, ratting: 1, feedback: Strings.lorem_ipsum_lorem_ipsm_is),
    ReviewModel(imageUrl: Images.person_4, name: Strings.banu_shan, ratting: 2, feedback: Strings.awesome_tutorial_learn_a_lot_of),
  ];

  List<ServiceModel> getAllBranch = [
    ServiceModel(title: Strings.painting, imageUrl: Images.svg_painting, serviceSubList: [
      ServiceModel(title: Strings.furniture_color_painting, imageUrl: Images.paint_1, ratting: 5.0, quantity: 1, price: 40),
      ServiceModel(title: Strings.side_wall_color_painting, imageUrl: Images.paint_2, ratting: 4.0, quantity: 1, price: 20),
      ServiceModel(title: Strings.carpentry_services, imageUrl: Images.paint_3, ratting: 3.0, quantity: 1, price: 30),
      ServiceModel(title: Strings.renovation_decor, imageUrl: Images.paint_4, ratting: 5.0, quantity: 1, price: 40),
      ServiceModel(title: Strings.interior_design, imageUrl: Images.paint_5, ratting: 2.0, quantity: 1, price: 70),
      ServiceModel(title: Strings.interior_design_consultancy, imageUrl: Images.paint_6, ratting: 1.0, quantity: 1, price: 80),
    ]),
    ServiceModel(title: Strings.cleaning, imageUrl: Images.svg_abc, serviceSubList: [
      ServiceModel(title: Strings.cleaning_packages, imageUrl: Images.clean_1, ratting: 5.0, quantity: 1, price: 40),
      ServiceModel(title: Strings.home_clening, imageUrl: Images.clean_2, ratting: 4.0, quantity: 1, price: 20),
      ServiceModel(title: Strings.full_home_deep_cleaning, imageUrl: Images.clean_3, ratting: 3.0, quantity: 1, price: 30),
    ]),
    ServiceModel(title: Strings.ac_repair, imageUrl: Images.svg_air, serviceSubList: [
      ServiceModel(title: Strings.furniture_color_painting, imageUrl: Images.paint_1, ratting: 5.0, quantity: 1, price: 40),
      ServiceModel(title: Strings.side_wall_color_painting, imageUrl: Images.paint_2, ratting: 4.0, quantity: 1, price: 20),
      ServiceModel(title: Strings.carpentry_services, imageUrl: Images.paint_3, ratting: 3.0, quantity: 1, price: 30),
      ServiceModel(title: Strings.renovation_decor, imageUrl: Images.paint_4, ratting: 5.0, quantity: 1, price: 40),
      ServiceModel(title: Strings.interior_design, imageUrl: Images.paint_5, ratting: 2.0, quantity: 1, price: 70),
      ServiceModel(title: Strings.interior_design_consultancy, imageUrl: Images.paint_6, ratting: 1.0, quantity: 1, price: 80),
    ]),
    ServiceModel(title: Strings.electricity, imageUrl: Images.svg_electric, serviceSubList: [
      ServiceModel(title: Strings.furniture_color_painting, imageUrl: Images.paint_1, ratting: 5.0, quantity: 1, price: 40),
      ServiceModel(title: Strings.side_wall_color_painting, imageUrl: Images.paint_2, ratting: 4.0, quantity: 1, price: 20),
      ServiceModel(title: Strings.carpentry_services, imageUrl: Images.paint_3, ratting: 3.0, quantity: 1, price: 30),
      ServiceModel(title: Strings.renovation_decor, imageUrl: Images.paint_4, ratting: 5.0, quantity: 1, price: 40),
      ServiceModel(title: Strings.interior_design, imageUrl: Images.paint_5, ratting: 2.0, quantity: 1, price: 70),
      ServiceModel(title: Strings.interior_design_consultancy, imageUrl: Images.paint_6, ratting: 1.0, quantity: 1, price: 80),
    ]),
    ServiceModel(title: Strings.gas, imageUrl: Images.svg_gas, serviceSubList: [
      ServiceModel(title: Strings.furniture_color_painting, imageUrl: Images.paint_1, ratting: 5.0, quantity: 1, price: 40),
      ServiceModel(title: Strings.side_wall_color_painting, imageUrl: Images.paint_2, ratting: 4.0, quantity: 1, price: 20),
      ServiceModel(title: Strings.carpentry_services, imageUrl: Images.paint_3, ratting: 3.0, quantity: 1, price: 30),
      ServiceModel(title: Strings.renovation_decor, imageUrl: Images.paint_4, ratting: 5.0, quantity: 1, price: 40),
      ServiceModel(title: Strings.interior_design, imageUrl: Images.paint_5, ratting: 2.0, quantity: 1, price: 70),
      ServiceModel(title: Strings.interior_design_consultancy, imageUrl: Images.paint_6, ratting: 1.0, quantity: 1, price: 80),
    ]),
    ServiceModel(title: Strings.wifi, imageUrl: Images.svg_wifi, serviceSubList: [
      ServiceModel(title: Strings.furniture_color_painting, imageUrl: Images.paint_1, ratting: 5.0, quantity: 1, price: 40),
      ServiceModel(title: Strings.side_wall_color_painting, imageUrl: Images.paint_2, ratting: 4.0, quantity: 1, price: 20),
      ServiceModel(title: Strings.carpentry_services, imageUrl: Images.paint_3, ratting: 3.0, quantity: 1, price: 30),
      ServiceModel(title: Strings.renovation_decor, imageUrl: Images.paint_4, ratting: 5.0, quantity: 1, price: 40),
      ServiceModel(title: Strings.interior_design, imageUrl: Images.paint_5, ratting: 2.0, quantity: 1, price: 70),
      ServiceModel(title: Strings.interior_design_consultancy, imageUrl: Images.paint_6, ratting: 1.0, quantity: 1, price: 80),
    ]),
    ServiceModel(title: Strings.painting, imageUrl: Images.svg_painting, serviceSubList: [
      ServiceModel(title: Strings.furniture_color_painting, imageUrl: Images.paint_1, ratting: 5.0, quantity: 1, price: 40),
      ServiceModel(title: Strings.side_wall_color_painting, imageUrl: Images.paint_2, ratting: 4.0, quantity: 1, price: 20),
      ServiceModel(title: Strings.carpentry_services, imageUrl: Images.paint_3, ratting: 3.0, quantity: 1, price: 30),
      ServiceModel(title: Strings.renovation_decor, imageUrl: Images.paint_4, ratting: 5.0, quantity: 1, price: 40),
      ServiceModel(title: Strings.interior_design, imageUrl: Images.paint_5, ratting: 2.0, quantity: 1, price: 70),
      ServiceModel(title: Strings.interior_design_consultancy, imageUrl: Images.paint_6, ratting: 1.0, quantity: 1, price: 80),
    ]),
    ServiceModel(title: Strings.cleaning, imageUrl: Images.svg_abc, serviceSubList: [
      ServiceModel(title: Strings.cleaning_packages, imageUrl: Images.clean_1, ratting: 5.0, quantity: 1, price: 40),
      ServiceModel(title: Strings.home_clening, imageUrl: Images.clean_2, ratting: 4.0, quantity: 1, price: 20),
      ServiceModel(title: Strings.full_home_deep_cleaning, imageUrl: Images.clean_3, ratting: 3.0, quantity: 1, price: 30),
    ]),
    ServiceModel(title: Strings.ac_repair, imageUrl: Images.svg_air, serviceSubList: [
      ServiceModel(title: Strings.furniture_color_painting, imageUrl: Images.paint_1, ratting: 5.0, quantity: 1, price: 40),
      ServiceModel(title: Strings.side_wall_color_painting, imageUrl: Images.paint_2, ratting: 4.0, quantity: 1, price: 20),
      ServiceModel(title: Strings.carpentry_services, imageUrl: Images.paint_3, ratting: 3.0, quantity: 1, price: 30),
      ServiceModel(title: Strings.renovation_decor, imageUrl: Images.paint_4, ratting: 5.0, quantity: 1, price: 40),
      ServiceModel(title: Strings.interior_design, imageUrl: Images.paint_5, ratting: 2.0, quantity: 1, price: 70),
      ServiceModel(title: Strings.interior_design_consultancy, imageUrl: Images.paint_6, ratting: 1.0, quantity: 1, price: 80),
    ]),
    ServiceModel(title: Strings.electricity, imageUrl: Images.svg_electric, serviceSubList: [
      ServiceModel(title: Strings.furniture_color_painting, imageUrl: Images.paint_1, ratting: 5.0, quantity: 1, price: 40),
      ServiceModel(title: Strings.side_wall_color_painting, imageUrl: Images.paint_2, ratting: 4.0, quantity: 1, price: 20),
      ServiceModel(title: Strings.carpentry_services, imageUrl: Images.paint_3, ratting: 3.0, quantity: 1, price: 30),
      ServiceModel(title: Strings.renovation_decor, imageUrl: Images.paint_4, ratting: 5.0, quantity: 1, price: 40),
      ServiceModel(title: Strings.interior_design, imageUrl: Images.paint_5, ratting: 2.0, quantity: 1, price: 70),
      ServiceModel(title: Strings.interior_design_consultancy, imageUrl: Images.paint_6, ratting: 1.0, quantity: 1, price: 80),
    ]),
    ServiceModel(title: Strings.gas, imageUrl: Images.svg_gas, serviceSubList: [
      ServiceModel(title: Strings.furniture_color_painting, imageUrl: Images.paint_1, ratting: 5.0, quantity: 1, price: 40),
      ServiceModel(title: Strings.side_wall_color_painting, imageUrl: Images.paint_2, ratting: 4.0, quantity: 1, price: 20),
      ServiceModel(title: Strings.carpentry_services, imageUrl: Images.paint_3, ratting: 3.0, quantity: 1, price: 30),
      ServiceModel(title: Strings.renovation_decor, imageUrl: Images.paint_4, ratting: 5.0, quantity: 1, price: 40),
      ServiceModel(title: Strings.interior_design, imageUrl: Images.paint_5, ratting: 2.0, quantity: 1, price: 70),
      ServiceModel(title: Strings.interior_design_consultancy, imageUrl: Images.paint_6, ratting: 1.0, quantity: 1, price: 80),
    ]),
    ServiceModel(title: Strings.wifi, imageUrl: Images.svg_wifi, serviceSubList: [
      ServiceModel(title: Strings.furniture_color_painting, imageUrl: Images.paint_1, ratting: 5.0, quantity: 1, price: 40),
      ServiceModel(title: Strings.side_wall_color_painting, imageUrl: Images.paint_2, ratting: 4.0, quantity: 1, price: 20),
      ServiceModel(title: Strings.carpentry_services, imageUrl: Images.paint_3, ratting: 3.0, quantity: 1, price: 30),
      ServiceModel(title: Strings.renovation_decor, imageUrl: Images.paint_4, ratting: 5.0, quantity: 1, price: 40),
      ServiceModel(title: Strings.interior_design, imageUrl: Images.paint_5, ratting: 2.0, quantity: 1, price: 70),
      ServiceModel(title: Strings.interior_design_consultancy, imageUrl: Images.paint_6, ratting: 1.0, quantity: 1, price: 80),
    ]),
    ServiceModel(title: Strings.painting, imageUrl: Images.svg_painting, serviceSubList: [
      ServiceModel(title: Strings.furniture_color_painting, imageUrl: Images.paint_1, ratting: 5.0, quantity: 1, price: 40),
      ServiceModel(title: Strings.side_wall_color_painting, imageUrl: Images.paint_2, ratting: 4.0, quantity: 1, price: 20),
      ServiceModel(title: Strings.carpentry_services, imageUrl: Images.paint_3, ratting: 3.0, quantity: 1, price: 30),
      ServiceModel(title: Strings.renovation_decor, imageUrl: Images.paint_4, ratting: 5.0, quantity: 1, price: 40),
      ServiceModel(title: Strings.interior_design, imageUrl: Images.paint_5, ratting: 2.0, quantity: 1, price: 70),
      ServiceModel(title: Strings.interior_design_consultancy, imageUrl: Images.paint_6, ratting: 1.0, quantity: 1, price: 80),
    ]),
    ServiceModel(title: Strings.cleaning, imageUrl: Images.svg_abc, serviceSubList: [
      ServiceModel(title: Strings.cleaning_packages, imageUrl: Images.clean_1, ratting: 5.0, quantity: 1, price: 40),
      ServiceModel(title: Strings.home_clening, imageUrl: Images.clean_2, ratting: 4.0, quantity: 1, price: 20),
      ServiceModel(title: Strings.full_home_deep_cleaning, imageUrl: Images.clean_3, ratting: 3.0, quantity: 1, price: 30),
    ]),
    ServiceModel(title: Strings.ac_repair, imageUrl: Images.svg_air, serviceSubList: [
      ServiceModel(title: Strings.furniture_color_painting, imageUrl: Images.paint_1, ratting: 5.0, quantity: 1, price: 40),
      ServiceModel(title: Strings.side_wall_color_painting, imageUrl: Images.paint_2, ratting: 4.0, quantity: 1, price: 20),
      ServiceModel(title: Strings.carpentry_services, imageUrl: Images.paint_3, ratting: 3.0, quantity: 1, price: 30),
      ServiceModel(title: Strings.renovation_decor, imageUrl: Images.paint_4, ratting: 5.0, quantity: 1, price: 40),
      ServiceModel(title: Strings.interior_design, imageUrl: Images.paint_5, ratting: 2.0, quantity: 1, price: 70),
      ServiceModel(title: Strings.interior_design_consultancy, imageUrl: Images.paint_6, ratting: 1.0, quantity: 1, price: 80),
    ]),
    ServiceModel(title: Strings.electricity, imageUrl: Images.svg_electric, serviceSubList: [
      ServiceModel(title: Strings.furniture_color_painting, imageUrl: Images.paint_1, ratting: 5.0, quantity: 1, price: 40),
      ServiceModel(title: Strings.side_wall_color_painting, imageUrl: Images.paint_2, ratting: 4.0, quantity: 1, price: 20),
      ServiceModel(title: Strings.carpentry_services, imageUrl: Images.paint_3, ratting: 3.0, quantity: 1, price: 30),
      ServiceModel(title: Strings.renovation_decor, imageUrl: Images.paint_4, ratting: 5.0, quantity: 1, price: 40),
      ServiceModel(title: Strings.interior_design, imageUrl: Images.paint_5, ratting: 2.0, quantity: 1, price: 70),
      ServiceModel(title: Strings.interior_design_consultancy, imageUrl: Images.paint_6, ratting: 1.0, quantity: 1, price: 80),
    ]),
    ServiceModel(title: Strings.gas, imageUrl: Images.svg_gas, serviceSubList: [
      ServiceModel(title: Strings.furniture_color_painting, imageUrl: Images.paint_1, ratting: 5.0, quantity: 1, price: 40),
      ServiceModel(title: Strings.side_wall_color_painting, imageUrl: Images.paint_2, ratting: 4.0, quantity: 1, price: 20),
      ServiceModel(title: Strings.carpentry_services, imageUrl: Images.paint_3, ratting: 3.0, quantity: 1, price: 30),
      ServiceModel(title: Strings.renovation_decor, imageUrl: Images.paint_4, ratting: 5.0, quantity: 1, price: 40),
      ServiceModel(title: Strings.interior_design, imageUrl: Images.paint_5, ratting: 2.0, quantity: 1, price: 70),
      ServiceModel(title: Strings.interior_design_consultancy, imageUrl: Images.paint_6, ratting: 1.0, quantity: 1, price: 80),
    ]),
    ServiceModel(title: Strings.wifi, imageUrl: Images.svg_wifi, serviceSubList: [
      ServiceModel(title: Strings.furniture_color_painting, imageUrl: Images.paint_1, ratting: 5.0, quantity: 1, price: 40),
      ServiceModel(title: Strings.side_wall_color_painting, imageUrl: Images.paint_2, ratting: 4.0, quantity: 1, price: 20),
      ServiceModel(title: Strings.carpentry_services, imageUrl: Images.paint_3, ratting: 3.0, quantity: 1, price: 30),
      ServiceModel(title: Strings.renovation_decor, imageUrl: Images.paint_4, ratting: 5.0, quantity: 1, price: 40),
      ServiceModel(title: Strings.interior_design, imageUrl: Images.paint_5, ratting: 2.0, quantity: 1, price: 70),
      ServiceModel(title: Strings.interior_design_consultancy, imageUrl: Images.paint_6, ratting: 1.0, quantity: 1, price: 80),
    ]),
  ];
}
