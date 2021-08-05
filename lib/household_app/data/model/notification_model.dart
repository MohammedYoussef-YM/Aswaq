class NotificationModel {
  String _image;
  String _title;
  String _status;
  String _time;

  NotificationModel(this._image, this._title, this._status, this._time);

  String get time => _time;
  String get status => _status;
  String get title => _title;
  String get image => _image;
}