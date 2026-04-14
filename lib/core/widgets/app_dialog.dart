import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

enum DialogType { confirm, warning, info }

/// Generic app dialog builder
class AppDialog {
  // ── Delete / Destructive confirm ───────────────────────────────────────────
  static Future<bool?> showDelete(
    BuildContext context, {
    required String title,
    required String message,
    String confirmLabel = 'Delete',
  }) {
    return _show(
      context,
      iconData: Icons.delete_outline_rounded,
      iconColor: AppColors.error,
      iconBg: AppColors.errorContainer,
      title: title,
      message: message,
      cancelLabel: 'Cancel',
      confirmLabel: confirmLabel,
      confirmColor: AppColors.error,
    );
  }

  // ── Suspend / Warning confirm ──────────────────────────────────────────────
  static Future<bool?> showWarning(
    BuildContext context, {
    required String title,
    required String message,
    String confirmLabel = 'Confirm',
  }) {
    return _show(
      context,
      iconData: Icons.pause_circle_outline_rounded,
      iconColor: AppColors.warning,
      iconBg: AppColors.warningContainer,
      title: title,
      message: message,
      cancelLabel: 'Cancel',
      confirmLabel: confirmLabel,
      confirmColor: AppColors.warning,
    );
  }

  // ── Generic info confirm ───────────────────────────────────────────────────
  static Future<bool?> showConfirm(
    BuildContext context, {
    required String title,
    required String message,
    String confirmLabel = 'Confirm',
    String cancelLabel = 'Cancel',
  }) {
    return _show(
      context,
      iconData: Icons.help_outline_rounded,
      iconColor: AppColors.primary,
      iconBg: AppColors.primaryFixed,
      title: title,
      message: message,
      cancelLabel: cancelLabel,
      confirmLabel: confirmLabel,
      confirmColor: AppColors.primary,
    );
  }

  // ── Invite user form dialog ────────────────────────────────────────────────
  static Future<Map<String, String>?> showInviteUser(BuildContext context) {
    return showDialog<Map<String, String>>(
      context: context,
      builder: (ctx) => const _InviteUserDialog(),
    );
  }

  // ── Internal builder ──────────────────────────────────────────────────────
  static Future<bool?> _show(
    BuildContext context, {
    required IconData iconData,
    required Color iconColor,
    required Color iconBg,
    required String title,
    required String message,
    required String cancelLabel,
    required String confirmLabel,
    required Color confirmColor,
  }) {
    return showDialog<bool>(
      context: context,
      barrierColor: Colors.black26,
      builder: (ctx) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: AppColors.surfaceContainerLowest,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: iconBg,
                  shape: BoxShape.circle,
                ),
                child: Icon(iconData, color: iconColor, size: 28),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.onSurface,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.onSurfaceVariant,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(ctx).pop(false),
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(0, 48),
                        side: const BorderSide(color: AppColors.outlineVariant),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        foregroundColor: AppColors.onSurface,
                      ),
                      child: Text(cancelLabel),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(ctx).pop(true),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(0, 48),
                        backgroundColor: confirmColor,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Text(confirmLabel),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Invite user dialog ──────────────────────────────────────────────────────
class _InviteUserDialog extends StatefulWidget {
  const _InviteUserDialog();

  @override
  State<_InviteUserDialog> createState() => _InviteUserDialogState();
}

class _InviteUserDialogState extends State<_InviteUserDialog> {
  final _emailCtrl = TextEditingController();
  String _role = 'Staff';
  final _roles = ['Admin', 'Staff', 'Viewer'];

  @override
  void dispose() {
    _emailCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: AppColors.surfaceContainerLowest,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Invite New User',
              style: TextStyle(
                color: AppColors.onSurface,
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Send an invitation to join this firm',
              style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 13),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailCtrl,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Email address',
                prefixIcon: Icon(Icons.email_outlined, size: 20),
              ),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _role,
              decoration: const InputDecoration(hintText: 'Select role'),
              borderRadius: BorderRadius.circular(12),
              items: _roles
                  .map((r) => DropdownMenuItem(value: r, child: Text(r)))
                  .toList(),
              onChanged: (v) => setState(() => _role = v!),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context)
                    .pop({'email': _emailCtrl.text, 'role': _role}),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Send Invitation'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
