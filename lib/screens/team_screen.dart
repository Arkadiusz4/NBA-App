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
  // final List<TeamResponse> _team = [];

  var team;

  Future<Result> getTeam() async {
    final response = await http.get(Uri.parse(
        'https://apiv2.allsportsapi.com/basketball/?met=Teams&APIkey=048b6af902a7611b4fd95f5ea44a3cf77c371dc49b91f24099f217329c76ce05&leagueId=766'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return Result.fromJson(data);
    } else {
      return Result.fromJson(data);
    }

    //https://apiv2.allsportsapi.com/basketball/?met=Teams&APIkey=048b6af902a7611b4fd95f5ea44a3cf77c371dc49b91f24099f217329c76ce05&leagueId=766
    //https://jsonkeeper.com/b/HWJ1

    // final queryParametrs = {
    //   'met': 'Teams',
    //   'ApiKey':
    //       '048b6af902a7611b4fd95f5ea44a3cf77c371dc49b91f24099f217329c76ce05',
    //   'leagueId': '766'
    // };

    // final uri =
    //     Uri.https('apiv2.allsportsapi.com', '/basketball/?', queryParametrs);

    // final teamResponse =
    //     await http.get(Uri.parse('https://jsonkeeper.com/b/HWJ1'),);

    // List<TeamResponse> teamList = [];

    // if (teamResponse.body == 200) {
    //   var teamjson = json.decode(teamResponse.body);

    //   for (var jsondata in teamjson) {
    //     teamList.add(TeamResponse.fromJson(jsondata));
    //   }
    // }

    // return teamList;
  }

  @override
  void initState() {
    getTeam();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<Result>(
              future: getTeam(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text('Loading');
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data?.teamName?.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          const Text(
                            '',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      );
                    },
                  );
                }
              }),
            ),
          ),
        ],
      ),
    );
  }
}
