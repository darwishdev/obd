import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/components/bottom_nav.dart';
import 'package:flutter_login/login/login.dart';
import 'package:flutter_login/reviews/view/view.dart';

class CreateReviewPage extends StatelessWidget {
  const CreateReviewPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const CreateReviewPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) {
            return LoginBloc(
              authenticationRepository:
                  RepositoryProvider.of<AuthenticationRepository>(context),
            );
          },
          child: const ReviewForm(),
        ),
      ),
        bottomNavigationBar: BottomNav()
    );
  }
}
