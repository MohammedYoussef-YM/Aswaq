class ContactModel {
  String _name;
  bool _isInvited;

  ContactModel(this._name, this._isInvited);

  bool get isInvited => _isInvited;
  String get name => _name;
}