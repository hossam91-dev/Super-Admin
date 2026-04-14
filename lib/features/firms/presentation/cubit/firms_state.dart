import 'package:equatable/equatable.dart';
import '../../../../core/enums/enums.dart';
import '../../data/models/firm_model.dart';

abstract class FirmsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FirmsInitial extends FirmsState {}

class FirmsLoading extends FirmsState {}

class FirmsLoaded extends FirmsState {
  final List<FirmModel> firms;
  final FirmStatus? selectedFilter;
  final String searchQuery;

  FirmsLoaded({
    required this.firms,
    this.selectedFilter,
    this.searchQuery = '',
  });

  @override
  List<Object?> get props => [firms, selectedFilter, searchQuery];

  FirmsLoaded copyWith({
    List<FirmModel>? firms,
    FirmStatus? selectedFilter,
    bool clearFilter = false,
    String? searchQuery,
  }) {
    return FirmsLoaded(
      firms: firms ?? this.firms,
      selectedFilter: clearFilter ? null : (selectedFilter ?? this.selectedFilter),
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

class FirmsError extends FirmsState {
  final String message;
  FirmsError(this.message);

  @override
  List<Object?> get props => [message];
}
