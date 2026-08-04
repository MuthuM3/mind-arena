import 'package:flutter/widgets.dart';
import 'package:mind_arena/design/responsive/window_class.dart';
import 'package:mind_arena/design/tokens/mind_colors.dart';
import 'package:mind_arena/design/tokens/mind_spacing.dart';
import 'package:mind_arena/design/typography/mind_typography.dart';
import 'package:mind_arena/domain/models/arena_package.dart';

/// Card rendering a scenario role in non-selectable presentation mode for TA-02.
class RoleCard extends StatelessWidget {
  const RoleCard({super.key, required this.role});

  final ArenaRole role;

  @override
  Widget build(BuildContext context) {
    final windowClass = WindowClass.of(context);
    final cardRadius = windowClass.isCompact
        ? MindSpacing.radiusCardCompact
        : MindSpacing.radiusCardExpanded;

    final guardianNote = role.guardianToRoleId != null
        ? 'Public guardian to Young Dependent'
        : null;

    final semanticLabel = guardianNote != null
        ? '${role.title}. ${role.description}. $guardianNote.'
        : '${role.title}. ${role.description}.';

    return Semantics(
      label: semanticLabel,
      container: true,
      child: Container(
        padding: const EdgeInsets.all(MindSpacing.space16),
        decoration: BoxDecoration(
          color: MindColors.surfaceDefault,
          borderRadius: BorderRadius.circular(cardRadius),
          border: Border.all(color: MindColors.borderQuiet, width: 1.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    role.title,
                    style: MindTypography.cardTitle(context),
                  ),
                ),
              ],
            ),
            const SizedBox(height: MindSpacing.space8),
            Text(
              role.description,
              style: MindTypography.body(
                context,
                color: MindColors.textSecondary,
              ),
            ),
            if (guardianNote != null) ...[
              const SizedBox(height: MindSpacing.space12),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: MindSpacing.space8,
                  vertical: MindSpacing.space4,
                ),
                decoration: BoxDecoration(
                  color: MindColors.surfaceEmphasis,
                  borderRadius: BorderRadius.circular(
                    MindSpacing.radiusControl,
                  ),
                  border: Border.all(
                    color: MindColors.worldConsequence,
                    width: 1.0,
                  ),
                ),
                child: Text(
                  guardianNote,
                  style: MindTypography.supporting(
                    context,
                    color: MindColors.worldConsequence,
                  ).copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
