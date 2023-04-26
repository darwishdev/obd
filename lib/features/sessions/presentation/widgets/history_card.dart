import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:obd/features/sessions/data/models/session_model.dart';
import 'package:obd/routes/app_router.gr.dart';
import 'package:obd/theme/constants.dart';
import 'package:obd/utils/helper_functions.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard(this.session, {Key? key}) : super(key: key);

  final SessionModel session;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.push(
        ReportRoute(sessionId: session.sessionId),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [AppTheme.mainShadow],
          gradient: AppTheme.mainGredient,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.date_range_outlined, size: 24.0),
                const SizedBox(width: 8.0),
                Text(
                  HelperFunctions.formatDate(session.createdAt),
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(Icons.error, color: Colors.red),
                    SizedBox(width: 4.0),
                    Text(
                      'Errors: 1',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.warning, color: Colors.orange),
                    const SizedBox(width: 4.0),
                    Text(
                      'Emergencies: ${session.emergencies}',
                      style: const TextStyle(color: Colors.orange),
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
