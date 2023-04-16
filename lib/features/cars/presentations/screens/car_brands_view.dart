import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/models/view_states.dart';
import 'package:obd/core/widgets/drop_down_widget.dart';
import 'package:obd/features/cars/data/models/car_brands_model.dart';
import 'package:obd/features/cars/presentations/provider/cars_provider.dart';
import 'package:obd/features/cars/presentations/provider/selected_car_provider.dart';
import 'package:obd/theme/dimensions.dart';
import 'package:obd/utils/ui_helper.dart';

class CarBrandsView extends ConsumerStatefulWidget {
  const CarBrandsView({
    Key? key,
    this.value,
  }) : super(key: key);

  final String? value;
  @override
  ConsumerState<CarBrandsView> createState() => _CarBrandsViewState();
}

class _CarBrandsViewState extends ConsumerState<CarBrandsView> {
  @override
  void initState() {
    super.initState();
    UiHelper.postBuildCallback((p0) {
      ref.read(carsProvider.notifier).fetchCars();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(carsProvider);
    if (state is LoadingViewState) {
      return const CircularProgressIndicator();
    }
    if (state is LoadedViewState<List<CarBrandsModel>>) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimensions.kSizeSmall,
          horizontal: AppDimensions.kSizeMedium,
        ),
        child: DropDownWidget<CarBrandsModel>(
          title: 'Car Brand',
          validatorMessage: 'Please select car brand',
          onChanged: (car) {
            ref.watch(selectedCarBrandProvider.notifier).state = car?.models;
          },
          borderColor: Colors.grey,
          showSelectedItems: true,
          compareFn: (item, sItem) => item.name == sItem.name,
          itemAsString: (cars) => cars.name ?? '',
          items: state.data,
        ),
      );
    }
    return const SizedBox();
  }
}
