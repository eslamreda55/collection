class SliderModel {
  String key;
  String message;
  List<Data> data;

  SliderModel({this.key, this.message, this.data});

  SliderModel.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String image;

  Data({this.image});

  Data.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    return data;
  }
}


//http://masaralaibidae.aait-sa.com/api/v1/sliders


//ToCreateModel => https://javiercbk.github.io/json_to_dart/