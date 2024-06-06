import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:endgame/src/components/cards/team_card.dart';
import 'package:endgame/src/providers/tba_api_providers.dart';
import 'package:endgame/src/serialized/tba/tba_team_simple.dart';

class PaginationState {
  PaginationState({required this.teams, required this.isLoading});

  final List<TBATeamSimple> teams;
  final bool isLoading;
}

class PaginationController extends StateNotifier<PaginationState> {
  PaginationController(this.ref)
      : super(PaginationState(teams: [], isLoading: false)) {
    _fetchNextPage();
  }

  final Ref ref;
  int currentPage = 0;
  bool _isFetching = false;

  Future<void> _fetchNextPage() async {
    if (state.isLoading || _isFetching) return;

    _isFetching = true;
    state = PaginationState(teams: state.teams, isLoading: true);

    final currentStatus = await ref.read(getStatusProvider.future);
    final newTeams = await ref.read(getTeamsSimpleForYearProvider(
      currentStatus.currentSeason ?? DateTime.now().year,
      currentPage,
    ).future);
    state =
        PaginationState(teams: [...state.teams, ...newTeams], isLoading: false);
    currentPage++;
    _isFetching = false;
  }

  void nextPage() {
    _fetchNextPage();
  }
}

final paginationControllerProvider =
    StateNotifierProvider<PaginationController, PaginationState>((ref) {
  return PaginationController(ref);
});

class AllTeamDialog extends ConsumerWidget {
  const AllTeamDialog({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paginationState = ref.watch(paginationControllerProvider);

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        ref.read(paginationControllerProvider.notifier).nextPage();
      }
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Text(
            "All Teams",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: paginationState.teams.length,
          itemBuilder: (BuildContext context, int index) {
            return TeamCard(
              team: paginationState.teams[index],
            );
          },
        ),
        if (paginationState.isLoading)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Center(child: CircularProgressIndicator()),
          ),
      ],
    );
  }
}
