import 'package:flutter/material.dart';
import 'package:obd/components/bottom_nav.dart';
import 'package:obd/components/rounded_btn.dart';
import 'package:obd/theme/constants.dart';

class EditCarPage extends StatefulWidget {
  const EditCarPage({super.key});
  @override
  State<EditCarPage> createState() => _EditCarPageState();
}

class _EditCarPageState extends State<EditCarPage> {
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image.asset(
              //   'assets/images/logo.png',
              //   height: 200,
              // ),
              Text(
                "Edit Your Car",
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
              _SubmitButton(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(),
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
        value: '2018',
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
        value: 'I20',
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
        value: 'Hyundai',
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

class _SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoundedBtn(
        icon: "assets/images/submit.svg",
        text: "Submit",
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
                          'Car edited successfully',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                  ],
                )),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.pop(context);
        });
  }
}
