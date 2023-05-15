import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/models/view_states.dart';
import 'package:obd/core/widgets/rounded_btn.dart';
import 'package:obd/features/home/presentation/provider/obd_reader_provider.dart';
import 'package:obd/features/home/presentation/widgets/check_connect_widget.dart';
import 'package:obd/features/sessions/presentation/provider/session_attach_code_provider.dart';
import 'package:obd/features/sessions/presentation/provider/session_create_provider.dart';
import 'package:obd/routes/app_router.gr.dart';
import 'package:obd/utils/ui_helper.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(sessionCreateProvider, (previous, state) async {
      if (state is LoadingViewState) {
        UiHelper.showLoadingDialog(context);
      } else if (state is LoadedViewState<int>) {
        Navigator.of(context).pop();
        ref.watch(sessionCreateProvider.notifier).isLive
            ? context.router.push(const OBDInfoRoute())
            : ref.watch(obdReaderProvider).fetchTroubleCode().then((val) {
                if (val != null) {
                  ref
                      .read(sessionAttachCodeProvider.notifier)
                      .sessionAttachCode(val)
                      .then((v) => context.router
                          .push(ReportRoute(sessionId: state.data)));
                }
              });
      } else if (state is ErrorViewState) {
        context.popRoute();
        EasyLoading.showError(state.errorMessage);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('OBD'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(obdReaderProvider.notifier).reset(),
          ),
        ],
      ),
      body: !ref.watch(obdReaderProvider).started
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedBtn(
                    icon: 'assets/images/scan.svg',
                    text: "Scan Live Data",
                    onPressed: () => ref
                        .read(sessionCreateProvider.notifier)
                        .fetchSessionCreate(true),
                  ),
                  const SizedBox(height: 40),
                  RoundedBtn(
                    icon: 'assets/images/scan.svg',
                    text: "Scan errors",
                    onPressed: () => ref
                        .read(sessionCreateProvider.notifier)
                        .fetchSessionCreate(false),
                  ),
                ],
              ),
            )
          : const CheckConnectWidget(),
    );
  }
}
