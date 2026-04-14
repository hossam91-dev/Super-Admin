import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firm_super_admin/core/enums/enums.dart';
import '../../data/models/firm_model.dart';
import 'firms_state.dart';

class FirmsCubit extends Cubit<FirmsState> {
  FirmsCubit() : super(FirmsInitial());

  List<FirmModel> _allFirms = [];

  void fetchFirms() async {
    emit(FirmsLoading());

    // Mocking API delay
    await Future.delayed(const Duration(milliseconds: 800));

    _allFirms = [
      FirmModel(
        id: '1',
        name: 'Alpha Solicitors',
        subdomain: 'alpha.legalplatform.io',
        type: 'Enterprise',
        usersCount: 12,
        casesCount: 89,
        expiryDate: DateTime(2026, 1, 31),
        status: FirmStatus.active,
        initials: 'AS',
      ),
      FirmModel(
        id: '2',
        name: 'Beacon Partners',
        subdomain: 'beacon.legalplatform.io',
        type: 'Trial Plan',
        usersCount: 3,
        casesCount: 5,
        expiryDate: DateTime(2026, 2, 12),
        status: FirmStatus.trial,
        initials: 'BP',
      ),
      FirmModel(
        id: '3',
        name: 'Lakeside Legal',
        subdomain: 'lakeside.legalplatform.io',
        type: 'Standard',
        usersCount: 8,
        casesCount: 42,
        expiryDate: DateTime(2026, 1, 15),
        status: FirmStatus.suspended,
        initials: 'LL',
      ),
      FirmModel(
        id: '4',
        name: 'Summit Venture',
        subdomain: 'summit.legalplatform.io',
        type: 'Enterprise',
        usersCount: 24,
        casesCount: 156,
        expiryDate: DateTime(2026, 3, 22),
        status: FirmStatus.active,
        initials: 'SV',
      ),
      FirmModel(
        id: '5',
        name: 'Gentry Law',
        subdomain: 'gentry.legalplatform.io',
        type: 'Trial Plan',
        usersCount: 1,
        casesCount: 2,
        expiryDate: DateTime.now().add(const Duration(days: 2)),
        status: FirmStatus.trial,
        initials: 'GL',
      ),
      FirmModel(
        id: '6',
        name: 'Metro Legal',
        subdomain: 'metro.legalplatform.io',
        type: 'Basic',
        usersCount: 5,
        casesCount: 12,
        expiryDate: DateTime(2026, 6, 1),
        status: FirmStatus.active,
        initials: 'ML',
      ),
    ];

    emit(FirmsLoaded(firms: _allFirms));
  }

  void filterFirms(String status) {
    if (state is FirmsLoaded) {
      final currentState = state as FirmsLoaded;
      emit(currentState.copyWith(selectedFilter: status));
      _applyFilters();
    }
  }

  void searchFirms(String query) {
    if (state is FirmsLoaded) {
      final currentState = state as FirmsLoaded;
      emit(currentState.copyWith(searchQuery: query));
      _applyFilters();
    }
  }

  void _applyFilters() {
    if (state is FirmsLoaded) {
      final currentState = state as FirmsLoaded;
      
      List<FirmModel> filteredList = _allFirms;

      // Apply status filter
      if (currentState.selectedFilter != 'All') {
        final statusToFilter = FirmStatus.values.firstWhere(
          (e) => e.name.toLowerCase() == currentState.selectedFilter.toLowerCase(),
          orElse: () => FirmStatus.active,
        );
        filteredList = filteredList.where((firm) => firm.status == statusToFilter).toList();
      }

      // Apply search filter
      if (currentState.searchQuery.isNotEmpty) {
        filteredList = filteredList
            .where((firm) => firm.name.toLowerCase().contains(currentState.searchQuery.toLowerCase()))
            .toList();
      }

      emit(currentState.copyWith(firms: filteredList));
    }
  }
}
