import 'package:flutter/widgets.dart';
import 'package:mind_arena/components/controls/mind_buttons.dart';
import 'package:mind_arena/design/tokens/mind_colors.dart';
import 'package:mind_arena/design/tokens/mind_spacing.dart';
import 'package:mind_arena/design/typography/mind_typography.dart';

/// Top header frame showing arena title, progress, and optional exit action.
class ArenaHeader extends StatelessWidget {
  const ArenaHeader({
    super.key,
    required this.stageTitle,
    this.scenarioTitle = 'Mars Rescue',
    this.onExit,
  });

  final String stageTitle;
  final String scenarioTitle;
  final VoidCallback? onExit;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      header: true,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: MindSpacing.space16,
          vertical: MindSpacing.space12,
        ),
        decoration: const BoxDecoration(
          color: MindColors.canvasRaised,
          border: Border(
            bottom: BorderSide(color: MindColors.borderQuiet, width: 1.0),
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Today’s Arena · $scenarioTitle',
                      style: MindTypography.supporting(
                        context,
                        color: MindColors.actionPrimary,
                      ).copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: MindSpacing.space4),
                    Text(stageTitle, style: MindTypography.cardTitle(context)),
                  ],
                ),
              ),
              if (onExit != null) ...[
                const SizedBox(width: MindSpacing.space16),
                SecondaryActionButton(label: 'Leave', onPressed: onExit),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
