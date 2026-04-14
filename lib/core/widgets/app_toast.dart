import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

enum ToastType { success, error, warning, info, loading }

class AppToast {
  static void show(
    BuildContext context, {
    required String message,
    String? title,
    ToastType type = ToastType.info,
    Duration duration = const Duration(seconds: 3),
    VoidCallback? onAction,
    String? actionLabel,
  }) {
    final overlay = Overlay.of(context);
    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (_) => _ToastWidget(
        message: message,
        title: title,
        type: type,
        onAction: onAction,
        actionLabel: actionLabel,
        onDismiss: () => entry.remove(),
      ),
    );

    overlay.insert(entry);

    if (type != ToastType.loading) {
      Future.delayed(duration, () {
        if (entry.mounted) entry.remove();
      });
    }
  }
}

class _ToastWidget extends StatefulWidget {
  final String message;
  final String? title;
  final ToastType type;
  final VoidCallback? onAction;
  final String? actionLabel;
  final VoidCallback onDismiss;

  const _ToastWidget({
    required this.message,
    this.title,
    required this.type,
    this.onAction,
    this.actionLabel,
    required this.onDismiss,
  });

  @override
  State<_ToastWidget> createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<_ToastWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slide;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _slide = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    _fade = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color get _accentColor {
    switch (widget.type) {
      case ToastType.success:
        return AppColors.success;
      case ToastType.error:
        return AppColors.error;
      case ToastType.warning:
        return AppColors.warning;
      case ToastType.info:
        return AppColors.info;
      case ToastType.loading:
        return AppColors.onSurfaceVariant;
    }
  }

  IconData get _icon {
    switch (widget.type) {
      case ToastType.success:
        return Icons.check_circle_rounded;
      case ToastType.error:
        return Icons.cancel_rounded;
      case ToastType.warning:
        return Icons.warning_rounded;
      case ToastType.info:
        return Icons.info_rounded;
      case ToastType.loading:
        return Icons.hourglass_top_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 24 + MediaQuery.of(context).padding.bottom,
      left: 16,
      right: 16,
      child: FadeTransition(
        opacity: _fade,
        child: SlideTransition(
          position: _slide,
          child: Material(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x14191C1E),
                    blurRadius: 20,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Left accent bar
                    Container(
                      width: 4,
                      decoration: BoxDecoration(
                        color: _accentColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Icon
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: widget.type == ToastType.loading
                          ? SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: _accentColor,
                              ),
                            )
                          : Icon(_icon, color: _accentColor, size: 20),
                    ),
                    const SizedBox(width: 12),
                    // Text
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (widget.title != null)
                              Text(
                                widget.title!,
                                style: const TextStyle(
                                  color: AppColors.onSurface,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            Text(
                              widget.message,
                              style: const TextStyle(
                                color: AppColors.onSurfaceVariant,
                                fontSize: 13,
                              ),
                            ),
                            if (widget.actionLabel != null)
                              GestureDetector(
                                onTap: widget.onAction,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    widget.actionLabel!,
                                    style: const TextStyle(
                                      color: AppColors.primary,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    // Dismiss
                    if (widget.type != ToastType.loading)
                      IconButton(
                        icon: const Icon(Icons.close, size: 16),
                        color: AppColors.onSurfaceVariant,
                        onPressed: widget.onDismiss,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
