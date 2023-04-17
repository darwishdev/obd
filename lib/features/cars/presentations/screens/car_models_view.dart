import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/widgets/drop_down_widget.dart';
import 'package:obd/features/cars/data/models/car_models_model.dart';
import 'package:obd/features/cars/presentations/provider/selected_car_provider.dart';
import 'package:obd/theme/dimensions.dart';

class CarModelsView extends ConsumerWidget {
  const CarModelsView({
    Key? key,
    this.value,
  }) : super(key: key);

  final int? value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimensions.kSizeSmall,
        horizontal: AppDimensions.kSizeMedium,
      ),
      child: DropDownWidget<CarModelsModel>(
        title: 'Car Model',
        validatorMessage: 'Please select car model',
        onChanged: (carModel) {
          ref.watch(selectedCarModelProvider.notifier).state = carModel;
        },
        borderColor: Colors.grey,
        showSelectedItems: true,
        compareFn: (item, sItem) => item.name == sItem.name,
        itemAsString: (cars) => cars.name ?? '',
        items: ref.watch(selectedCarBrandProvider) ?? [],
        value: value != null
            ? getSelectedModel(ref.watch(selectedCarBrandProvider))
            : null,
        // value: value,
      ),
    );
  }

  CarModelsModel? getSelectedModel(List<CarModelsModel>? items) {
    if (items != null) {
      return items.firstWhere((e) => e.carBrandModelId == value);
    }
    return null;
  }
}
