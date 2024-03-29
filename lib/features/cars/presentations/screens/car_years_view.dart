import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/widgets/drop_down_widget.dart';
import 'package:obd/features/cars/presentations/provider/selected_car_provider.dart';
import 'package:obd/theme/dimensions.dart';

class CarYearsView extends ConsumerWidget {
  const CarYearsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimensions.kSizeSmall,
        horizontal: AppDimensions.kSizeMedium,
      ),
      child: DropDownWidget<String>(
        title: 'Car Year',
        validatorMessage: 'Please select car year',
        onChanged: (carModel) {
          if (carModel == null) return;
          ref.watch(selectedCarYearProvider.notifier).state =
              int.parse(carModel);
        },
        borderColor: Colors.grey,
        showSelectedItems: true,
        compareFn: (item, sItem) => item == sItem,
        itemAsString: (year) => year,
        items:
            ref.watch(selectedCarModelProvider)?.years?.split(',').toList() ??
                [],
      ),
    );
  }
}
