
class Item{
  int _id;
  String _description;
  double _price;
  String _image;

  Item(this._id, this._description, this._price, this._image);

  int get ItemID => _id;
  String get Description => _description;
  double get Price => _price;
  String get Image => _image;
}