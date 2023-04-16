import 'package:dartz/dartz.dart';
import 'package:obd/core/errors/failure.dart';
import 'package:obd/core/models/paginated_model.dart';
import 'package:obd/core/models/view_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class PaginatedProvider<T extends PaginatedModel>
    extends StateNotifier<ViewState> {
  PaginatedProvider(super.state);

  // Pagination Variables
  int pageNumber = 1;
  bool hasMoreData = true;

  Future<Either<Failure, List<T>?>> fetchList();

  Future<void> loadMore() async {
    if (state is LoadedViewState<List<T>>) {
      final oldState = state as LoadedViewState<List<T>>;
      final oldList = oldState.data;

      final newList = await fetchList();
      newList.fold((failure) {
        hasMoreData = false;
        state = LoadedViewState<List<T>>(oldList);
      }, (newList) {
        if (newList != null && newList.isNotEmpty) {
          state = LoadedViewState<List<T>>([...oldList, ...newList]);
        } else if (newList != null && newList.isEmpty) {
          hasMoreData = false;
          state = LoadedViewState<List<T>>(oldList);
        }
      });
    }
  }

  void resetPagination() {
    hasMoreData = true;
    pageNumber = 1;
  }

  void resetState() {
    resetPagination();
    state = InitialViewState();
  }
}
