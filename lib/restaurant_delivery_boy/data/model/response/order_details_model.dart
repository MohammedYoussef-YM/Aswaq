class OrderDetailsModel {
  int id;
  String productId;
  String orderId;
  String price;
  ProductDetails productDetails;
  String variation;
  String discountOnProduct;
  String discountType;
  String quantity;
  String taxAmount;
  String createdAt;
  String updatedAt;
  List<int> addOnIds;
  String variant;

  OrderDetailsModel(
      {this.id,
        this.productId,
        this.orderId,
        this.price,
        this.productDetails,
        this.variation,
        this.discountOnProduct,
        this.discountType,
        this.quantity,
        this.taxAmount,
        this.createdAt,
        this.updatedAt,
        this.addOnIds,
        this.variant});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    orderId = json['order_id'];
    price = json['price'];
    productDetails = json['product_details'] != null
        ? new ProductDetails.fromJson(json['product_details'])
        : null;
    variation = json['variation'];
    discountOnProduct = json['discount_on_product'];
    discountType = json['discount_type'];
    quantity = json['quantity'];
    taxAmount = json['tax_amount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    addOnIds = json['add_on_ids'].cast<int>();
    variant = json['variant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['order_id'] = this.orderId;
    data['price'] = this.price;
    if (this.productDetails != null) {
      data['product_details'] = this.productDetails.toJson();
    }
    data['variation'] = this.variation;
    data['discount_on_product'] = this.discountOnProduct;
    data['discount_type'] = this.discountType;
    data['quantity'] = this.quantity;
    data['tax_amount'] = this.taxAmount;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['add_on_ids'] = this.addOnIds;
    data['variant'] = this.variant;
    return data;
  }
}

class ProductDetails {
  int id;
  String name;
  String description;
  String image;
  String price;
  List<Variations> variations;
  List<AddOns> addOns;
  String tax;
  String availableTimeStarts;
  String availableTimeEnds;
  String status;
  String createdAt;
  String updatedAt;
  List<String> attributes;
  List<CategoryIds> categoryIds;
  List<ChoiceOptions> choiceOptions;
  String discount;
  String discountType;
  String taxType;
  String setMenu;

  ProductDetails(
      {this.id,
        this.name,
        this.description,
        this.image,
        this.price,
        this.variations,
        this.addOns,
        this.tax,
        this.availableTimeStarts,
        this.availableTimeEnds,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.attributes,
        this.categoryIds,
        this.choiceOptions,
        this.discount,
        this.discountType,
        this.taxType,
        this.setMenu});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    if (json['variations'] != null) {
      variations = [];
      json['variations'].forEach((v) {
        variations.add(new Variations.fromJson(v));
      });
    }
    if (json['add_ons'] != null) {
      addOns = [];
      json['add_ons'].forEach((v) {
        addOns.add(new AddOns.fromJson(v));
      });
    }
    tax = json['tax'];
    availableTimeStarts = json['available_time_starts'];
    availableTimeEnds = json['available_time_ends'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    attributes = json['attributes'].cast<String>();
    if (json['category_ids'] != null) {
      categoryIds = [];
      json['category_ids'].forEach((v) {
        categoryIds.add(new CategoryIds.fromJson(v));
      });
    }
    if (json['choice_options'] != null) {
      choiceOptions = [];
      json['choice_options'].forEach((v) {
        choiceOptions.add(new ChoiceOptions.fromJson(v));
      });
    }
    discount = json['discount'];
    discountType = json['discount_type'];
    taxType = json['tax_type'];
    setMenu = json['set_menu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['price'] = this.price;
    if (this.variations != null) {
      data['variations'] = this.variations.map((v) => v.toJson()).toList();
    }
    if (this.addOns != null) {
      data['add_ons'] = this.addOns.map((v) => v.toJson()).toList();
    }
    data['tax'] = this.tax;
    data['available_time_starts'] = this.availableTimeStarts;
    data['available_time_ends'] = this.availableTimeEnds;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['attributes'] = this.attributes;
    if (this.categoryIds != null) {
      data['category_ids'] = this.categoryIds.map((v) => v.toJson()).toList();
    }
    if (this.choiceOptions != null) {
      data['choice_options'] =
          this.choiceOptions.map((v) => v.toJson()).toList();
    }
    data['discount'] = this.discount;
    data['discount_type'] = this.discountType;
    data['tax_type'] = this.taxType;
    data['set_menu'] = this.setMenu;
    return data;
  }
}

class Variations {
  String type;
  int price;

  Variations({this.type, this.price});

  Variations.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['price'] = this.price;
    return data;
  }
}

class AddOns {
  int id;
  String name;
  String price;
  String createdAt;
  String updatedAt;

  AddOns({this.id, this.name, this.price, this.createdAt, this.updatedAt});

  AddOns.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class CategoryIds {
  String id;
  int position;

  CategoryIds({this.id, this.position});

  CategoryIds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['position'] = this.position;
    return data;
  }
}

class ChoiceOptions {
  String name;
  String title;
  List<String> options;

  ChoiceOptions({this.name, this.title, this.options});

  ChoiceOptions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    title = json['title'];
    options = json['options'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['title'] = this.title;
    data['options'] = this.options;
    return data;
  }
}
