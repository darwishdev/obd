import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/components/rounded_btn.dart';
import 'package:obd/features/cars/domain/usecases/update_cars.dart';
import 'package:obd/features/cars/presentations/provider/selected_car_provider.dart';
import 'package:obd/features/cars/presentations/provider/update_car_provider.dart';
import 'package:obd/features/cars/presentations/screens/car_brands_view.dart';
import 'package:obd/features/cars/presentations/screens/car_models_view.dart';
import 'package:obd/features/cars/presentations/screens/car_years_view.dart';

class EditCarModelScreen extends ConsumerWidget {
  const EditCarModelScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      child: Column(
        children: [
          const CarBrandsView(),
          if (ref.watch(selectedCarBrandProvider) != null)
            const CarModelsView(),
          if (ref.watch(selectedCarModelProvider) != null &&
              ref.watch(selectedCarBrandProvider) != null)
            const CarYearsView(),
          const SizedBox(height: 40),
          RoundedBtn(
            icon: "assets/images/submit.svg",
            text: "Submit",
            iconSize: 20,
            onPressed: () {
              if (ref.watch(selectedCarModelProvider) == null ||
                  ref.watch(selectedCarYearProvider) == null) {
                EasyLoading.showError('Please select car model and year');
                return;
              }
              ref.read(updateCarProvider.notifier).updateCar(
                    UpdateCarParams(
                      carBrandModelId:
                          ref.read(selectedCarModelProvider)!.carBrandModelId!,
                      carYear: ref.read(selectedCarYearProvider)!,
                    ),
                  );
            },
          ),
        ],
      ),
    );
  }
}
