import 'package:flutter/material.dart';

@immutable
class QuickShortcutItems {
  final String title;
  final IconData? icon;
  final String? imagePath;
  final String? imagePackage;
  final Color? iconColor;
  final Color? textColor;
  final String alertMessage;
  final Color? alertColor;
  final BadgePosition? alertPosition;
  final Offset? alertOffset;
  final VoidCallback? onTap;

  const QuickShortcutItems({
    required this.title,
    this.icon,
    this.imagePath,
    this.imagePackage,
    this.iconColor,
    this.textColor,
    this.alertMessage = '',
    this.alertColor,
    this.alertPosition = BadgePosition.topRight,
    this.alertOffset = Offset.zero,
    this.onTap,
  });
}

@immutable
class QuickDashboardShortcut extends StatelessWidget {
  final String title;
  final List<QuickShortcutItems> actions;
  final double iconSize;
  final double textSize;
  final int crossAxisCount; // Number of items per row in the grid
  final double spacing; // Space between items in the grid
  final double childAspectRatio; // Width to height ratio of each grid item

  const QuickDashboardShortcut({
    super.key,
    required this.title,
    required this.actions,
    this.iconSize = 32,
    this.textSize = 12,
    this.crossAxisCount = 4,
    this.spacing = 8,
    this.childAspectRatio = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: const Color(0xFF00FF00),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          _buildGridView(),
        ],
      ),
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: spacing,
        crossAxisSpacing: spacing,
        childAspectRatio: childAspectRatio,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: actions.length,
      itemBuilder: (context, index) {
        final action = actions[index];
        final fallbackColor = Theme.of(context).colorScheme.onSurface;
        return _ActionItem(
          action: action,
          iconSize: iconSize,
          textSize: textSize,
          iconColor: action.iconColor ?? fallbackColor,
          textColor: action.textColor ?? fallbackColor,
          alertOffset: action.alertOffset ?? Offset.zero,
          alertPosition: action.alertPosition ?? BadgePosition.topRight,
        );
      },
    );
  }
}

enum BadgePosition { topLeft, topRight, bottomLeft, bottomRight }

class _ActionItem extends StatelessWidget {
  const _ActionItem({
    required this.action,
    required this.iconSize,
    required this.iconColor,
    required this.textSize,
    required this.textColor,
    required this.alertOffset,
    required this.alertPosition,
  });

  final QuickShortcutItems action;
  final double iconSize;
  final double textSize;
  final Color iconColor;
  final Color textColor;
  final Offset alertOffset;
  final BadgePosition alertPosition;

  @override
  Widget build(BuildContext context) {
    const baseTop = -8.0;
    const baseSide = -8.0;

    return Semantics(
      button: true,
      label: action.title,
      child: InkWell(
        onTap: action.onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  if (action.imagePath != null)
                    Image.asset(
                      action.imagePath!,
                      package: action.imagePackage,
                      width: iconSize * 1.2,
                      height: iconSize * 1.2,
                      //color: iconColor,
                      errorBuilder: (context, error, stackTrace) {
                        assert(() {
                          debugPrint(
                            'QuickDashboardShortcut: failed to load asset '
                            '"${action.imagePath}"'
                            '${action.imagePackage != null ? ' (package: ${action.imagePackage})' : ''}. '
                            'Error: $error',
                          );
                          return true;
                        }());

                        return Icon(
                          Icons.image_not_supported_outlined,
                          size: iconSize,
                          color: iconColor,
                        );
                      },
                    )
                  else if (action.icon != null)
                    Icon(action.icon, size: iconSize, color: iconColor),

                  if (action.alertMessage.isNotEmpty)
                    switch (alertPosition) {
                      BadgePosition.topLeft => Positioned(
                        top: baseTop + alertOffset.dy,
                        left: baseSide + alertOffset.dx,
                        child: badge(context),
                      ),
                      BadgePosition.topRight => Positioned(
                        top: baseTop + alertOffset.dy,
                        right: baseSide + alertOffset.dx,
                        child: badge(context),
                      ),
                      BadgePosition.bottomLeft => Positioned(
                        bottom: baseSide + alertOffset.dy,
                        left: baseSide + alertOffset.dx,
                        child: badge(context),
                      ),
                      BadgePosition.bottomRight => Positioned(
                        bottom: baseSide + alertOffset.dy,
                        right: baseSide + alertOffset.dx,
                        child: badge(context),
                      ),
                    },
                ],
              ),
              const SizedBox(height: 8),
              Text(
                action.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: textColor,
                  fontSize: textSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container badge(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
      decoration: BoxDecoration(
        color: action.alertColor ?? Colors.red,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        action.alertMessage,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: Colors.white,
          fontSize: iconSize * 0.26,
        ),
      ),
    );
  }
}
