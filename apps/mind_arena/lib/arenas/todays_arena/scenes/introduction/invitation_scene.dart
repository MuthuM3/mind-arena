import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mind_arena/components/arena/provenance_badge.dart';
import 'package:mind_arena/components/controls/mind_buttons.dart';
import 'package:mind_arena/design/responsive/window_class.dart';
import 'package:mind_arena/design/tokens/mind_colors.dart';
import 'package:mind_arena/design/tokens/mind_spacing.dart';
import 'package:mind_arena/design/typography/mind_typography.dart';
import 'package:mind_arena/domain/models/arena_package.dart';
import 'package:mind_arena/experience/orchestration/arena_session_controller.dart';

/// Scene TA-01 — Invitation
class InvitationScene extends ConsumerWidget {
  const InvitationScene({super.key, required this.package});

  final MarsRescuePackage package;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = PrimaryScrollController.of(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: MindColors.cosmicRadialBackground,
        ),
        child: SafeArea(
          child: ResponsiveLayout(
            compact: (context) =>
                _buildCompactLayout(context, ref, scrollController),
            medium: (context) =>
                _buildMediumLayout(context, ref, scrollController),
            expanded: (context) =>
                _buildExpandedLayout(context, ref, scrollController),
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
          _buildAtmosphericHeader(context),
          const SizedBox(height: MindSpacing.space24),
          _buildPremiseCard(context),
          const SizedBox(height: MindSpacing.space24),
          _buildTrustBadges(context),
          const SizedBox(height: MindSpacing.space32),
          _buildActionButtons(context, ref),
        ],
      ),
    );
  }

  Widget _buildMediumLayout(
    BuildContext context,
    WidgetRef ref,
    ScrollController scrollController,
  ) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 760.0),
        child: Padding(
          padding: MindSpacing.edgeInsetsFor(MediaQuery.sizeOf(context).width),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAtmosphericHeader(context),
                const SizedBox(height: MindSpacing.space32),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 3, child: _buildPremiseCard(context)),
                    const SizedBox(width: MindSpacing.space24),
                    Expanded(flex: 2, child: _buildHowItWorksRail(context)),
                  ],
                ),
                const SizedBox(height: MindSpacing.space32),
                _buildTrustBadges(context),
                const SizedBox(height: MindSpacing.space32),
                _buildActionButtons(context, ref),
              ],
            ),
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
        constraints: const BoxConstraints(maxWidth: 1140.0),
        child: Padding(
          padding: MindSpacing.edgeInsetsFor(MediaQuery.sizeOf(context).width),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildAtmosphericHeader(context),
                      const SizedBox(height: MindSpacing.space32),
                      _buildPremiseCard(context),
                      const SizedBox(height: MindSpacing.space32),
                      _buildTrustBadges(context),
                      const SizedBox(height: MindSpacing.space32),
                      _buildActionButtons(context, ref),
                    ],
                  ),
                ),
                const SizedBox(width: MindSpacing.space48),
                Expanded(flex: 4, child: _buildHowItWorksRail(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAtmosphericHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: MindSpacing.space12,
            vertical: MindSpacing.space4,
          ),
          decoration: BoxDecoration(
            color: MindColors.actionPrimary.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(MindSpacing.radiusPill),
            border: Border.all(
              color: MindColors.actionPrimary.withValues(alpha: 0.4),
              width: 1.0,
            ),
          ),
          child: Semantics(
            header: true,
            child: Text(
              'Today’s Arena',
              style: MindTypography.supporting(
                context,
                color: MindColors.actionPrimary,
              ).copyWith(fontWeight: FontWeight.w700, fontSize: 12.0),
            ),
          ),
        ),
        const SizedBox(height: MindSpacing.space12),
        Focus(
          autofocus: true,
          child: Text(package.title, style: MindTypography.display(context)),
        ),
      ],
    );
  }

  Widget _buildPremiseCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(MindSpacing.space24),
      decoration: BoxDecoration(
        color: MindColors.surfaceDefault.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(MindSpacing.radiusCardExpanded),
        border: Border.all(color: MindColors.borderQuiet),
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
          Text(
            package.stakesLine,
            style: MindTypography.sceneTitle(
              context,
              color: MindColors.textPrimary,
            ),
          ),
          const SizedBox(height: MindSpacing.space16),
          Text(
            package.premise,
            style: MindTypography.body(
              context,
              color: MindColors.textSecondary,
            ).copyWith(height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildHowItWorksRail(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(MindSpacing.space24),
      decoration: BoxDecoration(
        color: MindColors.surfaceEmphasis.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(MindSpacing.radiusCardExpanded),
        border: Border.all(color: MindColors.borderQuiet),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 12.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'How Today’s Arena Works',
            style: MindTypography.cardTitle(context),
          ),
          const SizedBox(height: MindSpacing.space24),
          _buildPoint(
            context,
            '1. Consider the situation',
            'Read the 6 roles and immutable facts.',
            Icons.explore_outlined,
          ),
          const SizedBox(height: MindSpacing.space16),
          _buildPoint(
            context,
            '2. Commit privately',
            'Make your 3-seat decision before seeing others.',
            Icons.lock_outline_rounded,
          ),
          const SizedBox(height: MindSpacing.space16),
          _buildPoint(
            context,
            '3. Encounter real minds',
            'Engage with perspectives authored by real adults.',
            Icons.people_outline_rounded,
          ),
        ],
      ),
    );
  }

  Widget _buildPoint(
    BuildContext context,
    String title,
    String detail,
    IconData icon,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32.0,
          height: 32.0,
          decoration: BoxDecoration(
            color: MindColors.actionPrimary.withValues(alpha: 0.12),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 16.0, color: MindColors.actionPrimary),
        ),
        const SizedBox(width: MindSpacing.space12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: MindTypography.label(
                  context,
                  color: MindColors.actionPrimary,
                ),
              ),
              const SizedBox(height: MindSpacing.space4),
              Text(
                detail,
                style: MindTypography.supporting(
                  context,
                  color: MindColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTrustBadges(BuildContext context) {
    return Wrap(
      spacing: MindSpacing.space12,
      runSpacing: MindSpacing.space8,
      children: [
        ProvenanceBadge(
          label: package.socialTruthLabel,
          color: MindColors.humanPrimary,
        ),
        ProvenanceBadge(
          label: '~${package.estimatedMinutes} minutes',
          color: MindColors.actionPrimary,
        ),
        ProvenanceBadge(
          label: package.audienceClassification,
          color: MindColors.textMuted,
          backgroundColor: MindColors.surfaceDefault,
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: PrimaryActionButton(
            label: 'Enter arena',
            onPressed: () {
              ref
                  .read(arenaSessionControllerProvider.notifier)
                  .enterSituation();
            },
          ),
        ),
        const SizedBox(width: MindSpacing.space12),
        SecondaryActionButton(
          label: 'Leave arena',
          onPressed: () {
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
          },
        ),
      ],
    );
  }
}
