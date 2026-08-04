import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mind_arena/components/arena/arena_header.dart';
import 'package:mind_arena/components/arena/role_card.dart';
import 'package:mind_arena/components/arena/situation_facts_panel.dart';
import 'package:mind_arena/components/controls/mind_buttons.dart';
import 'package:mind_arena/design/responsive/window_class.dart';
import 'package:mind_arena/design/tokens/mind_colors.dart';
import 'package:mind_arena/design/tokens/mind_spacing.dart';
import 'package:mind_arena/design/typography/mind_typography.dart';
import 'package:mind_arena/domain/models/arena_package.dart';
import 'package:mind_arena/experience/orchestration/arena_session_controller.dart';

/// Scene TA-02 — Situation Reveal
class SituationScene extends ConsumerWidget {
  const SituationScene({
    super.key,
    required this.package,
    required this.isFactsPanelOpen,
  });

  final MarsRescuePackage package;
  final bool isFactsPanelOpen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: MindColors.canvasBase,
      body: SafeArea(
        child: Column(
          children: [
            const ArenaHeader(stageTitle: 'Situation Reveal'),
            Expanded(
              child: Stack(
                children: [
                  ResponsiveLayout(
                    compact: (context) => _buildCompactLayout(context, ref),
                    medium: (context) => _buildMediumLayout(context, ref),
                    expanded: (context) => _buildExpandedLayout(context, ref),
                  ),
                  if (isFactsPanelOpen)
                    Positioned.fill(
                      child: Container(
                        color: MindColors.canvasBase.withValues(alpha: 0.85),
                        padding: const EdgeInsets.all(MindSpacing.space24),
                        child: Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 640.0),
                            child: SituationFactsPanel(
                              facts: package.facts,
                              onClose: () {
                                ref
                                    .read(
                                      arenaSessionControllerProvider.notifier,
                                    )
                                    .closeFactsPanel();
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompactLayout(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: MindSpacing.edgeInsetsFor(MediaQuery.sizeOf(context).width),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPremiseHeader(context),
          const SizedBox(height: MindSpacing.space16),
          _buildFactsReviewButton(context, ref),
          const SizedBox(height: MindSpacing.space24),
          _buildRolesList(context, package.roles),
          const SizedBox(height: MindSpacing.space32),
          _buildTerminalAction(context),
        ],
      ),
    );
  }

  Widget _buildMediumLayout(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: MindSpacing.edgeInsetsFor(MediaQuery.sizeOf(context).width),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 840.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPremiseHeader(context),
              const SizedBox(height: MindSpacing.space16),
              _buildFactsReviewButton(context, ref),
              const SizedBox(height: MindSpacing.space24),
              _buildTwoColumnRoles(context, package.roles),
              const SizedBox(height: MindSpacing.space32),
              _buildTerminalAction(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpandedLayout(BuildContext context, WidgetRef ref) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1140.0),
        child: Padding(
          padding: MindSpacing.edgeInsetsFor(MediaQuery.sizeOf(context).width),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildPremiseHeader(context),
                    const SizedBox(height: MindSpacing.space24),
                    _buildFactsReviewButton(context, ref),
                    const SizedBox(height: MindSpacing.space32),
                    _buildTerminalAction(context),
                  ],
                ),
              ),
              const SizedBox(width: MindSpacing.space32),
              Expanded(
                flex: 6,
                child: SingleChildScrollView(
                  child: _buildTwoColumnRoles(context, package.roles),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPremiseHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Focus(
          autofocus: true,
          child: Text(
            'One shuttle. Exactly 3 seats. 6 lives.',
            style: MindTypography.sceneTitle(context),
          ),
        ),
        const SizedBox(height: MindSpacing.space8),
        Text(
          package.premise,
          style: MindTypography.body(context, color: MindColors.textSecondary),
        ),
        const SizedBox(height: MindSpacing.space12),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: MindSpacing.space12,
            vertical: MindSpacing.space8,
          ),
          decoration: BoxDecoration(
            color: MindColors.surfaceEmphasis,
            borderRadius: BorderRadius.circular(MindSpacing.radiusControl),
            border: Border.all(color: MindColors.borderQuiet),
          ),
          child: Text(
            'There is no approved correct list.',
            style: MindTypography.label(
              context,
              color: MindColors.worldConsequence,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFactsReviewButton(BuildContext context, WidgetRef ref) {
    return SecondaryActionButton(
      label: 'Review facts and rules',
      onPressed: () {
        ref.read(arenaSessionControllerProvider.notifier).toggleFactsPanel();
      },
    );
  }

  Widget _buildRolesList(BuildContext context, List<ArenaRole> roles) {
    return Column(
      children: roles
          .map(
            (role) => Padding(
              padding: const EdgeInsets.only(bottom: MindSpacing.space12),
              child: RoleCard(role: role),
            ),
          )
          .toList(),
    );
  }

  Widget _buildTwoColumnRoles(BuildContext context, List<ArenaRole> roles) {
    final leftColumn = <ArenaRole>[];
    final rightColumn = <ArenaRole>[];

    for (var i = 0; i < roles.length; i++) {
      if (i % 2 == 0) {
        leftColumn.add(roles[i]);
      } else {
        rightColumn.add(roles[i]);
      }
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildRolesList(context, leftColumn)),
        const SizedBox(width: MindSpacing.space16),
        Expanded(child: _buildRolesList(context, rightColumn)),
      ],
    );
  }

  Widget _buildTerminalAction(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PrimaryActionButton(
          label: 'I understand the situation',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Slice 01 Complete: You understand the Mars Rescue situation.',
                ),
                duration: Duration(seconds: 3),
              ),
            );
          },
        ),
        const SizedBox(height: MindSpacing.space8),
        Text(
          'M1.5 Slice 01 Preview Boundary',
          style: MindTypography.supporting(
            context,
            color: MindColors.textMuted,
          ),
        ),
      ],
    );
  }
}
