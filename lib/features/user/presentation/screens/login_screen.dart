import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/components/rounded_btn.dart';
import 'package:obd/core/models/view_states.dart';
import 'package:obd/core/widgets/form_field_widget.dart';
import 'package:obd/features/user/data/models/user_info_model.dart';
import 'package:obd/features/user/presentation/provider/user_login_provider.dart';
import 'package:obd/routes/app_router.gr.dart';
import 'package:obd/utils/regex_constants.dart';

@RoutePage()
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(userLoginProvider, (previous, state) {
      if (state is LoadingViewState) {
        EasyLoading.show(status: 'loading...');
      } else if (state is LoadedViewState<UserInfoModel>) {
        EasyLoading.dismiss();
        context
          ..popRoute()
          ..replaceRoute(const BottomNavBarRoute());
      } else if (state is ErrorViewState) {
        EasyLoading.showError(state.errorMessage);
        context.popRoute();
      }
    });
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 250,
                ),
                FormFieldWidget(
                  controller: _emailController,
                  textInputType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value != null &&
                        !RegexConstants.kEmailRegex.hasMatch(value)) {
                      return "Invalid email";
                    }
                    return null;
                  },
                  prefixWidget: const Icon(Icons.email_outlined),
                  labelText: "Email",
                ),
                FormFieldWidget(
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password can't be empty";
                    }
                    return null;
                  },
                  obscureText: true,
                  prefixWidget: const Icon(Icons.lock_outline),
                  labelText: "Password",
                ),
                TextButton(
                  child: const Text("Don't have account? Sign up"),
                  onPressed: () => context.router.push(const RegisterRoute()),
                ),
                const SizedBox(height: 20),
                RoundedBtn(
                  icon: "assets/images/login.svg",
                  text: "Login",
                  iconSize: 20,
                  onPressed: () => ref.read(userLoginProvider.notifier).login(
                        email: _emailController.text,
                        password: _passwordController.text,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
