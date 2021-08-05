class Course {
  String imageUrl;
  String title;
  String name;
  String rattingAndDownload;
  String currentPrice;
  String lastPrice;
  String condition;
  int id;
  bool isSelect;
  String previewVideoUrl;
  String subTitle;

  Course(
      {this.imageUrl,
      this.title,
      this.name,
      this.rattingAndDownload,
      this.currentPrice,
      this.lastPrice,
      this.condition,
      this.id,
      this.isSelect = false,
      this.previewVideoUrl,
      this.subTitle});
}
