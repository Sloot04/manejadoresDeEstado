import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados/models/usuario.dart';
import 'package:estados/bloc/usuario/usuario_bloc.dart';

class Pagina2Page extends StatefulWidget {
  @override
  _Pagina2PageState createState() => _Pagina2PageState();
}

class _Pagina2PageState extends State<Pagina2Page> {
  @override
  Widget build(BuildContext context) {
    final usuarioBloc = BlocProvider.of<UsuarioBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: usuarioBloc.state.usuario != null
            ? Text(usuarioBloc.state.usuario!.nombre)
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
                  profesiones: ['Fullstack Developer']);
              usuarioBloc.add(ActivarUsuario(newUser));
              setState(() {});
            },
          ),
          MaterialButton(
            child: Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
            color: Colors.blue,
            onPressed: () {
              usuarioBloc.add(CambiarEdad(30));
            },
          ),
          MaterialButton(
            child:
                Text('Añadir Profesion', style: TextStyle(color: Colors.white)),
            color: Colors.blue,
            onPressed: () {
              usuarioBloc.add(AgregarProfesion('Profesor'));
            },
          )
        ],
      )),
    );
  }
}
