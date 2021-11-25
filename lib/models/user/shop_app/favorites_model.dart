
// class FavouritesModel {
//     FavouritesModel({
//         this.status,
//         this.message,
//         this.data,
//     });

//     bool status;
//     dynamic message;
//     FavouritesDataModel data;

//      FavouritesModel.fromJson(Map<String, dynamic> json) {
//         status= json["status"];
//         message= json["message"];
//         data= json['data'] != null ? new FavouritesDataModel.fromJson(json['data']) : null;
//     }
    
// }

// class FavouritesDataModel {
//     FavouritesDataModel({
//         this.currentPage,
//         this.data,
//         this.firstPageUrl,
//         this.from,
//         this.lastPage,
//         this.lastPageUrl,
//         this.nextPageUrl,
//         this.path,
//         this.perPage,
//         this.prevPageUrl,
//         this.to,
//         this.total,
//     });

//     int currentPage;
//     List<DataModel> data;
//     String firstPageUrl;
//     int from;
//     int lastPage;
//     String lastPageUrl;
//     dynamic nextPageUrl;
//     String path;
//     int perPage;
//     dynamic prevPageUrl;
//     int to;
//     int total;

//     factory FavouritesDataModel.fromJson(Map<String, dynamic> json) => FavouritesDataModel(
//         currentPage: json["current_page"],
//         data: List<DataModel>.from(json["data"].map((x) => DataModel.fromJson(x))),
//         firstPageUrl: json["first_page_url"],
//         from: json["from"],
//         lastPage: json["last_page"],
//         lastPageUrl: json["last_page_url"],
//         nextPageUrl: json["next_page_url"],
//         path: json["path"],
//         perPage: json["per_page"],
//         prevPageUrl: json["prev_page_url"],
//         to: json["to"],
//         total: json["total"],
//     );

   
// }

// class DataModel {
//     DataModel({
//         this.id,
//         this.product,
//     });

//     int id;
//     Product product;

//     factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
//         id: json["id"],
//         product :json['product'] != null ? new Product.fromJson(json['product']) : null,
//     );

// }

// class Product {
//     Product({
//         this.id,
//         this.price,
//         this.oldPrice,
//         this.discount,
//         this.image,
//         this.name,
//         this.description,
//     });

//     int id;
//     int price;
//     int oldPrice;
//     int discount;
//     String image;
//     String name;
//     String description;

//     factory Product.fromJson(Map<String, dynamic> json) => Product(
//         id: json["id"],
//         price: json["price"],
//         oldPrice: json["old_price"],
//         discount: json["discount"],
//         image: json["image"],
//         name: json["name"],
//         description: json["description"],
//     );
// }

class FavoritesModel {
  bool status;
  Data data;


  FavoritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }


}

class Data {
  int currentPage;
  List<FavoritesData> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  Null nextPageUrl;
  String path;
  int perPage;
  Null prevPageUrl;
  int to;
  int total;


  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = new List<FavoritesData>();
      json['data'].forEach((v) {
        data.add(new FavoritesData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

}

class FavoritesData {
  int id;
  Product product;


  FavoritesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }
}

class Product {
  int id;
  dynamic price;
  dynamic oldPrice;
  int discount;
  String image;
  String name;
  String description;

  Product(
      {this.id,
        this.price,
        this.oldPrice,
        this.discount,
        this.image,
        this.name,
        this.description});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }

}
