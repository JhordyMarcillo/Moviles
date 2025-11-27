import '../../domain/entities/producto_entity.dart';

class ProductModel extends ProductoEntity{

  ProductModel({required super.id, required super.nombre, required super.precio, required super.stock, required super.categoria});

  factory ProductModel.fromJson(Map<String, dynamic>json){
    return ProductModel(
      id: json['_id'],
      nombre: json['nombre'],
      precio: json['precio'],
      stock: json['stock'],
      categoria: json['categoria'],
    );
  }
}