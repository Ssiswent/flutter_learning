import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://jd.itying.com/api/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/httpGet")
  Future<ResponseExample> getExample();

  @POST("/httpPost")
  Future<String> postExample(@Field() String account, @Field() String password);

  @GET("/pcate")
  Future<ProductResponse> getProducts();
}

@JsonSerializable()
class ResponseExample {
  String? msg;

  ResponseExample({this.msg});

  factory ResponseExample.fromJson(Map<String, dynamic> json) =>
      _$ResponseExampleFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseExampleToJson(this);
}

@JsonSerializable()
class ProductResponse {
  List<Product>? result;

  ProductResponse({this.result});

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}

@JsonSerializable()
class Product {
  String? id;
  String? title;
  String? pic;
  String? pid;
  String? sort;

  Product({this.id, this.title, this.pic, this.pid, this.sort});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
