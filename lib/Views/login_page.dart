import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/Controller/simple_ui.dart';
import 'package:flutter_application_1/style/style_login.dart';
import 'package:flutter_application_1/Views/home_page.dart';
import 'package:flutter_application_1/Views/signup_page.dart';
import 'package:flutter_application_1/Views/reset_password_page.dart';

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

  static const Color kHondaRed = Color.fromARGB(255, 228, 5, 33);

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
        backgroundColor: const Color.fromARGB(255, 248, 246, 246),
        resizeToAvoidBottomInset: false,
        body: LayoutBuilder(
          builder: (context, constraints) {
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

  // Large Screen
  Widget _buildLargeScreen(
    Size size,
    SimpleUIController simpleUIController,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/honda_image.jpg',
                height: size.height * 0.8,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: size.width * 0.08),
          Expanded(
            flex: 5,
            child: _buildMainBody(size, simpleUIController),
          ),
        ],
      ),
    );
  }

  // Small Screen
  Widget _buildSmallScreen(
    Size size,
    SimpleUIController simpleUIController,
  ) {
    return Center(
      child: _buildMainBody(size, simpleUIController),
    );
  }

  /// Main Body
  Widget _buildMainBody(
    Size size,
    SimpleUIController simpleUIController,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: size.width > 600
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,
      children: [
        size.width > 600
            ? Container()
            : ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/honda_image.jpg',
                  height: size.height * 0.2,
                  width: size.width,
                  fit: BoxFit.cover,
                ),
              ),
        SizedBox(height: size.height * 0.03),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  Text(
                'LOGIN',
                style: TextStyle(
                  color: Color.fromARGB(150, 0, 0, 0),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Keluarga Honda',
                style: kmyLoginTextStyle(size),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Selamat Datang Kembali di Dealer Honda Terpercaya',
            style: kmyTitleTextStyle(size),
          ),
        ),
        SizedBox(height: size.height * 0.03),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                /// Username or Gmail
                TextFormField(
                  style: kTextFormFieldStyle(),
                  decoration: InputDecoration(
                    hintStyle:
                        const TextStyle(color: Color.fromARGB(255, 107, 101, 101)),
                    prefixIcon:
                        const Icon(Icons.person, color: Color.fromARGB(255, 0, 0, 0)),
                    hintText: 'Username or Gmail',
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Color.fromARGB(255, 107, 101, 101)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Color.fromARGB(255, 107, 101, 101)),
                    ),
                  ),
                  controller: namaController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter username';
                    } else if (value.length < 4) {
                      return 'at least enter 4 characters';
                    } else if (value.length > 13) {
                      return 'maximum character is 13';
                    }
                    return null;
                  },
                ),
                SizedBox(height: size.height * 0.02),

                /// Password
                Obx(
                  () => TextFormField(
                    style: kTextFormFieldStyle(),
                    controller: passwordController,
                    obscureText: simpleUIController.isObscure.value,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(color: Color.fromARGB(135, 0, 0, 0)),
                      prefixIcon: const Icon(Icons.lock_open,
                          color: Color.fromARGB(255, 0, 0, 0)),
                      suffixIcon: IconButton(
                        icon: Icon(
                          simpleUIController.isObscure.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                        onPressed: () {
                          simpleUIController.isObscureActive();
                        },
                      ),
                      hintText: 'Password',
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Color.fromARGB(255, 107, 101, 101)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Color.fromARGB(255, 107, 101, 101)),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Color.fromARGB(255, 107, 101, 101)),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 7) {
                        return 'Password must be at least 7 characters';
                      } else if (value.length > 13) {
                        return 'Password must not exceed 13 characters';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => const ResetPasswordPage());
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: kHondaRed,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),

                loginButton(),
                SizedBox(height: size.height * 0.03),

                GestureDetector(
                  onTap: () {
                    namaController.clear();
                    emailController.clear();
                    passwordController.clear();
                    _formKey.currentState?.reset();
                    simpleUIController.isObscure.value = true;
                    Get.to(() => const SignUpView());
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Don\'t have an account?',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0), fontSize: 16),
                      children: [
                        TextSpan(
                          text: ' Sign up',
                          style: kLoginOrSignUpTextStyle(size),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Login Button
  Widget loginButton() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(kHondaRed),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Get.offAll(() => HomePage());
          }
        },
        child: const Text('Login',
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 18)),
      ),
    );
  }
}