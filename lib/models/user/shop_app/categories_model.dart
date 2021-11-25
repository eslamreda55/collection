// class CategoriesModel
// {
//   bool status;
//   CategoriesDataModel data;

//   CategoriesModel.fromJson(Map<String , dynamic>json)
//   {
//     status=json["status"];
//     CategoriesDataModel.fromJson(json["data"]);
    
//   }
// }

// class CategoriesDataModel
// {
//   int currentPage;
//   List<DataModel> data=[];

//    CategoriesDataModel.fromJson(Map<String , dynamic>json)
//   {
//     currentPage=json["current_page"];
//     json["data"].forEach((element)
//     {
//       data.add(DataModel.fromJson(element));
//     });
    
//   }
// }

// class DataModel
// {
//   int id;
//   String name;
//   String image;

//   DataModel.fromJson(Map<String , dynamic>json)
//   {
//     id=json["id"];
//     name=json["name"];
//     image=json['image'];
//   }
// }

 
import 'dart:convert';

CategoriesModel categoriesModelFromJson(String str) => CategoriesModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoriesModel data) => json.encode(data.toJson());

class CategoriesModel {
    CategoriesModel({
        this.status,
        this.message,
        this.data,
    });

    bool status;
    dynamic message;
    CategoriesDataModel data;

    factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
        status: json["status"],
        message: json["message"],
        data: CategoriesDataModel.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class CategoriesDataModel {
    CategoriesDataModel({
        this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total,
    });

    int currentPage;
    List<DataModel> data=[];
    String firstPageUrl;
    int from;
    int lastPage;
    String lastPageUrl;
    dynamic nextPageUrl;
    String path;
    int perPage;
    dynamic prevPageUrl;
    int to;
    int total;

    factory CategoriesDataModel.fromJson(Map<String, dynamic> json) => CategoriesDataModel(
        currentPage: json["current_page"],
        data: List<DataModel>.from(json["data"].map((x) => DataModel.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
    };
}

class DataModel {
    DataModel({
        this.id,
        this.name,
        this.image,
    });

    int id;
    String name;
    String image;

    factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
    };
}
