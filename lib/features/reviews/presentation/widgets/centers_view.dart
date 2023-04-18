import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/models/view_states.dart';
import 'package:obd/core/widgets/drop_down_widget.dart';
import 'package:obd/features/reviews/data/models/center_model.dart';
import 'package:obd/features/reviews/presentation/provider/centers_provider.dart';
import 'package:obd/features/reviews/presentation/provider/selected_center_provider.dart';
import 'package:obd/theme/dimensions.dart';
import 'package:obd/utils/ui_helper.dart';

class CentersView extends ConsumerStatefulWidget {
  const CentersView({Key? key}) : super(key: key);

  @override
  ConsumerState<CentersView> createState() => _CentersViewState();
}

class _CentersViewState extends ConsumerState<CentersView> {
  @override
  void initState() {
    super.initState();
    UiHelper.postBuildCallback((p0) {
      ref.read(centersProvider.notifier).fetchCenters();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(centersProvider);
    if (state is LoadingViewState) {
      return const CircularProgressIndicator();
    }
    if (state is LoadedViewState<List<CenterModel>>) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimensions.kSizeSmall,
          horizontal: AppDimensions.kSizeMedium,
        ),
        child: DropDownWidget<CenterModel>(
          title: 'center',
          validatorMessage: 'Please select center',
          onChanged: (center) {
            ref.watch(selectedCenterProvider.notifier).state = center?.centerId;
          },
          borderColor: Colors.grey,
          showSelectedItems: true,
          compareFn: (item, sItem) => item.name == sItem.name,
          itemAsString: (centers) => centers.name ?? '',
          items: state.data,
        ),
      );
    }
    return const SizedBox();
  }
}
