import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:obd/features/centers/data/models/center_model.dart';
import 'package:obd/features/centers/presentation/widgets/center_details_delegate.dart';
import 'package:obd/features/reviews/presentation/screens/create_review_screen.dart';
import 'package:obd/features/reviews/presentation/widgets/reviews_view.dart';

@RoutePage()
class CenterDetailsScreen extends ConsumerStatefulWidget {
  const CenterDetailsScreen(this.center, {Key? key}) : super(key: key);

  final CenterModel center;
  @override
  ConsumerState<CenterDetailsScreen> createState() =>
      _CenterDetailsScreenState();
}

class _CenterDetailsScreenState extends ConsumerState<CenterDetailsScreen>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController _tabController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            stretch: true,
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.center.name ?? '',
                textAlign: TextAlign.center,
              ),
              background: Image.network(
                // widget.center.image ?? '',
                "https://static.exploremelon.com/carbrain/static-center-logo.png.png",
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Image.network(
                    'https://static.exploremelon.com/carbrain/static-center-logo.png.png',
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
          SliverPersistentHeader(
            delegate: TabBarHeaderDelegate(
              tabBar: TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(text: "Details"),
                  Tab(text: "Reviews"),
                ],
              ),
            ),
            pinned: true,
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Phone:',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text(widget.center.phone ?? ''),
                      const SizedBox(height: 10.0),
                      const Text(
                        'Distance:',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text('${widget.center.distance ?? ''} km'),
                      const SizedBox(height: 10.0),
                      const Text(
                        'Address:',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text(widget.center.address ?? ''),
                      const SizedBox(height: 10.0),
                      const Text(
                        'Rate:',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      RatingBarIndicator(
                        rating: double.tryParse(
                                widget.center.rate?.toString() ?? '') ??
                            0.0,
                        itemBuilder: (_, i) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 20.0,
                      ),
                    ],
                  ),
                ),
                ReviewsView(centerID: widget.center.centerId),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showBarModalBottomSheet(
          context: context,
          backgroundColor: Colors.grey[900],
          builder: (context) => const CreateReviewScreen(),
        ),
        label: const Text('Add review'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
