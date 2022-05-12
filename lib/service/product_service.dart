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
}
