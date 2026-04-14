import 'package:flutter/material.dart';
import 'package:firm_super_admin/core/enums/enums.dart';

class FirmModel {
  final String id;
  final String name;
  final String subdomain;
  final String type; // e.g., Enterprise, Standard, Basic
  final int usersCount;
  final int casesCount;
  final DateTime expiryDate;
  final FirmStatus status;
  final String initials;

  FirmModel({
    required this.id,
    required this.name,
    required this.subdomain,
    required this.type,
    required this.usersCount,
    required this.casesCount,
    required this.expiryDate,
    required this.status,
    required this.initials,
  });

  Color get statusColor {
    switch (status) {
      case FirmStatus.active:
        return Colors.green;
      case FirmStatus.trial:
        return Colors.orange;
      case FirmStatus.suspended:
        return Colors.red;
    }
  }

  String get statusText {
    return status.name.toUpperCase();
  }
}
