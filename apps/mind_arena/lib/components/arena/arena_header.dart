import 'package:flutter/material.dart';
import 'package:mind_arena/components/controls/mind_buttons.dart';
import 'package:mind_arena/design/tokens/mind_colors.dart';
import 'package:mind_arena/design/tokens/mind_spacing.dart';
import 'package:mind_arena/design/typography/mind_typography.dart';

/// Top header frame showing arena title, progress indicator, and optional exit action.
class ArenaHeader extends StatelessWidget {
  const ArenaHeader({
    super.key,
    required this.stageTitle,
    this.scenarioTitle = 'Mars Rescue',
    this.currentStep = 1,
    this.totalSteps = 7,
    this.onExit,
  });

  final String stageTitle;
  final String scenarioTitle;
  final int currentStep;
  final int totalSteps;
  final VoidCallback? onExit;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      header: true,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: MindSpacing.space24,
          vertical: MindSpacing.space16,
        ),
        decoration: BoxDecoration(
          color: MindColors.canvasRaised.withValues(alpha: 0.85),
          border: const Border(
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
                child: Row(
                  children: [
                    // Step Indicator Pill
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: MindSpacing.space12,
                        vertical: MindSpacing.space4,
                      ),
                      decoration: BoxDecoration(
                        color: MindColors.actionPrimary.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(
                          MindSpacing.radiusPill,
                        ),
                        border: Border.all(
                          color: MindColors.actionPrimary.withValues(
                            alpha: 0.4,
                          ),
                          width: 1.0,
                        ),
                      ),
                      child: Text(
                        'Step $currentStep of $totalSteps',
                        style: MindTypography.label(
                          context,
                          color: MindColors.actionPrimary,
                        ).copyWith(fontSize: 12.0, fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(width: MindSpacing.space16),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Today’s Arena · $scenarioTitle',
                            style: MindTypography.supporting(
                              context,
                              color: MindColors.textSecondary,
                            ).copyWith(fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: MindSpacing.space4),
                          Text(
                            stageTitle,
                            style: MindTypography.cardTitle(context),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
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
