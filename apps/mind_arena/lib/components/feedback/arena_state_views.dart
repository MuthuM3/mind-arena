import 'package:flutter/material.dart';
import 'package:mind_arena/components/controls/mind_buttons.dart';
import 'package:mind_arena/design/tokens/mind_colors.dart';
import 'package:mind_arena/design/tokens/mind_spacing.dart';
import 'package:mind_arena/design/typography/mind_typography.dart';

/// Loading view shown while package is loading.
class ArenaLoadingView extends StatelessWidget {
  const ArenaLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MindColors.canvasBase,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                MindColors.actionPrimary,
              ),
            ),
            const SizedBox(height: MindSpacing.space16),
            Text(
              'Entering Today’s Arena...',
              style: MindTypography.body(
                context,
                color: MindColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// View displayed when the arena package is unavailable.
class ArenaUnavailableView extends StatelessWidget {
  const ArenaUnavailableView({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MindColors.canvasBase,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480.0),
          child: Container(
            padding: const EdgeInsets.all(MindSpacing.space32),
            decoration: BoxDecoration(
              color: MindColors.surfaceDefault,
              borderRadius: BorderRadius.circular(
                MindSpacing.radiusCardExpanded,
              ),
              border: Border.all(color: MindColors.borderQuiet),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Arena Unavailable',
                  style: MindTypography.sceneTitle(
                    context,
                    color: MindColors.safetyCritical,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: MindSpacing.space16),
                Text(
                  message,
                  style: MindTypography.body(
                    context,
                    color: MindColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: MindSpacing.space24),
                PrimaryActionButton(label: 'Retry', onPressed: onRetry),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// View displayed when the arena package fails validation.
class ArenaInvalidView extends StatelessWidget {
  const ArenaInvalidView({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MindColors.canvasBase,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480.0),
          child: Container(
            padding: const EdgeInsets.all(MindSpacing.space32),
            decoration: BoxDecoration(
              color: MindColors.surfaceDefault,
              borderRadius: BorderRadius.circular(
                MindSpacing.radiusCardExpanded,
              ),
              border: Border.all(color: MindColors.borderQuiet),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Invalid Arena Package',
                  style: MindTypography.sceneTitle(
                    context,
                    color: MindColors.worldConsequence,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: MindSpacing.space16),
                Text(
                  'The local arena package is malformed or invalid: $message',
                  style: MindTypography.body(
                    context,
                    color: MindColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: MindSpacing.space24),
                SecondaryActionButton(
                  label: 'Reload Package',
                  onPressed: onRetry,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
