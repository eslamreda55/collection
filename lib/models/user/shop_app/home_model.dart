

// class HomeModel
// {
//   bool status;
//   HomeDataModel data;

//   HomeModel.fromJson(Map<String,dynamic>json)
//   {
//     status=json['status'];
//     data=HomeDataModel.fromJson(json['data']) ;
//   }
// }
// class HomeDataModel
// {
//   List<BannerModel> banners=[];
//   List<ProductModel> products=[];

//   HomeDataModel.fromJson(Map<String , dynamic>json)
//   {
   
//     json['banners'].forEach((element)
//     {
//       banners.add(element);
//     });

    
//     json['products'].forEach((element)
//     {
//       products.add(element);
//     });
//   }
// }

// class BannerModel
// {
//     int id;
//     String image;
//     BannerModel.fromJson(Map<String,dynamic>json)
//     {
//       id=json['id'];
//       image=json['image'];
//     }

// }

// class ProductModel
// {
//     int id;
//     dynamic price;
//     dynamic oldPrice;
//     dynamic discount;
//     String image;
//     String name;
//     bool inFavorites;
//     bool inCart;
//      ProductModel.fromJson(Map<String,dynamic>json)
//      {
//        id=json['id'];
//        price=json['price'];
//        oldPrice=json['old_price'];
//        discount=json['discount'];
//        image=json['image'];
//        name=json['name'];
//        inFavorites=json['in_favorites'];
//        inCart=json['in_cart'];
//      }
 
// }



// To parse this JSON data, do
//
//     final homeClassModel = homeClassModelFromJson(jsonString);



class HomeClassModel {
    HomeClassModel({
        this.status,
        this.message,
        this.data,
    });

    bool status;
    dynamic message;
    Data data;

    factory HomeClassModel.fromJson(Map<String, dynamic> json) => HomeClassModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        this.banners,
        this.products,
        this.ad,
    });

    List<Banner> banners;
    List<Product> products;
    String ad;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        banners: List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x))),
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
        ad: json["ad"],
    );

    Map<String, dynamic> toJson() => {
        "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "ad": ad,
    };
}

class Banner {
    Banner({
        this.id,
        this.image,
        this.category,
        this.product,
    });

    int id;
    String image;
    dynamic category;
    dynamic product;

    factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json["id"],
        image: json["image"],
        category: json["category"],
        product: json["product"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "category": category,
        "product": product,
    };
}

class Product {
    Product({
        this.id,
        this.price,
        this.oldPrice,
        this.discount,
        this.image,
        this.name,
        this.description,
        this.images,
        this.inFavorites,
        this.inCart,
    });

    int id;
    int price;
    int oldPrice;
    int discount;
    String image;
    String name;
    String description;
    List<String> images;
    bool inFavorites;
    bool inCart;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        price: json["price"],
        oldPrice: json["old_price"],
        discount: json["discount"],
        image: json["image"],
        name: json["name"],
        description: json["description"],
        images: List<String>.from(json["images"].map((x) => x)),
        inFavorites: json["in_favorites"],
        inCart: json["in_cart"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "old_price": oldPrice,
        "discount": discount,
        "image": image,
        "name": name,
        "description": description,
        "images": List<dynamic>.from(images.map((x) => x)),
        "in_favorites": inFavorites,
        "in_cart": inCart,
    };
}
