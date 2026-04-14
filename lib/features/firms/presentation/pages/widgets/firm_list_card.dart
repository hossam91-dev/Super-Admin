import 'package:flutter/material.dart';
import 'package:firm_super_admin/core/extensions/l10n_extension.dart';
import 'package:firm_super_admin/core/constants/app_colors.dart';

import 'package:firm_super_admin/features/firms/data/models/firm_model.dart';
import 'package:intl/intl.dart';

class FirmListCard extends StatelessWidget {
  final FirmModel firm;

  const FirmListCard({super.key, required this.firm});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Status Indicator Strip
            Container(
              width: 4,
              decoration: BoxDecoration(
                color: firm.statusColor,
                borderRadius: const BorderRadiusDirectional.only(
                  topStart: Radius.circular(16),
                  bottomStart: Radius.circular(16),
                ),
              ),
            ),
            
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // Avatar
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: firm.statusColor.withOpacity(0.1),
                          child: Text(
                            firm.initials,
                            style: TextStyle(
                              color: firm.statusColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        
                        // Name and Subdomain
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                firm.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppColors.textDark,
                                ),
                              ),
                              Text(
                                firm.subdomain,
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        // Status Badge
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: firm.statusColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            firm.statusText,
                            style: TextStyle(
                              color: firm.statusColor,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    
                    // Details
                    Text(
                      '${firm.type} | ${firm.usersCount} ${context.l10n.users} | ${firm.casesCount} ${context.l10n.cases}',
                      style: TextStyle(
                        color: AppColors.textDark.withOpacity(0.7),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // Expiry and Actions
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${context.l10n.expires} ${DateFormat('MMM dd').format(firm.expiryDate)}',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontStyle: FontStyle.italic,
                            fontSize: 12,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.visibility_outlined, size: 20, color: Colors.grey.shade600),
                            const SizedBox(width: 12),
                            Icon(Icons.more_vert, size: 20, color: Colors.grey.shade600),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
