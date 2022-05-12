import 'dart:convert';
import 'package:http/http.dart' as http;

class categoriesService {
  Future<dynamic> register(
    String name,
    String description,
  ) async {
    String url = "http://localhost:5000/categoria/crear";
    final data = {
      "nombre": name,
      "descripcion": description,
    };
    var datadecode = json.encode(data);

    final res = await http.post(Uri.parse(url), body: datadecode);

    dynamic registrar = json.decode(res.body);

    return registrar;
  }

  Future<List>? mostrar() async {
    String url = 'http://localhost:5000/categoria/listar';
    final res = await http.get(Uri.parse(url));
    List respuesta = json.decode(res.body);
    return respuesta;
  }
}
