
// class ChangeFavouritesModel {
//     ChangeFavouritesModel({
//         this.status,
//         this.message,
        
//     });

//     bool status;
//     String message;
    

//      ChangeFavouritesModel.fromJson(Map<String, dynamic> json)
//     {
//         status= json["status"];
//         message= json["message"];
       
//     }

//    }

// class DataModel {
//     DataModel({
//         this.id,
//         this.product,
//     });

//     int id;
//     Product product;

//     factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
//         id: json["id"],
//         product: Product.fromJson(json["product"]),
//     );

//    }

// class Product {
//     Product({
//         this.id,
//         this.price,
//         this.oldPrice,
//         this.discount,
//         this.image,
//     });

//     int id;
//     int price;
//     int oldPrice;
//     int discount;
//     String image;

//     factory Product.fromJson(Map<String, dynamic> json) => Product(
//         id: json["id"],
//         price: json["price"],
//         oldPrice: json["old_price"],
//         discount: json["discount"],
//         image: json["image"],
//     );
// }

class ChangeFavoritesModel {
  bool status;
  String message;
  ChangeFavoritesModel.fromJson(Map<String , dynamic> json){

    status = json['status'];
    message = json['message'];

  }
}
