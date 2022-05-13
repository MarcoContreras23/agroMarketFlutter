import 'package:agro_market/service/categories_services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoriesForm extends StatefulWidget {
  const CategoriesForm({Key? key}) : super(key: key);

  @override
  State<CategoriesForm> createState() => _CategoriesFormState();
}

String nombre = "", descripcion = "";
final categorieService = categoriesService();

class _CategoriesFormState extends State<CategoriesForm> {
  final formKey22 = GlobalKey<FormState>();
  final textFormFieldStyle = OutlineInputBorder(
    borderSide:
        const BorderSide(color: Color.fromARGB(255, 197, 254, 37), width: 2.0),
    borderRadius: BorderRadius.circular(30.0),
  );
  final textFormFieldStyleWrong = OutlineInputBorder(
    borderSide:
        const BorderSide(color: Color.fromARGB(255, 255, 0, 0), width: 2.0),
    borderRadius: BorderRadius.circular(30.0),
  );
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var spaceBetween = SizedBox(height: size.height * 0.01);
    var spaceBetweenWidth = SizedBox(width: size.width * 0.02);
    final ButtonStyle style = ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        primary: const Color.fromARGB(255, 197, 254, 37),
        textStyle: const TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black));
    final ButtonStyle style2 = ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        primary: const Color.fromARGB(255, 254, 37, 37),
        textStyle: const TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: _body(context, style, spaceBetween, spaceBetweenWidth, style2),
      ),
    );
  }

  Widget _body(context, style, spaceBetween, spaceBetweenWidth, style2) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/FondoShop.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          _bodyOne(context, style, spaceBetween, spaceBetweenWidth, style2),
          Flexible(
            flex: 7,
            child: _bodyTwo(context, style, spaceBetween, spaceBetweenWidth,
                style2, textFormFieldStyle, textFormFieldStyleWrong),
          ),
          _bodyThree(context, style, spaceBetween, spaceBetweenWidth, style2),
          spaceBetween,
          spaceBetween,
        ],
      ),
    );
  }

  Widget _bodyOne(context, style, spaceBetween, spaceBetweenWidth, style2) {
    return Column(children: [
      Wrap(
        children: [
          Column(
            children: [
              spaceBetween,
              spaceBetween,
              spaceBetween,
              spaceBetween,
              _bottonBack(),
            ],
          ),
          Column(
            children: [
              FittedBox(
                child: Image(
                  height: MediaQuery.of(context).size.height * 0.12,
                  width: MediaQuery.of(context).size.width * 0.6,
                  image: const AssetImage('assets/logo.png'),
                ),
              ),
              const Text("REGISTRAR CATEGORIAS",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ],
          ),
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.05)
            ],
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.15),
        ],
      ),
    ]);
  }

  Widget _bodyTwo(context, style, spaceBetween, spaceBetweenWidth, style2,
      textFormFieldStyle, textFormFieldStyleWrong) {
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.all(10.0),
      child: Form(
        key: formKey22,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Column(
            children: [
              nombreInput(context, textFormFieldStyle, textFormFieldStyleWrong),
              spaceBetween,
              descripcionInput(
                  context, textFormFieldStyle, textFormFieldStyleWrong),
              spaceBetween
            ],
          ),
        ),
      ),
    );
  }

  Widget _bodyThree(context, style, spaceBetween, spaceBetweenWidth, style2) {
    return Wrap(
      children: [
        ElevatedButton(
          style: style,
          child: const Text("REGISTRAR",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0))),
          onPressed: () {
            if (formKey22.currentState!.validate()) {
              _registrarCategoria();
              Navigator.pushReplacementNamed(context, '/menuCategories');
            } else {
              print("no valido");
            }
          },
        ),
        spaceBetweenWidth,
        ElevatedButton(
          style: style2,
          child: const Text(
            "CANCELAR",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          onPressed: () => {
            // Navigator.pushReplacementNamed(context, '/login'),
          },
        ),
        spaceBetweenWidth,
      ],
    );
  }

  Widget nombreInput(context, textFormFieldStyle, textFormFieldStyleWrong) {
    return TextFormField(
      maxLength: 40,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
          enabledBorder: textFormFieldStyle,
          disabledBorder: textFormFieldStyle,
          focusedBorder: textFormFieldStyle,
          errorBorder: textFormFieldStyleWrong,
          focusedErrorBorder: textFormFieldStyleWrong,
          label: const Text(
            "Nombre del producto",
            style: const TextStyle(color: Colors.black),
          ),
          labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          suffixIcon: const Icon(
            FontAwesomeIcons.user,
            color: Color.fromARGB(255, 197, 254, 37),
          )),
      onChanged: (value) {
        setState(() {
          nombre = value;
        });
      },
      validator: (valor) {
        if (valor == '') {
          return 'El campo es obligatorio *';
        } else {
          return null;
        }
      },
    );
  }

  Widget descripcionInput(
      context, textFormFieldStyle, textFormFieldStyleWrong) {
    return TextFormField(
      maxLength: 40,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
          enabledBorder: textFormFieldStyle,
          disabledBorder: textFormFieldStyle,
          focusedBorder: textFormFieldStyle,
          errorBorder: textFormFieldStyleWrong,
          focusedErrorBorder: textFormFieldStyleWrong,
          label: const Text(
            "Descripcion de la categoria",
            style: const TextStyle(color: Colors.black),
          ),
          labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          suffixIcon: const Icon(
            FontAwesomeIcons.user,
            color: Color.fromARGB(255, 197, 254, 37),
          )),
      onChanged: (value) {
        setState(() {
          descripcion = value;
        });
      },
    );
  }

  Widget _bottonBack() {
    final ButtonStyle style = ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        primary: const Color.fromARGB(169, 187, 255, 0),
        textStyle: const TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black));
    return ElevatedButton(
      style: style,
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/');
      },
      child: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
    );
  }

  void _registrarCategoria() async {
    dynamic respuesta = await categorieService.register(
      nombre,
      descripcion,
    );

    if (respuesta is Map) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color.fromARGB(255, 197, 254, 37),
            title: const Text(
              "Registro exitoso",
              style: TextStyle(
                color: Colors.white,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(1, 0.5),
                    blurRadius: 1.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ],
              ),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: const [
                  Text(
                    "Producto registrado con exito",
                    style: TextStyle(
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(1, 0.2),
                          blurRadius: 1.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                onPressed: () {
                  // Navigator.pushNamed(context, '/login');
                },
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "ACEPTAR",
                  ),
                ),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color.fromARGB(255, 197, 254, 37),
            title: const Text(
              "ERROR",
              style: TextStyle(
                color: Colors.white,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(1, 0.5),
                    blurRadius: 1.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ],
              ),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: const [
                  Text(
                    'el correo ya esta registrado',
                    style: TextStyle(
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(1, 0.2),
                          blurRadius: 1.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "ACEPTAR",
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
  }
}
