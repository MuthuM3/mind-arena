import 'package:flutter/material.dart';
import 'package:mind_arena/design/responsive/window_class.dart';
import 'package:mind_arena/design/tokens/mind_colors.dart';
import 'package:mind_arena/design/tokens/mind_spacing.dart';
import 'package:mind_arena/design/typography/mind_typography.dart';
import 'package:mind_arena/domain/models/arena_package.dart';

/// Presentation card rendering a scenario role for TA-02 Situation.
/// Consumes pure domain model properties (`title`, `description`, `categoryTag`, `guardianRelationshipLabel`)
/// without role-ID presentation branching.
class RoleCard extends StatefulWidget {
  const RoleCard({super.key, required this.role});

  final ArenaRole role;

  @override
  State<RoleCard> createState() => _RoleCardState();
}

class _RoleCardState extends State<RoleCard> {
  bool _isHovered = false;

  (IconData, Color) _getCategoryVisuals(String? categoryTag) {
    final tag = categoryTag?.toLowerCase() ?? '';

    if (tag.contains('engineering') || tag.contains('power')) {
      return (Icons.bolt_rounded, MindColors.roleEngineering);
    } else if (tag.contains('medicine') || tag.contains('trauma')) {
      return (Icons.medical_services_outlined, MindColors.roleMedical);
    } else if (tag.contains('aviation') || tag.contains('orbit')) {
      return (Icons.flight_takeoff_rounded, MindColors.roleFlight);
    } else if (tag.contains('ecology') || tag.contains('agriculture')) {
      return (Icons.eco_outlined, MindColors.roleBiology);
    } else if (tag.contains('dependent') || tag.contains('family')) {
      return (Icons.child_care_rounded, MindColors.roleGuardian);
    } else {
      return (Icons.account_balance_outlined, MindColors.roleGovernance);
    }
  }

  @override
  Widget build(BuildContext context) {
    final windowClass = WindowClass.of(context);
    final cardRadius = windowClass.isCompact
        ? MindSpacing.radiusCardCompact
        : MindSpacing.radiusCardExpanded;

    final categoryTag = widget.role.categoryTag ?? 'Scenario Role';
    final (icon, accentColor) = _getCategoryVisuals(categoryTag);
    final guardianNote = widget.role.guardianRelationshipLabel;

    final reducedMotion = MediaQuery.maybeDisableAnimationsOf(context) ?? false;
    final animationDuration = reducedMotion
        ? Duration.zero
        : const Duration(milliseconds: 180);

    final semanticLabel = guardianNote != null
        ? '${widget.role.title}. Category: $categoryTag. ${widget.role.description}. $guardianNote.'
        : '${widget.role.title}. Category: $categoryTag. ${widget.role.description}.';

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: animationDuration,
        curve: Curves.easeOut,
        padding: const EdgeInsets.all(MindSpacing.space16),
        decoration: BoxDecoration(
          color: _isHovered
              ? MindColors.surfaceEmphasis
              : MindColors.surfaceDefault,
          borderRadius: BorderRadius.circular(cardRadius),
          border: Border.all(
            color: _isHovered
                ? accentColor.withValues(alpha: 0.8)
                : MindColors.borderQuiet,
            width: _isHovered ? 1.5 : 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? accentColor.withValues(alpha: 0.15)
                  : Colors.black.withValues(alpha: 0.25),
              blurRadius: _isHovered ? 16.0 : 8.0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Semantics(
          label: semanticLabel,
          container: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(MindSpacing.space8),
                    decoration: BoxDecoration(
                      color: accentColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(
                        MindSpacing.radiusControl,
                      ),
                      border: Border.all(
                        color: accentColor.withValues(alpha: 0.4),
                        width: 1.0,
                      ),
                    ),
                    child: Icon(icon, size: 20.0, color: accentColor),
                  ),
                  const SizedBox(width: MindSpacing.space12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.role.title,
                          style: MindTypography.cardTitle(
                            context,
                          ).copyWith(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 2.0),
                        Text(
                          categoryTag,
                          style:
                              MindTypography.label(
                                context,
                                color: accentColor,
                              ).copyWith(
                                fontSize: 11.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: MindSpacing.space12),
              Text(
                widget.role.description,
                style: MindTypography.body(
                  context,
                  color: MindColors.textSecondary,
                ).copyWith(fontSize: 13.5, height: 1.45),
              ),
              if (guardianNote != null) ...[
                const SizedBox(height: MindSpacing.space12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: MindSpacing.space12,
                    vertical: MindSpacing.space8,
                  ),
                  decoration: BoxDecoration(
                    color: MindColors.roleGuardian.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(
                      MindSpacing.radiusControl,
                    ),
                    border: Border.all(
                      color: MindColors.roleGuardian.withValues(alpha: 0.4),
                      width: 1.0,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.shield_outlined,
                        size: 14.0,
                        color: MindColors.roleGuardian,
                      ),
                      const SizedBox(width: MindSpacing.space8),
                      Flexible(
                        child: Text(
                          guardianNote,
                          style:
                              MindTypography.label(
                                context,
                                color: MindColors.roleGuardian,
                              ).copyWith(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
