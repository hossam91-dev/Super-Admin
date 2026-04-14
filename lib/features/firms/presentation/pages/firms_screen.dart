import 'package:flutter/material.dart';
import 'package:firm_super_admin/core/extensions/l10n_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firm_super_admin/features/firms/presentation/cubit/firms_cubit.dart';
import 'package:firm_super_admin/features/firms/presentation/cubit/firms_state.dart';
import 'package:firm_super_admin/features/firms/presentation/pages/widgets/firm_list_card.dart';
import 'package:firm_super_admin/features/firms/presentation/pages/widgets/firms_filter_chips.dart';

class FirmsScreen extends StatelessWidget {
  const FirmsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FirmsCubit()..fetchFirms(),
      child: BlocBuilder<FirmsCubit, FirmsState>(
        builder: (context, state) {
          if (state is FirmsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is FirmsLoaded) {
            return Column(
              children: [
                const SizedBox(height: 8),

                // Search Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: TextField(
                    onChanged: (value) => context.read<FirmsCubit>().searchFirms(value),
                    decoration: InputDecoration(
                      hintText: context.l10n.firmsSearchHint,
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Filters
                FirmsFilterChips(
                  selectedFilter: state.selectedFilter,
                  onFilterChanged: (filter) => context.read<FirmsCubit>().filterFirms(filter),
                ),

                const SizedBox(height: 16),

                // Firms List
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    itemCount: state.firms.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 0),
                    itemBuilder: (context, index) {
                      return FirmListCard(firm: state.firms[index]);
                    },
                  ),
                ),
              ],
            );
          }

          if (state is FirmsError) {
            return Center(child: Text(state.message));
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
