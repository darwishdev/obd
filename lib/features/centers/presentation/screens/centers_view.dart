import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/models/view_states.dart';
import 'package:obd/features/centers/data/models/center_model.dart';
import 'package:obd/features/centers/presentation/provider/centers_provider.dart';
import 'package:obd/features/centers/presentation/widgets/center_card.dart';
import 'package:obd/features/location_picker/presentation/provider/current_location_provider.dart';
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
      ref
          .read(currentLocationProvider.notifier)
          .fetchCurrentLocation()
          .then((value) {
        ref.read(centersProvider.notifier).fetchCenters(
              lat: value?.latitude,
              long: value?.longitude,
            );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(centersProvider);
    if (state is LoadingViewState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (state is ErrorViewState) {
      return const Center(
        child: Text('There is no centers'),
      );
    }
    if (state is LoadedViewState<List<CenterModel>>) {
      return ListView.separated(
        itemCount: state.data.length,
        padding: const EdgeInsets.symmetric(vertical: 10),
        separatorBuilder: (_, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return CenterCard(state.data[index]);
        },
      );
    }
    return const SizedBox();
  }
}
