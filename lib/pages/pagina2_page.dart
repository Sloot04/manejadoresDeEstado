import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados/bloc/usuario/usuario_cubit.dart';
import 'package:estados/models/usuario.dart';

class Pagina2Page extends StatefulWidget {
  @override
  _Pagina2PageState createState() => _Pagina2PageState();
}

class _Pagina2PageState extends State<Pagina2Page> {
  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UsuarioCubit>();
    return Scaffold(
      appBar: AppBar(
        title: (usuarioCubit.state.runtimeType == UsuarioActivo)
            ? Text((usuarioCubit.state as UsuarioActivo).usario.nombre)
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
                final newUser = new Usuario(
                    nombre: 'Fernando',
                    edad: 34,
                    profesiones: [
                      'FullStack Developer',
                      'Videojugador Veterano'
                    ]);
                usuarioCubit.selecccionarUsuario(newUser);
                setState(() {});
              }),
          MaterialButton(
            child: Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
            color: Colors.blue,
            onPressed: () {
              usuarioCubit.cambiarEdad(35);
            },
          ),
          MaterialButton(
            child:
                Text('Añadir Profesion', style: TextStyle(color: Colors.white)),
            color: Colors.blue,
            onPressed: () {
              usuarioCubit.agregarProfesion('Profesor');
            },
          )
        ],
      )),
    );
  }
}
