
import 'package:flutter_ui_kit/academy/data/model/category_model.dart';
import 'package:flutter_ui_kit/academy/data/model/course.dart';
import 'package:flutter_ui_kit/academy/utility/images.dart';
import 'package:flutter_ui_kit/academy/utility/strings.dart';

class CourseRepo {
  List<String> getAllTopSearch = [
    AcademyStrings.javascript,
    AcademyStrings.photoshop,
    AcademyStrings.excel,
    AcademyStrings.java,
    AcademyStrings.react,
    AcademyStrings.c_sharp,
    AcademyStrings.python,
    AcademyStrings.wordpress,
    AcademyStrings.blender,
    AcademyStrings.unity
  ];
  List<CategoryModel> getAllCategory = [
    CategoryModel(icon: Images.finance, title: AcademyStrings.finance_accounting),
    CategoryModel(icon: Images.design, title: AcademyStrings.design),
    CategoryModel(icon: Images.software, title: AcademyStrings.it_software),
    CategoryModel(icon: Images.software, title: AcademyStrings.photography_video),
    CategoryModel(icon: Images.development, title: AcademyStrings.development),
    CategoryModel(icon: Images.music, title: AcademyStrings.music),
    CategoryModel(icon: Images.academic, title: AcademyStrings.teching_academic),
    CategoryModel(icon: Images.lifestyle, title: AcademyStrings.lifestyle),
    CategoryModel(icon: Images.health, title: AcademyStrings.health_fitness),
    CategoryModel(icon: Images.marketting, title: AcademyStrings.marketting),
    CategoryModel(icon: Images.accounting, title: AcademyStrings.business),
  ];

  List<Course> getAllFeaturedCourse = [
    Course(
        imageUrl: Images.course_1,
        title: 'The Web Developer Bootcamp 2021',
        name: 'Colt Steele',
        rattingAndDownload: AcademyStrings.four_6_40124,
        lastPrice: AcademyStrings.number_11000,
        currentPrice: AcademyStrings.bdt_1000,
        subTitle: 'COMPLETELY REDONE - The only course you need to learn web development - HTML, CSS, JS, Node, and More!',
        previewVideoUrl:"https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_2mb.mp4",
        condition: AcademyStrings.bestseller),
    Course(
        imageUrl: Images.course_2,
        title: 'Vue - The Complete Guide (w/ Router, Vuex, Composition API)',
        subTitle: 'Vue.js is an awesome JavaScript Framework for building Frontend Applications! VueJS mixes the Best of Angular + React!',
        name: AcademyStrings.dr_angela_yu,
        rattingAndDownload: AcademyStrings.four_6_40124,
        lastPrice: AcademyStrings.number_11000,
        currentPrice: AcademyStrings.bdt_1000,
        previewVideoUrl:"https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_2mb.mp4",
        condition: AcademyStrings.bestseller),
    Course(
        imageUrl: Images.course_3,
        title: 'Advanced CSS and Sass: Flexbox, Grid, Animations and More!',
        subTitle: 'The most advanced and modern CSS course on the internet: master flexbox, CSS Grid, responsive design, and so much more.',
        name: 'Jones Schmedt',
        rattingAndDownload: AcademyStrings.four_6_40124,
        lastPrice: AcademyStrings.number_11000,
        previewVideoUrl:"https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_2mb.mp4",
        currentPrice: AcademyStrings.bdt_1000,
        condition: AcademyStrings.bestseller),
    Course(
        imageUrl: Images.course_4,
        title: 'MERN Stack E-Commerce Mobile App with React Native [2021]',
        subTitle: 'Build E-Shop Mobile App with Admin Panel and Authentication using React Native, Redux, Context API and much more',
        name: 'Tiago Pereira',
        rattingAndDownload: AcademyStrings.four_6_40124,
        lastPrice: AcademyStrings.number_11000,
        currentPrice: AcademyStrings.bdt_1000,
        previewVideoUrl:"https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_2mb.mp4",
        condition: AcademyStrings.bestseller),
    Course(
        imageUrl: Images.course_5,
        title: 'Flutter & Dart - The Complete Guide [2021 Edition]',
        subTitle: 'A Complete Guide to the Flutter SDK & Flutter Framework for building native iOS and Android apps',
        name: 'maximil lah',
        rattingAndDownload: AcademyStrings.four_6_40124,
        lastPrice: AcademyStrings.number_11000,
        currentPrice: AcademyStrings.bdt_1000,
        previewVideoUrl:"https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_2mb.mp4",
        condition: AcademyStrings.bestseller),
  ];
}
