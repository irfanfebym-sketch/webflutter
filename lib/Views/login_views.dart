import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_application_1/Controller/simple_ui.dart';
import 'package:flutter_application_1/style.dart';

class LoginView extends StatefulWidget {
const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    namaController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

@override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    SimpleUIController simpleUIController = Get.put(SimpleUIController());
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder (
            builder : (context, constraints) {
            if (constraints.maxWidth > 600) {
              return _buildLargeScreen(size, simpleUIController);
            } else {
              return _buildSmallScreen(size, simpleUIController);
            }
          },
        ),
      ),
    );
  }

  Widget _buildLargeScreen(Size size, SimpleUIController controller) {
    return const Center(child: Text('Layar Besar'));
  }

  Widget _buildSmallScreen(Size size, SimpleUIController controller) {
    return const Center(child: Text('Layar Kecil'));
  }
}