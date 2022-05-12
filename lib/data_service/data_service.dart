import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nba_app/models/team_model.dart';

class DataService {
  Future<TeamResponse> getTeam() async {
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

    print(teamResponse.body);

    final json = jsonDecode(teamResponse.body);

    return TeamResponse.fromJson(json);
  }
}
