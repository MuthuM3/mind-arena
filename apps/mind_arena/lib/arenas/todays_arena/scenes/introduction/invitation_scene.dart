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
    return Scaffold(
      backgroundColor: MindColors.canvasBase,
      body: SafeArea(
        child: ResponsiveLayout(
          compact: (context) => _buildCompactLayout(context, ref),
          medium: (context) => _buildMediumLayout(context, ref),
          expanded: (context) => _buildExpandedLayout(context, ref),
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
          _buildAtmosphericHeader(context),
          const SizedBox(height: MindSpacing.space24),
          _buildPremiseCard(context),
          const SizedBox(height: MindSpacing.space24),
          _buildTrustBadges(context),
          const SizedBox(height: MindSpacing.space32),
          _buildEnterButton(context, ref),
        ],
      ),
    );
  }

  Widget _buildMediumLayout(BuildContext context, WidgetRef ref) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 720.0),
        child: Padding(
          padding: MindSpacing.edgeInsetsFor(MediaQuery.sizeOf(context).width),
          child: SingleChildScrollView(
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
                _buildEnterButton(context, ref),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExpandedLayout(BuildContext context, WidgetRef ref) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1080.0),
        child: Padding(
          padding: MindSpacing.edgeInsetsFor(MediaQuery.sizeOf(context).width),
          child: SingleChildScrollView(
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
                      _buildEnterButton(context, ref),
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
        Semantics(
          header: true,
          child: Text(
            'Today’s Arena',
            style: MindTypography.supporting(
              context,
              color: MindColors.actionPrimary,
            ).copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(height: MindSpacing.space8),
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
        color: MindColors.surfaceDefault,
        borderRadius: BorderRadius.circular(MindSpacing.radiusCardExpanded),
        border: Border.all(color: MindColors.borderQuiet),
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
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHowItWorksRail(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(MindSpacing.space24),
      decoration: BoxDecoration(
        color: MindColors.surfaceEmphasis,
        borderRadius: BorderRadius.circular(MindSpacing.radiusCardExpanded),
        border: Border.all(color: MindColors.borderQuiet),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'How Today’s Arena Works',
            style: MindTypography.cardTitle(context),
          ),
          const SizedBox(height: MindSpacing.space16),
          _buildPoint(
            context,
            '1. Consider the situation',
            'Read the 6 roles and immutable facts.',
          ),
          const SizedBox(height: MindSpacing.space12),
          _buildPoint(
            context,
            '2. Commit privately',
            'Make your 3-seat decision before seeing others.',
          ),
          const SizedBox(height: MindSpacing.space12),
          _buildPoint(
            context,
            '3. Encounter real minds',
            'Engage with perspectives authored by real adults.',
          ),
        ],
      ),
    );
  }

  Widget _buildPoint(BuildContext context, String title, String detail) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: MindTypography.label(context, color: MindColors.actionPrimary),
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
    );
  }

  Widget _buildTrustBadges(BuildContext context) {
    return Wrap(
      spacing: MindSpacing.space12,
      runSpacing: MindSpacing.space8,
      children: [
        ProvenanceBadge(
          label: 'Shared with real people · Not live',
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

  Widget _buildEnterButton(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: PrimaryActionButton(
        label: 'Enter arena',
        onPressed: () {
          ref.read(arenaSessionControllerProvider.notifier).enterSituation();
        },
      ),
    );
  }
}
