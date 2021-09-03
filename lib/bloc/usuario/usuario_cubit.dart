import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:estados/models/usuario.dart';

part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super(UsuarioInitial());

  void selecccionarUsuario(Usuario user) {
    emit(new UsuarioActivo(user));
  }

  void cambiarEdad(int edad) {
    final currenState = state;
    if (currenState is UsuarioActivo) {
      final newUser = currenState.usario.copyWith(edad: edad);
      emit(UsuarioActivo(newUser));
    }
  }

  void agregarProfesion(String profesion) {
    final currenState = state;
    if (currenState is UsuarioActivo) {
      final nuevaProfesion = [...?currenState.usario.profesiones, profesion];
      final newUser = currenState.usario.copyWith(profesiones: nuevaProfesion);
      emit(UsuarioActivo(newUser));
    }
  }

  void borrarUsuario (){
    emit(UsuarioInitial());
  }
}
