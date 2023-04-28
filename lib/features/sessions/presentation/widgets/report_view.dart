import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:obd/core/models/view_states.dart';
import 'package:obd/features/sessions/data/models/session_code_model.dart';
import 'package:obd/features/sessions/presentation/provider/session_code_provider.dart';
import 'package:obd/features/sessions/presentation/widgets/report_card.dart';
import 'package:obd/utils/ui_helper.dart';

class ReportView extends ConsumerStatefulWidget {
  const ReportView({
    this.id,
    Key? key,
  }) : super(key: key);

  final int? id;
  @override
  ConsumerState<ReportView> createState() => _ReportViewState();
}

class _ReportViewState extends ConsumerState<ReportView> {
  @override
  void initState() {
    super.initState();
    UiHelper.postBuildCallback((p0) {
      ref.read(sessionCodesProvider.notifier).fetchSessionCodes(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(sessionCodesProvider);

    if (state is LoadingViewState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state is LoadedViewState<List<SessionCodeModel>>) {
      return GroupedListView<SessionCodeModel, String>(
        elements: state.data,
        groupBy: (item) => (item.isEmergency ?? false) ? 'Emergency' : 'Normal',
        groupSeparatorBuilder: (String value) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (c, item) => ReportCard(item),
      );
    }

    return const SizedBox();
  }
}
