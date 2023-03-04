import 'package:e_commerce/base/base_state.dart';
import 'package:e_commerce/provider/app_config_provider.dart';
import 'package:e_commerce/ui/home/home_screen.dart';
import 'package:e_commerce/ui/login/login_navigator.dart';
import 'package:e_commerce/ui/register/register_viewModel.dart';
import 'package:e_commerce/ui/widgets/custom_form_field.dart';
import 'package:e_commerce/ui/widgets/form_label.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends BaseState<RegisterScreen , RegisterViewModel>
    implements LoginNavigator {
  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var mobileController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var passwordConfirmationController = TextEditingController();

  @override
  RegisterViewModel initViewModel() {
    return RegisterViewModel();

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
                        FormLabel("Full Name"),
                        CustomFormField(
                          "Enter your full name",
                          controller: nameController,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'please enter full name';
                            }
                          },
                        ),
                        FormLabel("Mobile Number"),
                        CustomFormField(
                          "Enter your mobile no.",
                          controller: mobileController,
                          keyboardType: TextInputType.phone,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'please enter phone';
                            }
                          },
                        ),
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
                        FormLabel("Confirm Password"),
                        CustomFormField(
                          "re-enter your password",
                          hideText: true,
                          controller: passwordConfirmationController,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'please confirm password';
                            }
                            if (passwordController.text != text) {
                              return "password doesn't match";
                            }
                          },
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            register();
                          },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w900),
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

  register() async {
    // validate
    if (formKey.currentState?.validate() == false) {
      return;
    }

    viewModel.register(
        nameController.text,
        emailController.text,
        mobileController.text,
        passwordController.text,
        passwordConfirmationController.text);
  }


  @override
  void goToHome() {
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }
}
