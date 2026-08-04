import 'package:flutter/material.dart';
import 'package:mind_arena/design/responsive/window_class.dart';
import 'package:mind_arena/design/tokens/mind_colors.dart';
import 'package:mind_arena/design/tokens/mind_spacing.dart';
import 'package:mind_arena/design/typography/mind_typography.dart';
import 'package:mind_arena/domain/models/arena_package.dart';

/// Card rendering a scenario role in presentation mode for TA-02 Situation.
/// Uses custom vector glyphs, category color accents, and subtle glassmorphic depth.
class RoleCard extends StatefulWidget {
  const RoleCard({super.key, required this.role});

  final ArenaRole role;

  @override
  State<RoleCard> createState() => _RoleCardState();
}

class _RoleCardState extends State<RoleCard> {
  bool _isHovered = false;

  (IconData, Color, String) _getRoleTheme(String title) {
    if (title.contains('Engineer')) {
      return (
        Icons.bolt_rounded,
        MindColors.roleEngineering,
        'Power & Systems',
      );
    } else if (title.contains('Physician')) {
      return (
        Icons.medical_services_outlined,
        MindColors.roleMedical,
        'Medicine & Trauma',
      );
    } else if (title.contains('Pilot')) {
      return (
        Icons.flight_takeoff_rounded,
        MindColors.roleFlight,
        'Aviation & Orbit',
      );
    } else if (title.contains('Scientist')) {
      return (Icons.eco_outlined, MindColors.roleBiology, 'Ecology & Food');
    } else if (title.contains('Dependent')) {
      return (
        Icons.child_care_rounded,
        MindColors.roleGuardian,
        'Minor / Protection',
      );
    } else {
      return (
        Icons.account_balance_outlined,
        MindColors.roleGovernance,
        'Governance',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final windowClass = WindowClass.of(context);
    final cardRadius = windowClass.isCompact
        ? MindSpacing.radiusCardCompact
        : MindSpacing.radiusCardExpanded;

    final (icon, accentColor, categoryTag) = _getRoleTheme(widget.role.title);

    final guardianNote = widget.role.guardianToRoleId != null
        ? 'Public guardian to Young Dependent'
        : null;

    final semanticLabel = guardianNote != null
        ? '${widget.role.title}. Category: $categoryTag. ${widget.role.description}. $guardianNote.'
        : '${widget.role.title}. Category: $categoryTag. ${widget.role.description}.';

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
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
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Role Icon Badge Container
                  Container(
                    width: 38.0,
                    height: 38.0,
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
                          style: MindTypography.cardTitle(context),
                        ),
                        const SizedBox(height: MindSpacing.space4),
                        Text(
                          categoryTag,
                          style:
                              MindTypography.supporting(
                                context,
                                color: accentColor,
                              ).copyWith(
                                fontSize: 12.0,
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
                ).copyWith(fontSize: 14.5, height: 1.45),
              ),
              if (guardianNote != null) ...[
                const SizedBox(height: MindSpacing.space12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: MindSpacing.space12,
                    vertical: MindSpacing.space8,
                  ),
                  decoration: BoxDecoration(
                    color: MindColors.worldConsequence.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(
                      MindSpacing.radiusControl,
                    ),
                    border: Border.all(
                      color: MindColors.worldConsequence.withValues(alpha: 0.6),
                      width: 1.0,
                    ),
                  ),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: MindSpacing.space8,
                    children: [
                      const Icon(
                        Icons.shield_outlined,
                        size: 14.0,
                        color: MindColors.worldConsequence,
                      ),
                      Text(
                        guardianNote,
                        style: MindTypography.supporting(
                          context,
                          color: MindColors.worldConsequence,
                        ).copyWith(fontSize: 12.0, fontWeight: FontWeight.w600),
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
