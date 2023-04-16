import 'package:flutter/material.dart';
import 'package:obd/components/rating.dart';
import 'package:obd/components/rounded_btn.dart';
import 'package:obd/theme/constants.dart';

class ReviewForm extends StatefulWidget {
  const ReviewForm({super.key});
  @override
  State<ReviewForm> createState() => _ReviewFormState();
}

class _ReviewFormState extends State<ReviewForm> {
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image.asset(
            //   'assets/images/logo.png',
            //   height: 200,
            // ),
            Text("Add New Review"),
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            _CenterInput(),
            const Padding(padding: EdgeInsets.all(12)),
            _ReviewInput(),
            Container(
              padding: EdgeInsets.only(top: 30),
              child: const Text("Your Rate"),
              alignment: Alignment.topLeft,
            ),
            const Padding(padding: EdgeInsets.all(12)),
            StarRating(
              rating: rating,
              onRatingChanged: (rating) => setState(() => rating = rating),
            ),
            const Padding(padding: EdgeInsets.all(12)),
            _SubmitButton(),
          ],
        ),
      ),
    );
  }
}

class _CenterInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 80,
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
        hint: Text("Center"),
        borderRadius: BorderRadius.circular(10),
        items: <String>['Center 1', 'Center 2', 'Center 3', 'Center 4']
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

class _ReviewInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('ReviewForm_ReviewInput_textField'),
      maxLines: null,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        labelText: 'Review',
        // errorText: state.password.invalid ? 'invalid review' : null,
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
                          'Review added successfully',
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
