abstract class ViewState {}

class InitialViewState implements ViewState {}

class LoadingViewState implements ViewState {}

class ErrorViewState implements ViewState {
  ErrorViewState({required this.errorMessage});
  final String errorMessage;
}

class EmptyViewState implements ViewState {}

class LoadingMoreViewState<T extends Object> implements ViewState {
  LoadingMoreViewState(this.data);
  final T data;

  LoadingMoreViewState<T> copyWith({
    T? data,
  }) {
    return LoadingMoreViewState<T>(
      data ?? this.data,
    );
  }

  @override
  String toString() => 'LoadingMoreViewState(data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoadingMoreViewState<T> && other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}

class LoadedViewState<T extends Object> implements ViewState {
  LoadedViewState(
    this.data,
  );
  final T data;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoadedViewState<T> && other.data == data;
  }

  @override
  int get hashCode => data.hashCode;

  @override
  String toString() => 'LoadedViewState(data: $data)';

  LoadedViewState<T> copyWith({
    T? data,
  }) {
    return LoadedViewState<T>(
      data ?? this.data,
    );
  }
}
