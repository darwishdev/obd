import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:obd/core/models/view_states.dart';
import 'package:obd/core/repositories/token_repository.dart';
import 'package:obd/features/cars/presentations/provider/update_car_provider.dart';
import 'package:obd/features/user/presentation/provider/authorize_provider.dart';
import 'package:obd/features/user/presentation/screens/edit_car_model_screen.dart';
import 'package:obd/utils/ui_helper.dart';

@RoutePage()
class EditCarScreen extends ConsumerWidget {
  const EditCarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(tokenRepositoryProvider);

    ref.listen(updateCarProvider, (previous, state) async {
      if (state is LoadingViewState) {
        UiHelper.showLoadingDialog(context);
      } else if (state is LoadedViewState) {
        await ref.read(authorizeProvider.notifier).authorize().whenComplete(() {
          Navigator.of(context)
            ..pop()
            ..pop();
          EasyLoading.showSuccess('Car updated successfully');
        });
      } else if (state is ErrorViewState) {
        context.popRoute();
        EasyLoading.showError(state.errorMessage);
      }
    });
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showBarModalBottomSheet(
          context: context,
          backgroundColor: Colors.grey[900],
          builder: (context) => const EditCarModelScreen(),
        ),
        label: const Text("Update Car"),
        icon: const Icon(Icons.edit),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[900],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Car Information',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.directions_car),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Brand:',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      repo.userInfo?.car?.brandName ?? '-',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                const Icon(Icons.directions_car),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Model:',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      repo.userInfo?.car?.brandModelName ?? '-',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                const Icon(Icons.calendar_today),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Year:',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      repo.userInfo?.car?.modelYear?.toString() ?? '-',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
