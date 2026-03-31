import '../models/usuario_model.dart';

class UsuarioMockStore {
  static final List<UsuarioModel> _usuarios = [];

  static void adicionarUsuario(UsuarioModel usuario) {
    _usuarios.add(usuario);
  }

  static UsuarioModel? autenticar(String email, String senha) {
    try {
      return _usuarios.firstWhere(
        (user) => user.email == email && user.senha == senha,
      );
    } catch (e) {
      return null;
    }
  }

  static bool usuarioExiste(String email) {
    return _usuarios.any((user) => user.email == email);
  }
}