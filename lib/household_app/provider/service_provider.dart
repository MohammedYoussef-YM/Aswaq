import 'package:flutter/foundation.dart';
import 'package:flutter_ui_kit/household_app/data/models/faq_model.dart';
import 'package:flutter_ui_kit/household_app/data/models/review_model.dart';
import 'package:flutter_ui_kit/household_app/data/models/service_model.dart';
import 'package:flutter_ui_kit/household_app/data/repository/service_repo.dart';

class ServiceProvider with ChangeNotifier {
  final ServiceRepo serviceRepo;

  ServiceProvider({this.serviceRepo});

  List<ServiceModel> _getAllService = [];

  List<ServiceModel> get getAllService => _getAllService;
  int _categorySelectedIndex = 0;

  int get categorySelectedIndex => _categorySelectedIndex;

  initializeAllService() {
    if (_getAllService.length == 0) {
      _getAllService.clear();
      _categorySelectedIndex = 0;
      _getAllService = serviceRepo.getAllBranch;
      notifyListeners();
    }
  }

  updatePrice({bool isAdd, int serviceIndex, int subServiceIndex}) {
    int price = _getAllService[serviceIndex].serviceSubList[subServiceIndex].price;
    if (isAdd) {
      _getAllService[serviceIndex].serviceSubList[subServiceIndex].quantity++;
      _getAllService[serviceIndex].serviceSubList[subServiceIndex].price =
          (_getAllService[serviceIndex].serviceSubList[subServiceIndex].quantity * price);
      notifyListeners();
    } else {
      if (_getAllService[serviceIndex].serviceSubList[subServiceIndex].quantity > 1) {
        _getAllService[serviceIndex].serviceSubList[subServiceIndex].quantity--;
        _getAllService[serviceIndex].serviceSubList[subServiceIndex].price =
            (_getAllService[serviceIndex].serviceSubList[subServiceIndex].quantity * price);
        notifyListeners();
      }
    }
  }

  void changeSelectedIndex(int selectedIndex) {
    _categorySelectedIndex = selectedIndex ?? 0;
    notifyListeners();
  }

  bool _isAddToCart = false;

  bool get isAddToCart => _isAddToCart;

  changeAddToCart({bool status}) {
    _isAddToCart = status;
    notifyListeners();
  }

  bool _isFeature = true;

  bool get isFeature => _isFeature;
  bool _isFaq = false;

  bool get isFaq => _isFaq;
  bool _isReview = false;

  bool get isReview => _isReview;

  changeTab({bool isFeature = false, bool isFaq = false, bool isReview = false}) {
    if (isFeature) {
      _isFeature = true;
      _isFaq = false;
      _isReview = false;
    }
    if (isFaq) {
      _isFeature = false;
      _isFaq = true;
      _isReview = false;
    }
    if (isReview) {
      _isFeature = false;
      _isFaq = false;
      _isReview = true;
    }
    notifyListeners();
  }

  // feature
  List<String> _features = [];

  List<String> get features => _features;

  initializeAllFeatured() {
    if (_features.length == 0) {
      _features.clear();
      _features = serviceRepo.getAllFeature;
      notifyListeners();
    }
  }

  // faq section
  List<FaqModel> _faqs = [];

  List<FaqModel> get faqs => _faqs;

  initializeAllFaq() {
    if (_faqs.length == 0) {
      _faqs.clear();
      _faqs = serviceRepo.getAllFaq;
      notifyListeners();
    }
  }

  toggleFaq(int index) {
    _faqs[index].isExpanded = !_faqs[index].isExpanded;
    notifyListeners();
  }

  // review Section
  List<ReviewModel> _reviews = [];

  List<ReviewModel> get reviews => _reviews;

  initializeAllReviews() {
    if (_reviews.length == 0) {
      _reviews.clear();
      _reviews = serviceRepo.getAllReview;
      notifyListeners();
    }
  }
}
