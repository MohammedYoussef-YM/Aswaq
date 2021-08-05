import 'package:flutter/foundation.dart';
import 'package:ola_like_country_picker/ola_like_country_picker.dart';

class DriverAppAuthProvider with ChangeNotifier{

  Country _country = Country.fromJson(countryCodes[0]);
  Country get country =>_country;

  changeCountry(Country co){
    _country=co;
    notifyListeners();
  }

}