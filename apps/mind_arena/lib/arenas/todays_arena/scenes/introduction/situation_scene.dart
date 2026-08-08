import 'dart:async';
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

  void _handleLeave(BuildContext context, WidgetRef ref) {
    unawaited(
      ref.read(arenaSessionControllerProvider.notifier).loadInvitation(),
    );
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Left arena session.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = PrimaryScrollController.of(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: MindColors.cosmicRadialBackground,
        ),
        child: SafeArea(
          child: Column(
            children: [
              ArenaHeader(
                stageTitle: 'Situation Reveal',
                scenarioTitle: package.title,
                currentStep: 2,
                totalSteps: 7,
                onExit: () => _handleLeave(context, ref),
              ),
              Expanded(
                child: Stack(
                  children: [
                    ResponsiveLayout(
                      compact: (context) =>
                          _buildCompactLayout(context, ref, scrollController),
                      medium: (context) =>
                          _buildMediumLayout(context, ref, scrollController),
                      expanded: (context) =>
                          _buildExpandedLayout(context, ref, scrollController),
                    ),
                    if (isFactsPanelOpen)
                      Positioned.fill(
                        child: Container(
                          color: MindColors.canvasBase.withValues(alpha: 0.85),
                          padding: const EdgeInsets.all(MindSpacing.space24),
                          child: Center(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 640.0,
                              ),
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
      ),
    );
  }

  Widget _buildCompactLayout(
    BuildContext context,
    WidgetRef ref,
    ScrollController scrollController,
  ) {
    return SingleChildScrollView(
      controller: scrollController,
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
          _buildTerminalActions(context, ref),
        ],
      ),
    );
  }

  Widget _buildMediumLayout(
    BuildContext context,
    WidgetRef ref,
    ScrollController scrollController,
  ) {
    return SingleChildScrollView(
      controller: scrollController,
      padding: MindSpacing.edgeInsetsFor(MediaQuery.sizeOf(context).width),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 880.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPremiseHeader(context),
              const SizedBox(height: MindSpacing.space16),
              _buildFactsReviewButton(context, ref),
              const SizedBox(height: MindSpacing.space24),
              _buildTwoColumnRoles(context, package.roles),
              const SizedBox(height: MindSpacing.space32),
              _buildTerminalActions(context, ref),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpandedLayout(
    BuildContext context,
    WidgetRef ref,
    ScrollController scrollController,
  ) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200.0),
        child: Padding(
          padding: MindSpacing.edgeInsetsFor(MediaQuery.sizeOf(context).width),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Column: Premise Hero Card & Action Controls
              Expanded(
                flex: 5,
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildPremiseHeader(context),
                      const SizedBox(height: MindSpacing.space24),
                      _buildFactsReviewButton(context, ref),
                      const SizedBox(height: MindSpacing.space32),
                      _buildTerminalActions(context, ref),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: MindSpacing.space32),
              // Right Column: Roles Grid
              Expanded(
                flex: 7,
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
    return Container(
      padding: const EdgeInsets.all(MindSpacing.space24),
      decoration: BoxDecoration(
        color: MindColors.surfaceDefault.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(MindSpacing.radiusCardExpanded),
        border: Border.all(color: MindColors.borderQuiet, width: 1.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 16.0,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 4.0,
                height: 28.0,
                decoration: BoxDecoration(
                  color: MindColors.actionPrimary,
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
              const SizedBox(width: MindSpacing.space12),
              Expanded(
                child: Focus(
                  autofocus: true,
                  child: Text(
                    package.stakesLine,
                    style: MindTypography.sceneTitle(context),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: MindSpacing.space16),
          Text(
            package.premise,
            style: MindTypography.body(
              context,
              color: MindColors.textSecondary,
            ).copyWith(height: 1.5),
          ),
          const SizedBox(height: MindSpacing.space16),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: MindSpacing.space12,
              vertical: MindSpacing.space8,
            ),
            decoration: BoxDecoration(
              color: MindColors.worldConsequence.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(MindSpacing.radiusControl),
              border: Border.all(
                color: MindColors.worldConsequence.withValues(alpha: 0.5),
                width: 1.0,
              ),
            ),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: MindSpacing.space8,
              children: [
                const Icon(
                  Icons.info_outline_rounded,
                  size: 16.0,
                  color: MindColors.worldConsequence,
                ),
                Text(
                  'There is no approved correct list.',
                  style: MindTypography.label(
                    context,
                    color: MindColors.worldConsequence,
                  ).copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
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

  Widget _buildTerminalActions(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: PrimaryActionButton(
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
            ),
            const SizedBox(width: MindSpacing.space12),
            SecondaryActionButton(
              label: 'Leave arena',
              onPressed: () => _handleLeave(context, ref),
            ),
          ],
        ),
        const SizedBox(height: MindSpacing.space12),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: MindSpacing.space4,
          children: [
            const Icon(
              Icons.verified_outlined,
              size: 14.0,
              color: MindColors.textMuted,
            ),
            Text(
              'M1.5 Slice 01 Preview Boundary',
              style: MindTypography.supporting(
                context,
                color: MindColors.textMuted,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
