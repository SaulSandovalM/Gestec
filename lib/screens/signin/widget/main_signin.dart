import 'package:gestec/core/widgets/button.dart';
import 'package:gestec/core/widgets/container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gestec/core/widgets/feature_item.dart';
import 'package:gestec/core/widgets/input.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class MainSignIn extends StatefulWidget {
  final double headerHeight;

  const MainSignIn({super.key, required this.headerHeight});

  @override
  MainSignInState createState() => MainSignInState();
}

class MainSignInState extends State<MainSignIn> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;

  Future<void> _signIn() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (!mounted) return;
      context.go('/dashboard');
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      _showAuthError(e.code);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _showAuthError(String errorCode) {
    final errorMessages = {
      'invalid-email': 'El correo electrónico no es válido.',
      'invalid-credential': 'Las credenciales no son válidas.',
      'user-disabled': 'El usuario ha sido deshabilitado.',
      'user-not-found': 'No se encontró un usuario con ese correo.',
      'wrong-password': 'La contraseña es incorrecta.',
    };

    final errorMessage = errorMessages[errorCode] ??
        'Ocurrió un error: $errorCode. Inténtalo de nuevo.';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: $errorMessage')),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double availableHeight = screenHeight - widget.headerHeight;

    return MainContainer(
      child: SizedBox(
        height: availableHeight,
        width: 1200,
        child: Row(
          children: [
            const Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '🌐 Gestec',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 40),
                    FeatureItem(
                      icon: Icons.settings,
                      title: 'Objetivo general',
                      description:
                          'Integrar información de manera periódica, a partir de informes históricos presentados en las Sesiones de los Órganos de Gobierno, para el análisis y evaluación constante, respetando la integridad de sus datos a través de distintos niveles de seguridad informática.',
                    ),
                    SizedBox(height: 20),
                    FeatureItem(
                      icon: Icons.build,
                      title: 'Misión',
                      description:
                          'Facilitar el Control y Seguimiento de Entidades Paraestatales a través de la sistematización de procesos que permitan la evaluación constante de estas así como la generación de diagnósticos que permitan el cumplimiento del objeto su creación, manejado la información sustantiva generada a partir de sus Sesiones de Órgano de Gobierno e Información normativa.',
                    ),
                    SizedBox(height: 20),
                    FeatureItem(
                      icon: Icons.thumb_up_alt,
                      title: 'Visión',
                      description:
                          'Ser un referente en la implementación de tecnologías enfocadas al e-gobierno que permita la dinamización de procedimientos en el análisis y evaluación de las Entidades Paraestatales manteniendo la integridad de la información y el almacenamiento histórico.',
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: SizedBox(
                  height: 600,
                  child: Card(
                    color: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.black54,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(
                          8), // Opcional: bordes redondeados
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Bienvenido',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Input(
                                controller: _emailController,
                                label: 'Correo electrónico',
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Ingresa tu correo';
                                  }
                                  if (!value.contains('@')) {
                                    return 'Correo inválido';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              const Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '¿Olvidaste tu contraseña?',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 6),
                              Input(
                                controller: _passwordController,
                                label: 'Contraseña',
                                obscureText: true,
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Expanded(
                                    child: Button(
                                      title: 'Entrar',
                                      onPressed: _signIn,
                                      isLoading: _isLoading,
                                      backgroundColor: Colors.black,
                                      textColor: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
