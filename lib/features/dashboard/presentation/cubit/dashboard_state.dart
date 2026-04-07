import 'package:equatable/equatable.dart';
import '../../data/models/dashboard_models.dart';

abstract class DashboardState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final List<StatModel> stats;
  final List<AttentionItemModel> needsAttention;
  final List<RecentFirmModel> recentFirms;

  DashboardLoaded({
    required this.stats,
    required this.needsAttention,
    required this.recentFirms,
  });

  @override
  List<Object?> get props => [stats, needsAttention, recentFirms];
}

class DashboardError extends DashboardState {
  final String message;
  DashboardError(this.message);

  @override
  List<Object?> get props => [message];
}

