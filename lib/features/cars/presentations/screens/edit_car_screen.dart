import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/components/rounded_btn.dart';
import 'package:obd/core/models/view_states.dart';
import 'package:obd/core/repositories/token_repository.dart';
import 'package:obd/features/cars/domain/usecases/update_cars.dart';
import 'package:obd/features/cars/presentations/provider/selected_car_provider.dart';
import 'package:obd/features/cars/presentations/provider/update_car_provider.dart';
import 'package:obd/features/cars/presentations/screens/car_brands_view.dart';
import 'package:obd/features/cars/presentations/screens/car_models_view.dart';
import 'package:obd/features/cars/presentations/screens/car_years_view.dart';
import 'package:obd/utils/ui_helper.dart';

@RoutePage()
class EditCarScreen extends ConsumerWidget {
  const EditCarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(tokenRepositoryProvider);

    ref.listen(updateCarProvider, (previous, state) {
      if (state is LoadingViewState) {
        UiHelper.showLoadingDialog(context);
      } else if (state is LoadedViewState) {
        Navigator.of(context)
          ..pop()
          ..pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Car updated successfully')),
        );
      } else if (state is ErrorViewState) {
        context.popRoute();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.errorMessage)),
        );
      }
    });
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
            CarBrandsView(
              value: ref.watch(selectedCarBrandProvider)?.carBrandId ??
                  repo.userInfo?.car?.carBrandId,
            ),
            if (ref.watch(selectedCarBrandProvider) != null)
              CarModelsView(
                value: ref.watch(selectedCarModelProvider)?.carBrandModelId ??
                    repo.userInfo?.car?.carBrandModelId,
              ),
            if (ref.watch(selectedCarModelProvider) != null||
                repo.userInfo?.car?.carBrandModelId!=null)
              CarYearsView(
                value: ref.watch(selectedCarYearProvider) ??
                    repo.userInfo?.car?.modelYear,
              ),
            const SizedBox(height: 40),
            RoundedBtn(
              icon: "assets/images/submit.svg",
              text: "Submit",
              iconSize: 20,
              onPressed: () {
                if (ref.watch(selectedCarModelProvider) != null &&
                    ref.watch(selectedCarYearProvider) != null) {
                  ref.read(updateCarProvider.notifier).updateCar(
                        UpdateCarParams(
                          carBrandModelId: ref
                              .read(selectedCarModelProvider)!
                              .carBrandModelId!,
                          carYear: ref.read(selectedCarYearProvider)!,
                        ),
                      );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
