import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mind_arena/components/controls/mind_buttons.dart';
import 'package:mind_arena/design/tokens/mind_colors.dart';
import 'package:mind_arena/design/tokens/mind_spacing.dart';
import 'package:mind_arena/design/typography/mind_typography.dart';
import 'package:mind_arena/domain/models/arena_package.dart';

/// Reviewable immutable facts panel for TA-02 Situation.
/// Listens for Escape key to close without losing scene state.
class SituationFactsPanel extends StatefulWidget {
  const SituationFactsPanel({
    super.key,
    required this.facts,
    required this.onClose,
  });

  final List<ArenaFact> facts;
  final VoidCallback onClose;

  @override
  State<SituationFactsPanel> createState() => _SituationFactsPanelState();
}

class _SituationFactsPanelState extends State<SituationFactsPanel> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _focusNode.requestFocus();
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.escape): widget.onClose,
      },
      child: Focus(
        focusNode: _focusNode,
        autofocus: true,
        child: Semantics(
          label: 'Facts and rules review panel',
          container: true,
          child: Container(
            padding: const EdgeInsets.all(MindSpacing.space24),
            decoration: BoxDecoration(
              color: MindColors.surfaceDefault,
              borderRadius: BorderRadius.circular(
                MindSpacing.radiusCardExpanded,
              ),
              border: Border.all(color: MindColors.borderQuiet, width: 1.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Facts and Rules',
                        style: MindTypography.cardTitle(context),
                      ),
                    ),
                    const SizedBox(width: MindSpacing.space12),
                    SecondaryActionButton(
                      label: 'Close',
                      onPressed: widget.onClose,
                    ),
                  ],
                ),
                const SizedBox(height: MindSpacing.space16),
                Container(
                  padding: const EdgeInsets.all(MindSpacing.space12),
                  decoration: BoxDecoration(
                    color: MindColors.surfaceEmphasis,
                    borderRadius: BorderRadius.circular(
                      MindSpacing.radiusControl,
                    ),
                  ),
                  child: Text(
                    'There is no approved correct list.',
                    style: MindTypography.body(
                      context,
                      color: MindColors.worldConsequence,
                    ).copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: MindSpacing.space16),
                Flexible(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: widget.facts.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: MindSpacing.space12),
                    itemBuilder: (context, index) {
                      final fact = widget.facts[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            fact.title,
                            style: MindTypography.label(
                              context,
                              color: MindColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: MindSpacing.space4),
                          Text(
                            fact.detail,
                            style: MindTypography.supporting(
                              context,
                              color: MindColors.textSecondary,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
