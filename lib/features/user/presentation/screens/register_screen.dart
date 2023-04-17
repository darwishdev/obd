import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/components/rounded_btn.dart';
import 'package:obd/core/models/view_states.dart';
import 'package:obd/core/widgets/form_field_widget.dart';
import 'package:obd/features/cars/presentations/provider/selected_car_provider.dart';
import 'package:obd/features/cars/presentations/screens/car_brands_view.dart';
import 'package:obd/features/cars/presentations/screens/car_models_view.dart';
import 'package:obd/features/cars/presentations/screens/car_years_view.dart';
import 'package:obd/features/user/data/models/user_info_model.dart';
import 'package:obd/features/user/domain/usecases/register.dart';
import 'package:obd/features/user/presentation/provider/user_register_provider.dart';
import 'package:obd/routes/app_router.gr.dart';
import 'package:obd/theme/dimensions.dart';
import 'package:obd/utils/regex_constants.dart';

@RoutePage()
class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  _register() {
    if (_formKey.currentState!.validate() &&
        ref.read(selectedCarModelProvider)?.carBrandModelId != null &&
        ref.read(selectedCarYearProvider) != null) {
      ref.read(userRegisterProvider.notifier).register(
            RegisterParams(
              name: _nameController.text,
              phone: _phoneController.text,
              email: _emailController.text,
              password: _passwordController.text,
              carBrandModel: int.parse(
                  ref.read(selectedCarModelProvider)!.carBrandModelId!),
              carYear: int.parse(ref.read(selectedCarYearProvider)!),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(userRegisterProvider, (previous, state) {
      if (state is LoadingViewState) {
        EasyLoading.show(status: 'loading...');
      } else if (state is LoadedViewState<UserInfoModel>) {
        EasyLoading.showSuccess("Registered successfully");
        context
          ..popRoute()
          ..replaceRoute(const ConnectPage());
      } else if (state is ErrorViewState) {
        EasyLoading.showError(state.errorMessage);
        context.popRoute();
      }
    });
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              vertical: AppDimensions.kSizeSmall,
              horizontal: AppDimensions.kSizeMedium,
            ),
            child: Column(
              children: [
                const SizedBox(height: 40),
                const Text("User information"),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
                  child: Divider(),
                ),
                FormFieldWidget(
                  controller: _nameController,
                  textInputType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name can't be empty";
                    }
                    return null;
                  },
                  prefixWidget: const Icon(Icons.person_outline),
                  labelText: "Name",
                ),
                FormFieldWidget(
                  controller: _emailController,
                  textInputType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email can't be empty";
                    }
                    if (!RegexConstants.kEmailRegex.hasMatch(value)) {
                      return "Invalid email";
                    }
                    return null;
                  },
                  prefixWidget: const Icon(Icons.email_outlined),
                  labelText: "Email",
                ),
                FormFieldWidget(
                  controller: _phoneController,
                  textInputType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Phone can't be empty";
                    }
                    if (value.length < 11) {
                      return "Phone number must be 11 digits";
                    }
                    if (value.length > 11) {
                      return "Phone number must be 11 digits";
                    }
                    if (!value.startsWith("01")) {
                      return "Phone number must start with 01";
                    }
                    return null;
                  },
                  prefixWidget: const Icon(Icons.phone_outlined),
                  labelText: "Phone",
                ),
                FormFieldWidget(
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password can't be empty";
                    }
                    if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }

                    return null;
                  },
                  prefixWidget: const Icon(Icons.lock_outline),
                  labelText: "Password",
                ),
                const SizedBox(height: 20),
                const Text("Car information"),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
                  child: Divider(),
                ),
                Consumer(builder: (context, ref, _) {
                  return Column(
                    children: [
                      const CarBrandsView(),
                      if (ref.watch(selectedCarBrandProvider) != null)
                        const CarModelsView(),
                      if (ref.watch(selectedCarModelProvider) != null &&
                          ref.watch(selectedCarBrandProvider) != null)
                        const CarYearsView(),
                    ],
                  );
                }),
                const SizedBox(height: 50),
                RoundedBtn(
                  icon: "assets/images/login.svg",
                  text: "Register",
                  iconSize: 20,
                  onPressed: _register,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
