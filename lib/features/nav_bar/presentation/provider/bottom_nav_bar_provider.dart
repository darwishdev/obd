import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomBarIndex =
    StateNotifierProvider.autoDispose<BottomBarIndexProvider, int>((ref) {
  return BottomBarIndexProvider();
});

class BottomBarIndexProvider extends StateNotifier<int> {
  BottomBarIndexProvider() : super(0);

  void setActiveIndex(int index) {
    state = index;
  }
}
