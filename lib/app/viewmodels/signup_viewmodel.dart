import '../data/usuario_mock_store.dart';
import '../models/usuario_model.dart';

class SignupViewModel {
  String? cadastrar(String nome, String email, String senha) {
    if (nome.isEmpty || email.isEmpty || senha.isEmpty) {
      return 'Preencha todos os campos';
    }

    if (UsuarioMockStore.usuarioExiste(email)) {
      return 'Usuário já existe';
    }

    final novoUsuario = UsuarioModel(
      nome: nome,
      email: email,
      senha: senha,
    );

    UsuarioMockStore.adicionarUsuario(novoUsuario);

    return null; // sucesso
  }
}