import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:estados/models/usuario.dart';

part 'usuario_state.dart';
part 'usuario_event.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  UsuarioBloc() : super(UsuarioState());

  @override
  Stream<UsuarioState> mapEventToState(UsuarioEvent event) async* {
    if (event is ActivarUsuario) {
      yield UsuarioState(user: event.usuario);
    }
  }
}
