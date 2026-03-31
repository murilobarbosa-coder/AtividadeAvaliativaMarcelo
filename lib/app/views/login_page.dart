import 'package:flutter/material.dart';
import '../viewmodels/login_viewmodel.dart';
import 'signup_page.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _viewModel = LoginViewModel();

  String? erro;

  void _login() {
    final result = _viewModel.validarLogin(
      _emailController.text,
      _senhaController.text,
    );

    if (result != null) {
      setState(() => erro = result);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _emailController, decoration: const InputDecoration(labelText: 'Email')),
            TextField(controller: _senhaController, decoration: const InputDecoration(labelText: 'Senha'), obscureText: true),
            
            const SizedBox(height: 20),

            ElevatedButton(onPressed: _login, child: const Text('Entrar')),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SignupPage()),
                );
              },
              child: const Text('Criar conta'),
            ),

            if (erro != null)
              Text(erro!, style: const TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}