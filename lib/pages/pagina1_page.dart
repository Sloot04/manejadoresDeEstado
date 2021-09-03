import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados/bloc/usuario/usuario_cubit.dart';
import 'package:estados/models/usuario.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => context.read<UsuarioCubit>().borrarUsuario(),
            icon: Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
        child: Icon(Icons.chevron_right),
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (_, state) {
        switch (state.runtimeType) {
          case UsuarioInitial:
            return Center(child: Text('No hay información del usuario'));

          case UsuarioActivo:
            return InformacionUsuario((state as UsuarioActivo).usario);

          default:
            return Center(child: Text('Estado no reconocido'));
        }
      },
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;

  const InformacionUsuario(this.usuario);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('General',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile(title: Text('Nombre: ${usuario.nombre}')),
          ListTile(title: Text('Edad: ${usuario.edad}')),
          Text('Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          usuario.profesiones != null
              ? Container(
                  width: double.infinity * 0.9,
                  height: 300,
                  child: ListView.builder(
                    itemCount: usuario.profesiones!.length,
                    itemBuilder: (_, int index) {
                      return ListTile(title: Text(usuario.profesiones![index]));
                    },
                  ),
                )
              : Text('Sin profesion'),
        ],
      ),
    );
  }
}
