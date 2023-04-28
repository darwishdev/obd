import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/models/view_states.dart';
import 'package:obd/features/centers/data/models/winch_model.dart';
import 'package:obd/features/centers/presentation/provider/winches_provider.dart';
import 'package:obd/features/centers/presentation/widgets/winch_card.dart';
import 'package:obd/features/location_picker/presentation/provider/current_location_provider.dart';
import 'package:obd/utils/ui_helper.dart';

class WinchesView extends ConsumerStatefulWidget {
  const WinchesView({Key? key}) : super(key: key);

  @override
  ConsumerState<WinchesView> createState() => _WinchesViewState();
}

class _WinchesViewState extends ConsumerState<WinchesView> {
  @override
  void initState() {
    super.initState();
    UiHelper.postBuildCallback((p0) {
      ref
          .read(currentLocationProvider.notifier)
          .fetchCurrentLocation()
          .then((value) {
        ref.read(winchesProvider.notifier).fetchWinches(
              lat: value?.latitude,
              long: value?.longitude,
            );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(winchesProvider);
    if (state is LoadingViewState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (state is ErrorViewState) {
      return const Center(
        child: Text('There is no winches'),
      );
    }
    if (state is LoadedViewState<List<WinchModel>>) {
      return ListView.separated(
        itemCount: state.data.length,
        padding: const EdgeInsets.symmetric(vertical: 10),
        separatorBuilder: (_, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return WinchCard(state.data[index]);
        },
      );
    }
    return const SizedBox();
  }
}
