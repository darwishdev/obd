import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/models/view_states.dart';
import 'package:obd/features/sessions/data/models/session_model.dart';
import 'package:obd/features/sessions/presentation/provider/sessions_provider.dart';
import 'package:obd/features/sessions/presentation/widgets/history_card.dart';
import 'package:obd/utils/ui_helper.dart';

class HistoryView extends ConsumerStatefulWidget {
  const HistoryView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends ConsumerState<HistoryView> {
  @override
  void initState() {
    super.initState();
    UiHelper.postBuildCallback((p0) {
      ref.read(sessionsProvider.notifier).fetchSessions();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(sessionsProvider);
    if (state is LoadingViewState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (state is ErrorViewState) {
      return const Center(
        child: Text('There is no histories yet'),
      );
    }
    if (state is LoadedViewState<List<SessionModel>>) {
      return ListView.separated(
        itemCount: state.data.length,
        padding: const EdgeInsets.symmetric(vertical: 10),
        separatorBuilder: (_, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return HistoryCard(state.data[index]);
        },
      );
    }
    return const SizedBox();
  }
}
