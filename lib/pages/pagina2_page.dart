import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:estados/controllers/usuario_controller.dart';
import 'package:estados/models/usuario.dart';

class Pagina2Page extends StatefulWidget {
  @override
  _Pagina2PageState createState() => _Pagina2PageState();
}

class _Pagina2PageState extends State<Pagina2Page> {
  @override
  Widget build(BuildContext context) {
    final usuarioCtr = Get.find<UsuarioController>();
    // print(Get.arguments['nombre']);
    return Scaffold(
      appBar: AppBar(
        title: usuarioCtr.existeUsuario.value
            ? Text(usuarioCtr.usuario.value.nombre!)
            : Text('Pagina 2'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            child: Text('Establecer Usuario',
                style: TextStyle(color: Colors.white)),
            color: Colors.blue,
            onPressed: () {
              usuarioCtr.cargarUsuario(Usuario(nombre: 'Fernando', edad: 35));
              Get.snackbar(
                  'Usuario establecido', 'Fernando es el nombre del usuario',
                  colorText: Colors.black87,
                  backgroundColor: Colors.white,
                  boxShadows: [
                    BoxShadow(color: Colors.black38, blurRadius: 10)
                  ]);
              setState(() {});
            },
          ),
          MaterialButton(
            child: Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
            color: Colors.blue,
            onPressed: () {
              usuarioCtr.cambiarEdad(25);
            },
          ),
          MaterialButton(
            child:
                Text('Añadir Profesion', style: TextStyle(color: Colors.white)),
            color: Colors.blue,
            onPressed: () {
              usuarioCtr.agregarProfesion(
                  'Profesión ${usuarioCtr.profesionesCount + 1}');
            },
          ),
          MaterialButton(
            child:
                Text('Cambiar tema', style: TextStyle(color: Colors.white)),
            color: Colors.blue,
            onPressed: () {
              Get.changeTheme(Get.isDarkMode ? ThemeData.light() :ThemeData.dark());
            },
          )
        ],
      )),
    );
  }
}
