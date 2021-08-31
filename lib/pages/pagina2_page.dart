import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';

import 'package:estados/services/usuarios_services.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
        stream: usuarioService.usuarioStream,
        
        builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
         return snapshot.hasData
          ? Text(usuarioService.usuario!.nombre)
          : Text('Pagina 2');
        },
      ),
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
              final nuevoUsuario = new Usuario(nombre: 'Fernando', edad: 35);
              usuarioService.cargarUsuario(nuevoUsuario);
            },
          ),
           MaterialButton(
            child: Text('Cambiar Edad',
                style: TextStyle(color: Colors.white)),
            color: Colors.blue,
            onPressed: () {
              usuarioService.cambiarEdad(30);
            },
          ),
           MaterialButton(
            child: Text('Añadir Profesion',
                style: TextStyle(color: Colors.white)),
            color: Colors.blue,
            onPressed: () {},
          )
        ],
      )),
    );
  }
}
