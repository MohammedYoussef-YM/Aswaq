class MembershipModel {
  String _planTime;
  List<String> _planRules;
  double _amount;

  MembershipModel(this._planTime, this._planRules, this._amount);

  double get amount => _amount;
  List<String> get planRules => _planRules;
  String get planTime => _planTime;
}