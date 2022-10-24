import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/components/rounded_btn.dart';
import 'package:flutter_login/home/home.dart';
import 'package:flutter_login/login/login.dart';
import 'package:flutter_login/register/register.dart';
import 'package:flutter_login/theme/constants.dart';
import 'package:formz/formz.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                                SizedBox(
                  height: 30,
                ),
                Text(
                  "User information",
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  height: 30,
                ),
                Divider(),
                // Image.asset(
                //   'assets/images/logo.png',
                //   height: 200,
                // ),
                SizedBox(
                  height: 30,
                ),
                _NameInput(),
                SizedBox(
                  height: 30,
                ),
                _PhoneInput(),
                SizedBox(
                  height: 30,
                ),
                _PasswordInput(),
                SizedBox(
                  height: 30,
                ),
                // TextButton(
                //   child: Text("Dont't have account? Sign up"),
                //   onPressed: () => {
                //      Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => const LoginPage()),
                //     );
                //   },
                // ),
                Text(
                  "Car information",
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  height: 30,
                ),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                _BrandInput(),
                SizedBox(
                  height: 20,
                ),
                _TypeInput(),
                SizedBox(
                  height: 20,
                ),
                _YearInput(),
                // _ReviewInput(),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 30,
                ),
                _LoginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('RegisterForm_nameInput_textField'),
      decoration: InputDecoration(
        labelText: 'Name',
      ),
    );
  }
}

class _PhoneInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('RegisterForm_phoneInput_textField'),
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: 'Phone',
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('RegisterForm_passwordInput_textField'),
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'password',
      ),
    );
  }
}

class _YearInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 80,
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
        hint: Text("Model Year"),
        // value: '2018',
        borderRadius: BorderRadius.circular(10),
        items: <String>['2017', '2018', '2019', '2020', '2021', '2022']
            .map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (_) {},
      ),
    );
  }
}

class _TypeInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 80,
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
        hint: Text("Your Car Type"),
        borderRadius: BorderRadius.circular(10),
        // value: 'I20',
        items: <String>['VENUE', 'I20', 'TUCSON', 'ELENTRA', 'ACCENT']
            .map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (_) {},
      ),
    );
  }
}

class _BrandInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 80,
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
        hint: Text("Car Brand"),
        // value: 'Hyundai',
        borderRadius: BorderRadius.circular(10),
        items: <String>['Hyundai', 'BMW', 'AUDI', 'NISSAN', 'TOYOTA']
            .map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (_) {},
      ),
    );
  }
}




class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoundedBtn(
      icon: "assets/images/login.svg",
      text: "Register",
      iconSize: 20,
      onPressed: () {
        final snackBar = SnackBar(
            behavior: SnackBarBehavior.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0,
            content: Container(
                margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height - 200,
                ),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: AppTheme.mainGredient,
                  boxShadow: [
                    AppTheme.mainShadow,
                  ],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.check_outlined),
                    Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Account registered successfully',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                  ],
                )),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      },
    );
  }
}