import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/components/rounded_btn.dart';
import 'package:obd/core/repositories/token_repository.dart';
import 'package:obd/features/cars/presentations/provider/selected_car_provider.dart';
import 'package:obd/features/cars/presentations/screens/car_brands_view.dart';
import 'package:obd/features/cars/presentations/screens/car_models_view.dart';
import 'package:obd/features/cars/presentations/screens/car_years_view.dart';

@RoutePage()
class EditCarScreen extends StatelessWidget {
  const EditCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: const [
            Text(
              'Edit Car',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'Edit your car details',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          children: [
            Consumer(builder: (context, ref, _) {
              final repo = ref.watch(tokenRepositoryProvider);

              return Column(
                children: [
                  CarBrandsView(value: repo.userInfo?.car?.carBrandId),
                  if (ref.watch(selectedCarBrandProvider) != null)
                    CarModelsView(value: repo.userInfo?.car?.carBrandModelId),
                  if (ref.watch(selectedCarBrandProvider) != null)
                    CarYearsView(value: repo.userInfo?.car?.modelYear),
                ],
              );
            }),
            const SizedBox(height: 40),
            Consumer(builder: (context, ref, _) {
              return RoundedBtn(
                icon: "assets/images/submit.svg",
                text: "Submit",
                iconSize: 20,
                //TODO check if it works
                // onPressed: () => ref.read(updateCarProvider.notifier).updateCar(
                // UpdateCarParams(
                //   carBrandId: ref.watch(selectedCarBrandProvider).id,
                //   carBrandModelId: ref.watch(selectedCarModelProvider).id,
                //   modelYear: ref.watch(selectedCarYearProvider).id,
                // ),
                // ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
