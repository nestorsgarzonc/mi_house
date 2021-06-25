import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mi_house/core/modals/modals.dart';
import 'package:mi_house/widgets/image_back_login.dart';
import 'package:mi_house/widgets/label_login.dart';
import 'package:mi_house/core/validators/text_validators.dart';
import 'package:mi_house/features/auth/auth_provider.dart';
import 'package:mi_house/features/auth/models/login_model.dart';
import 'package:mi_house/widgets/buttons/social_network_icon_button.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const route = 'LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formController = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isLoading = false;
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff072863),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Imageback(size: size),
                Container(
                  width: size.width,
                  margin: EdgeInsets.symmetric(
                    vertical: 0.0,
                  ),
                  padding: EdgeInsets.only(top: 20.0, bottom: 31, left: 15.0, right: 15.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      stops: [
                        0.1,
                        0.9,
                      ],
                      colors: [
                        Color(0xff020038),
                        Color(0xff072863),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      LoginLabel(),
                      SizedBox(height: 20.0),
                      const SocialNetworkIcons(),
                      SizedBox(height: 20.0),
                      Form(
                        key: _formController,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _emailController,
                              validator: TextValidators.emailValidator,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                labelText: 'Correo',
                                labelStyle: TextStyle(color: Colors.white),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                prefixIcon: Icon(Icons.email, color: Colors.white),
                              ),
                            ),
                            SizedBox(height: 15.0),
                            TextFormField(
                              controller: _passwordController,
                              validator: TextValidators.passwordValidator,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: _isObscure,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'Contraseña',
                                labelStyle: TextStyle(color: Colors.white),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                prefixIcon: const Icon(Icons.lock, color: Colors.white),
                                suffixIcon: IconButton(
                                    icon: Icon(
                                      _isObscure ? Icons.visibility : Icons.visibility_off,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isObscure = !_isObscure;
                                      });
                                    }),
                              ),
                            ),
                            SizedBox(height: 30.0),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                primary: Color(0xFFFff8154),
                              ),
                              onPressed: handleOnLogin,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 13.0),
                                child: isLoading
                                    ? const Center(child: CircularProgressIndicator())
                                    : Text(
                                        'Iniciar Sesion',
                                        style:
                                            TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                                      ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                '¿Olvidaste tu contraseña?',
                                style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> handleOnLogin() async {
    if (_formController.currentState!.validate()) {
      setState(() => isLoading = true);
      final res = await Provider.of<AuthProvider>(context, listen: false).login(
        LoginModel(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        ),
      );
      setState(() => isLoading = false);
      if (res != null) {
        CustomModals().showError(message: res.message, context: context);
      }
      return;
    }
  }
}
