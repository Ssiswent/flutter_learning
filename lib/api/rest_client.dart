import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://jd.itying.com/api/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/pcate")
  Future<String> getProducts();

  @POST("/httpPost")
  Future<String> teacherLogin(
      @Field() String account, @Field() String password);
}

@JsonSerializable()
class Product {
  String? id;
  String? title;
  String? status;
  String? pic;
  String? pid;
  String? sort;

  Product({this.id, this.title, this.status, this.pic, this.pid, this.sort});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
