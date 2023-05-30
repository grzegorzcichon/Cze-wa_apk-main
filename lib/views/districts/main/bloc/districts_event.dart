part of 'districts_bloc.dart';

class DistrictsState {
  final List<Districts> items;
  final bool isLoading;
  final String error;
  final bool isVisible;
  final double minTileHeight;

  DistrictsState({
    this.items = const [],
    this.isLoading = false,
    this.error = '',
    this.isVisible = true,
    this.minTileHeight = 150,
  });

  DistrictsState copyWith({
    List<Districts>? items,
    bool? isLoading,
    String? error,
    bool? isVisible,
    double? minTileHeight,
  }) {
    return DistrictsState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      isVisible: isVisible ?? this.isVisible,
      minTileHeight: minTileHeight ?? this.minTileHeight,
    );
  }
}
