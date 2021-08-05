class FaqModel {
  String _question;
  String _answer;

  FaqModel(this._question, this._answer);

  String get answer => _answer;
  String get question => _question;
}