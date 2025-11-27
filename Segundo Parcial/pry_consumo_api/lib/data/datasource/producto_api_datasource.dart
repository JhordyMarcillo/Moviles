// consume la api con http y Future
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'base_datasource.dart';
import '../models/producto_model.dart';

class ProductoApiDataSource implements BaseDataSource {

  final String _baseUrl = 'http://localhost:3000/api/productos';

  /* Obtener todos los productos */
  @override
  Future<List<ProductModel>> fetchProductos() async {
    final url = Uri.parse(_baseUrl);
    final resp = await http.get(url);

    if (resp.statusCode != 200) {
      throw Exception('Error al cargar los productos');
    }

    final List data = json.decode(resp.body);
    return data.map((item) => ProductModel.fromJson(item)).toList();
  }

  /* Crear producto */
  @override
  Future<ProductModel> createProductos(Map<String, dynamic> data) async {
    final resp = await http.post(
      Uri.parse(_baseUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode(data),
    );

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      throw Exception('Error al crear el producto');
    }

    return ProductModel.fromJson(json.decode(resp.body));
  }

  /* Eliminar producto */
  @override
  Future<bool> deleteProductos(String id) async {
    final resp = await http.delete(
      Uri.parse("$_baseUrl/$id"),
    );

    if (resp.statusCode != 200 && resp.statusCode != 204) {
      throw Exception('Error al borrar el producto');
    }

    return true;
  }

  /* Actualizar producto */
  @override
  Future<ProductModel> updateProductos(String id, Map<String, dynamic> data) async {
    final resp = await http.put(
      Uri.parse("$_baseUrl/$id"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(data),
    );

    if (resp.statusCode != 200) {
      throw Exception('Error al actualizar el producto');
    }

    return ProductModel.fromJson(json.decode(resp.body));
  }
}
