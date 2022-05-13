import 'dart:convert';
import 'package:http/http.dart' as http;

class productService {
  Future<dynamic> register(
    String nombre,
    String descripcion,
    String precio,
    String cantidad,
  ) async {
    String url = "http://localhost:5000/producto/crear";
    final data = {
      "nombre": nombre,
      "descripcion": descripcion,
      "precio": precio,
      "cantidad": cantidad,
    };
    var datadecode = json.encode(data);

    final res = await http.post(Uri.parse(url), body: datadecode);

    dynamic registrar = json.decode(res.body);

    return registrar;
  }

  Future<List>? mostrar() async {
    String url = 'http://localhost:5000/producto/listar';
    final res = await http.get(Uri.parse(url));
    List respuesta = json.decode(res.body);
    return respuesta;
  }

  Future<dynamic> eliminar(String id) async {
    String url = 'http://localhost:5000/producto/eliminar?id=$id';
    final res = await http.delete(Uri.parse(url));
    print("la respuesta del serfer es ${res.statusCode}");
    dynamic eliminar = json.decode(res.body);
    return eliminar;
  }
}

class User {
  final String name;
  final String id;

  const User({required this.name, required this.id});

  static User fromJson(Map<String, dynamic> json) =>
      User(name: json['nombre'], id: json['id']);
}

class UserApi {
  static Future<List<User>> getUserSuggestions(String query) async {
    String url = 'http://localhost:5000/producto/listar';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List users = json.decode(response.body);

      return users.map((json) => User.fromJson(json)).where((user) {
        final nameLower = user.name.toLowerCase();
        final queryLower = query.toLowerCase();

        return nameLower.contains(queryLower);
      }).toList();
    } else {
      throw Exception();
    }
  }

  static Future<List<User>> getProducts(String query) async {
    String url = 'http://localhost:5000/producto/listar';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List users = json.decode(response.body);

      return users.map((json) => User.fromJson(json)).where((user) {
        final nameLower = user.name.toLowerCase();
        final queryLower = query.toLowerCase();

        return nameLower.contains(queryLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
