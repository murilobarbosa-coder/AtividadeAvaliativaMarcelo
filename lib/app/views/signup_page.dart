import 'package:flutter/material.dart';
import '../viewmodels/signup_viewmodel.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _nome = TextEditingController();
  final _email = TextEditingController();
  final _senha = TextEditingController();
  final _viewModel = SignupViewModel();

  String? mensagem;

  void _cadastrar() {
    final result = _viewModel.cadastrar(
      _nome.text,
      _email.text,
      _senha.text,
    );

    if (result != null) {
      setState(() => mensagem = result);
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _nome, decoration: const InputDecoration(labelText: 'Nome')),
            TextField(controller: _email, decoration: const InputDecoration(labelText: 'Email')),
            TextField(controller: _senha, decoration: const InputDecoration(labelText: 'Senha'), obscureText: true),

            const SizedBox(height: 20),

            ElevatedButton(onPressed: _cadastrar, child: const Text('Cadastrar')),

            if (mensagem != null)
              Text(mensagem!, style: const TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}