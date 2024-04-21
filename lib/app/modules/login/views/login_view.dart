import 'package:barokah_cars_project/app/modules/login/views/widgets/create_account_button.dart';
import 'package:barokah_cars_project/app/modules/login/views/widgets/forget_password.dart';
import 'package:barokah_cars_project/app/modules/login/views/widgets/form_divider.dart';
import 'package:barokah_cars_project/app/modules/login/views/widgets/login_button.dart';
import 'package:barokah_cars_project/app/modules/login/views/widgets/login_form.dart';
import 'package:barokah_cars_project/app/modules/login/views/widgets/login_header.dart';
import 'package:barokah_cars_project/utils/constants/text_strings.dart';
import 'package:barokah_cars_project/utils/widgets/google_authentication.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.loginFormKey,
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, top: 80, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // -- Header
                const BaroFormHeader(headerTitle: BaroTexts.loginTitle, headerDesc: BaroTexts.loginDesc,),
                const SizedBox(height: 16,),
                
                // -- Form
                const BaroLoginForm(),
                
                // -- Forget Password
                const BaroForgetPassword(),
        
                // -- Login Button
                BaroLoginButton(
                  onPressed: (){
                    // if (controller.loginFormKey.currentState!.validate()){
                    //   String? storedUsername = GetStorage().read('username');
                    //   String? storedPassword = GetStorage().read('password');
        
                    //   if (controller.username.text == storedUsername && controller.password.text == storedPassword) {
        
                    //     Get.toNamed(Routes.HOME);
                    //   } else {
                    //     Get.snackbar('Error', 'Username atau password salah.', backgroundColor: Colors.white, borderColor: const Color(0xFFE82027));
                    //   }
                    // }
                  }
                  ),
                const SizedBox(height: 16,),
        
                // -- Create Account
                const BaroCreateAccountButton(),
                const SizedBox(height: 20,),
        
                // -- Divider
                const BaroFormDivider(),
                const SizedBox(height: 20,),
        
                // -- Footer
                const ContinueWithGoogle(),
              ],
            )
          ),
        )
      ),
    );
  }
}