import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_services.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => usuarioService.removerUsuario(),
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: usuarioService.existeUsuario
          ? InformacionUsuario(usuarioService.usuario)
          : Center(child: Text('No hay usuario seleccionado')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
        child: Icon(Icons.chevron_right),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;

  const InformacionUsuario(this.usuario);

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
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
          usuarioService.existeUsuario
              ? Container(
                width: double.infinity * 0.9,
                height: 300,
                child: ListView.builder(
                    itemCount: usuario.profesiones!.length,
                    itemBuilder: (_, int index) {
                      return ListTile(
                          title:
                              Text(usuario.profesiones![index]));
                    },
                  ),
              )
              : Text('Sin profesion'),
         
        ],
      ),
    );
  }
}
