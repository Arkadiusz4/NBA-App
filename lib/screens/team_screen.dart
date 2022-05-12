import 'package:flutter/material.dart';
import 'package:nba_app/models/team_model.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class TeamScreen extends StatefulWidget {
  const TeamScreen({Key? key}) : super(key: key);

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  final List<String> _team = [];

  Future<List<TeamResponse>> getTeam() async {
    //https://apiv2.allsportsapi.com/basketball/?met=Teams&APIkey=048b6af902a7611b4fd95f5ea44a3cf77c371dc49b91f24099f217329c76ce05&leagueId=766

    final queryParametrs = {
      'met': 'Teams',
      'ApiKey':
          '048b6af902a7611b4fd95f5ea44a3cf77c371dc49b91f24099f217329c76ce05',
      'leagueId': '766'
    };

    final uri =
        Uri.https('apiv2.allsportsapi.com', '/basketball/?', queryParametrs);

    final teamResponse = await http.get(uri);

    List<TeamResponse> teamList = [];

    if (teamResponse.body == 200) {
      var teamjson = json.decode(teamResponse.body);

      for (var jsondata in teamjson) {
        teamList.add(TeamResponse.fromJson(jsondata));
      }
    }

    return teamList;
  }

  @override
  void initState() {
    getTeam().then((value) {
      setState(() {
        _team.addAll(_team);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _team.length,
        itemBuilder: (BuildContext context, index) {
          return Card(
            child: Text(_team[index]['team_name'].toString()),
          );
        },
      ),
    );
  }
}
