class ProductModel {
  int _totalSize;
  String _limit;
  String _offset;
  List<Product> _products;

  ProductModel(int totalSize, String limit, String offset, List<Product> products) {
    this._totalSize = totalSize;
    this._limit = limit;
    this._offset = offset;
    this._products = products;
  }

  int get totalSize => _totalSize;
  String get limit => _limit;
  String get offset => _offset;
  List<Product> get products => _products;

  ProductModel.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'];
    _limit = json['limit'];
    _offset = json['offset'];
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_size'] = this._totalSize;
    data['limit'] = this._limit;
    data['offset'] = this._offset;
    if (this._products != null) {
      data['products'] = this._products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  int _id;
  String _addedBy;
  String _userId;
  String _name;
  String _slug;
  List<CategoryIds> _categoryIds;
  String _brandId;
  String _unit;
  String _minQty;
  String _refundable;
  List<String> _images;
  String _thumbnail;
  String _featured;
  String _flashDeal;
  String _videoProvider;
  String _videoUrl;
  List<ProductColors> _colors;
  String _variantProduct;
  List<String> _attributes;
  List<ChoiceOptions> _choiceOptions;
  List<Variation> _variation;
  String _published;
  String _unitPrice;
  String _purchasePrice;
  String _tax;
  String _taxType;
  String _discount;
  String _discountType;
  String _currentStock;
  String _details;
  String _freeShipping;
  String _attachment;
  String _createdAt;
  String _updatedAt;
  String _status;
  String _featuredStatus;
  List<Rating> _rating;

  Product(
      int id,
        String addedBy,
        String userId,
        String name,
        String slug,
        List<CategoryIds> categoryIds,
        String brandId,
        String unit,
        String minQty,
        String refundable,
        List<String> images,
        String thumbnail,
        String featured,
        String flashDeal,
        String videoProvider,
        String videoUrl,
        List<ProductColors> colors,
        String variantProduct,
        List<String> attributes,
        List<ChoiceOptions> choiceOptions,
        List<Variation> variation,
        String published,
        String unitPrice,
        String purchasePrice,
        String tax,
        String taxType,
        String discount,
        String discountType,
        String currentStock,
        String details,
        String freeShipping,
        String attachment,
        String createdAt,
        String updatedAt,
        String status,
        String featuredStatus,
        List<Rating> rating) {
    this._id = id;
    this._addedBy = addedBy;
    this._userId = userId;
    this._name = name;
    this._slug = slug;
    this._categoryIds = categoryIds;
    this._brandId = brandId;
    this._unit = unit;
    this._minQty = minQty;
    this._refundable = refundable;
    this._images = images;
    this._thumbnail = thumbnail;
    this._featured = featured;
    this._flashDeal = flashDeal;
    this._videoProvider = videoProvider;
    this._videoUrl = videoUrl;
    this._colors = colors;
    this._variantProduct = variantProduct;
    this._attributes = attributes;
    this._choiceOptions = choiceOptions;
    this._variation = variation;
    this._published = published;
    this._unitPrice = unitPrice;
    this._purchasePrice = purchasePrice;
    this._tax = tax;
    this._taxType = taxType;
    this._discount = discount;
    this._discountType = discountType;
    this._currentStock = currentStock;
    this._details = details;
    this._freeShipping = freeShipping;
    this._attachment = attachment;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
    this._status = status;
    this._featuredStatus = featuredStatus;
    this._rating = rating;
  }

  int get id => _id;
  String get addedBy => _addedBy;
  String get userId => _userId;
  String get name => _name;
  String get slug => _slug;
  List<CategoryIds> get categoryIds => _categoryIds;
  String get brandId => _brandId;
  String get unit => _unit;
  String get minQty => _minQty;
  String get refundable => _refundable;
  List<String> get images => _images;
  String get thumbnail => _thumbnail;
  String get featured => _featured;
  String get flashDeal => _flashDeal;
  String get videoProvider => _videoProvider;
  String get videoUrl => _videoUrl;
  List<ProductColors> get colors => _colors;
  String get variantProduct => _variantProduct;
  List<String> get attributes => _attributes;
  List<ChoiceOptions> get choiceOptions => _choiceOptions;
  List<Variation> get variation => _variation;
  String get published => _published;
  String get unitPrice => _unitPrice;
  String get purchasePrice => _purchasePrice;
  String get tax => _tax;
  String get taxType => _taxType;
  String get discount => _discount;
  String get discountType => _discountType;
  String get currentStock => _currentStock;
  String get details => _details;
  String get freeShipping => _freeShipping;
  String get attachment => _attachment;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  String get status => _status;
  String get featuredStatus => _featuredStatus;
  List<Rating> get rating => _rating;

  Product.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _addedBy = json['added_by'];
    _userId = json['user_id'];
    _name = json['name'];
    _slug = json['slug'];
    if (json['category_ids'] != null) {
      _categoryIds = [];
      json['category_ids'].forEach((v) {
        _categoryIds.add(new CategoryIds.fromJson(v));
      });
    }
    _brandId = json['brand_id'];
    _unit = json['unit'];
    _minQty = json['min_qty'];
    _refundable = json['refundable'];
    _images = json['images'].cast<String>();
    _thumbnail = json['thumbnail'];
    _featured = json['featured'];
    _flashDeal = json['flash_deal'];
    _videoProvider = json['video_provider'];
    _videoUrl = json['video_url'];
    if (json['colors'] != null) {
      _colors = [];
      json['colors'].forEach((v) {
        _colors.add(new ProductColors.fromJson(v));
      });
    }
    _variantProduct = json['variant_product'];
    if (json['attributes'] != null) {
      _attributes = json['attributes'].cast<String>();
    }
    if (json['choice_options'] != null) {
      _choiceOptions = [];
      json['choice_options'].forEach((v) {
        _choiceOptions.add(new ChoiceOptions.fromJson(v));
      });
    }
    if (json['variation'] != null) {
      _variation = [];
      json['variation'].forEach((v) {
        _variation.add(new Variation.fromJson(v));
      });
    }
    _published = json['published'];
    _unitPrice = json['unit_price'];
    _purchasePrice = json['purchase_price'];
    _tax = json['tax'];
    _taxType = json['tax_type'];
    _discount = json['discount'];
    _discountType = json['discount_type'];
    _currentStock = json['current_stock'];
    _details = json['details'];
    _freeShipping = json['free_shipping'];
    _attachment = json['attachment'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _status = json['status'];
    _featuredStatus = json['featured_status'];
    if (json['rating'] != null) {
      _rating = [];
      json['rating'].forEach((v) {
        _rating.add(new Rating.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['added_by'] = this._addedBy;
    data['user_id'] = this._userId;
    data['name'] = this._name;
    data['slug'] = this._slug;
    if (this._categoryIds != null) {
      data['category_ids'] = this._categoryIds.map((v) => v.toJson()).toList();
    }
    data['brand_id'] = this._brandId;
    data['unit'] = this._unit;
    data['min_qty'] = this._minQty;
    data['refundable'] = this._refundable;
    data['images'] = this._images;
    data['thumbnail'] = this._thumbnail;
    data['featured'] = this._featured;
    data['flash_deal'] = this._flashDeal;
    data['video_provider'] = this._videoProvider;
    data['video_url'] = this._videoUrl;
    if (this._colors != null) {
      data['colors'] = this._colors.map((v) => v.toJson()).toList();
    }
    data['variant_product'] = this._variantProduct;
    data['attributes'] = this._attributes;
    if (this._choiceOptions != null) {
      data['choice_options'] =
          this._choiceOptions.map((v) => v.toJson()).toList();
    }
    if (this._variation != null) {
      data['variation'] = this._variation.map((v) => v.toJson()).toList();
    }
    data['published'] = this._published;
    data['unit_price'] = this._unitPrice;
    data['purchase_price'] = this._purchasePrice;
    data['tax'] = this._tax;
    data['tax_type'] = this._taxType;
    data['discount'] = this._discount;
    data['discount_type'] = this._discountType;
    data['current_stock'] = this._currentStock;
    data['details'] = this._details;
    data['free_shipping'] = this._freeShipping;
    data['attachment'] = this._attachment;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['status'] = this._status;
    data['featured_status'] = this._featuredStatus;
    if (this._rating != null) {
      data['rating'] = this._rating.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryIds {
  String _id;
  int _position;

  CategoryIds({String id, int position}) {
    this._id = id;
    this._position = position;
  }

  String get id => _id;
  int get position => _position;

  CategoryIds.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['position'] = this._position;
    return data;
  }
}

class ChoiceOptions {
  String _name;
  String _title;
  List<String> _options;

  ChoiceOptions({String name, String title, List<String> options}) {
    this._name = name;
    this._title = title;
    this._options = options;
  }

  String get name => _name;
  String get title => _title;
  List<String> get options => _options;

  ChoiceOptions.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _title = json['title'];
    _options = json['options'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['title'] = this._title;
    data['options'] = this._options;
    return data;
  }
}

class Variation {
  String _type;
  String _price;
  String _sku;
  String _qty;

  Variation({String type, String price, String sku, String qty}) {
    this._type = type;
    this._price = price;
    this._sku = sku;
    this._qty = qty;
  }

  String get type => _type;
  String get price => _price;
  String get sku => _sku;
  String get qty => _qty;

  Variation.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _price = json['price'];
    _sku = json['sku'];
    _qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this._type;
    data['price'] = this._price;
    data['sku'] = this._sku;
    data['qty'] = this._qty;
    return data;
  }
}

class Rating {
  String _average;
  String _productId;

  Rating({String average, String productId}) {
    this._average = average;
    this._productId = productId;
  }

  String get average => _average;
  String get productId => _productId;

  Rating.fromJson(Map<String, dynamic> json) {
    _average = json['average'];
    _productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['average'] = this._average;
    data['product_id'] = this._productId;
    return data;
  }
}

class ProductColors {
  String _name;
  String _code;

  ProductColors({String name, String code}) {
    this._name = name;
    this._code = code;
  }

  String get name => _name;
  String get code => _code;

  ProductColors.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['code'] = this._code;
    return data;
  }
}