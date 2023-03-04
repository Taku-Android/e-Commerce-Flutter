import 'dart:typed_data';

import 'package:e_commerce/api/api_manager.dart';
import 'package:e_commerce/base/base_state.dart';
import 'package:e_commerce/provider/app_config_provider.dart';
import 'package:e_commerce/ui/dialogUtils.dart';
import 'package:e_commerce/ui/home/home_screen.dart';
import 'package:e_commerce/ui/login/login_navigator.dart';
import 'package:e_commerce/ui/login/login_viewModel.dart';
import 'package:e_commerce/ui/register/register_screen.dart';
import 'package:e_commerce/ui/widgets/custom_form_field.dart';
import 'package:e_commerce/ui/widgets/form_label.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen , LoginViewModel> implements LoginNavigator {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();


  @override
  LoginViewModel initViewModel() {
    return LoginViewModel();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    viewModel.appConfigProvider = Provider.of<AppConfigProvider>(context);

    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Scaffold(
        appBar: AppBar(),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset("assets/images/route_logo.png"),
                const SizedBox(
                  height: 25,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        FormLabel(
                          "E-mail Address",
                        ),
                        CustomFormField(
                          "Enter your email address",
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'please enter email';
                            }
                          },
                        ),
                        FormLabel("Password"),
                        CustomFormField(
                          "Enter your password",
                          hideText: true,
                          controller: passwordController,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'please enter password';
                            }
                          },
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          margin: EdgeInsets.only(bottom: 50),
                          child: FormLabel("Forget Password"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            login();
                          },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(left: 30),
                          margin: EdgeInsets.only(top: 50),
                          child: Row(
                            children: [
                              Text(
                                'Don`t have an account? ',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(RegisterScreen.routeName);
                                },
                                child: Text(
                                  'Create Account',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  login() async {
    // validate
    if (formKey.currentState?.validate() == false) {
      return;
    }

    viewModel.login(emailController.text, passwordController.text);
  }



  @override
  void goToHome() {
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }

}
