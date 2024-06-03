import 'package:endgame/src/components/cards/team_card.dart';
import 'package:endgame/src/serialized/tba/tba_team.dart';
import 'package:endgame/src/services/tba_api_service.dart';
import 'package:flutter/material.dart';

class AllTeamDialog extends StatefulWidget {
  const AllTeamDialog({
    super.key,
    required this.allTeams,
    required this.scrollController,
  });

  final List<TBATeam> allTeams;
  final ScrollController scrollController;

  @override
  State<AllTeamDialog> createState() => _AllTeamDialogState();
}

class _AllTeamDialogState extends State<AllTeamDialog> {
  List<TBATeam> _allTeams = [];
  bool _isLoading = false;
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _allTeams = widget.allTeams;
    widget.scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (widget.scrollController.position.pixels ==
            widget.scrollController.position.maxScrollExtent &&
        !_isLoading) {
      _fetchPage(_currentPage + 1).onError(
        (error, stackTrace) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Failed to fetch more teams"),
            ),
          );
        },
      );
    }
  }

  Future<void> _fetchPage(int nextPage) async {
    setState(() {
      _isLoading = true;
    });
    List<TBATeam> newTeams = await TBAAPIService.getTeams(nextPage);
    setState(() {
      _allTeams.addAll(newTeams);
      _currentPage = nextPage;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _allTeams.length + (_isLoading ? 1 : 0),
          itemBuilder: (BuildContext context, int index) {
            if (index == _allTeams.length) {
              return _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : const SizedBox.shrink();
            }
            return TeamCard(
              team: _allTeams[index],
            );
          },
        ),
      ],
    );
  }
}
