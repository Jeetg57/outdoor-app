import 'package:flutter/material.dart';
import 'package:flutter_app/app/controllers/authentication_controller.dart';
import 'package:flutter_app/resources/widgets/logo_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

class LoginPage extends NyStatefulWidget {
  static const path = '/login';

  LoginPage() : super(path, child: _LoginPageState());
}

class _LoginPageState extends NyState<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  init() async {
    super.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Logo(),
              Text("Login"),
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  var result = await AuthenticationController().login(
                      username: usernameController.text,
                      password: passwordController.text);

                  if (result != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(result),
                      ),
                    );
                  }
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
