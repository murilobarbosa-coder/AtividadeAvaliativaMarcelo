import '../data/usuario_mock_store.dart';

class LoginViewModel {
  String? validarLogin(String email, String senha) {
    if (email.isEmpty || senha.isEmpty) {
      return 'Preencha todos os campos';
    }

    final user = UsuarioMockStore.autenticar(email, senha);

    if (user == null) {
      return 'Usuário ou senha inválidos';
    }

    return null; // sucesso
  }
}