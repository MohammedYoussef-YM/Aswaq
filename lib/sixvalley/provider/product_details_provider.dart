import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/body/review_body.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/product_model.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/response_model.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/review_model.dart';
import 'package:flutter_ui_kit/sixvalley/data/repository/product_details_repo.dart';

class SixProductDetailsProvider extends ChangeNotifier {
  final SixProductDetailsRepo productDetailsRepo;
  SixProductDetailsProvider({@required this.productDetailsRepo});

  List<ReviewModel> _reviewList;
  int _imageSliderIndex;
  bool _wish = false;
  int _quantity = 0;
  int _variantIndex;
  List<int> _variationIndex = [];
  int _rating = 0;
  bool _isLoading = false;
  int _orderCount;
  int _wishCount;
  String _sharableLink;
  String _errorText;

  List<ReviewModel> get reviewList => _reviewList;
  int get imageSliderIndex => _imageSliderIndex;
  bool get isWished => _wish;
  int get quantity => _quantity;
  int get variantIndex => _variantIndex;
  List<int> get variationIndex => _variationIndex;
  int get rating => _rating;
  bool get isLoading => _isLoading;
  int get orderCount => _orderCount;
  int get wishCount => _wishCount;
  String get sharableLink => _sharableLink;
  String get errorText => _errorText;

  void initProduct(Product product) async {
    _variantIndex = 0;
    product.choiceOptions.forEach((element) => _variationIndex.add(0));
    _reviewList = [];
    productDetailsRepo.getReviews().forEach((reviewModel) => _reviewList.add(reviewModel));
    _imageSliderIndex = 0;
    _quantity = 1;

    notifyListeners();
  }

  void removePrevReview() {
    _reviewList = null;
    _sharableLink = null;
    notifyListeners();
  }

  void getCount(String productID) async {
    _orderCount = productDetailsRepo.getCount()['order_count'];
    _wishCount = productDetailsRepo.getCount()['wishlist_count'];
    notifyListeners();
  }

  void getSharableLink(String productID) async {
    _sharableLink = productDetailsRepo.getSharableLink();
  }

  void setErrorText(String error) {
    _errorText = error;
    notifyListeners();
  }

  void removeError() {
    _errorText = null;
    notifyListeners();
  }

  void setImageSliderSelectedIndex(int selectedIndex) {
    _imageSliderIndex = selectedIndex;
    notifyListeners();
  }

  void changeWish() {
    _wish = !_wish;
    notifyListeners();
  }

  void setQuantity(int value) {
    _quantity = value;
    notifyListeners();
  }

  void setCartVariantIndex(int index) {
    _variantIndex = index;
    notifyListeners();
  }

  void setCartVariationIndex(int index, int i) {
    _variationIndex[index] = i;
    notifyListeners();
  }

  void setRating(int rate) {
    _rating = rate;
    notifyListeners();
  }

  Future<ResponseModel> submitReview(ReviewBody reviewBody) async {
    _rating = 0;
    ResponseModel responseModel = ResponseModel("successful", true);
    _reviewList.add(ReviewModel(productId: '1', customerId: '1', comment: reviewBody.comment, rating: reviewBody.rating, updatedAt: DateTime.now().toString(), customer: Customer(name: '', fName: 'John', lName: 'Doe', phone: '+88665674', email: 'johndoe@gmail.com', image: 'assets/images/person.jpg')));
    _errorText = null;
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }
}
