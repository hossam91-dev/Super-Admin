import 'package:flutter/material.dart';

class StatModel {
  final String title;
  final String count;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final Color subtitleColor;

  StatModel({
    required this.title,
    required this.count,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.subtitleColor,
  });
}

class AttentionItemModel {
  final String name;
  final String status;
  final String colorType; 

  AttentionItemModel({
    required this.name,
    required this.status,
    required this.colorType,
  });
}

class RecentFirmModel {
  final String name;
  final String initials;
  final String type;
  final String status;

  RecentFirmModel({
    required this.name,
    required this.initials,
    required this.type,
    required this.status,
  });
}

