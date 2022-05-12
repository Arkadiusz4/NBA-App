class TeamResponse {
  String? teamKey;
  String? teamName;
  String? teamLogo;

  TeamResponse({this.teamKey, this.teamName, this.teamLogo});

  TeamResponse.fromJson(Map<String, dynamic> json) {
    teamKey = json['team_key'];
    teamName = json['team_name'];
    teamLogo = json['team_logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['team_key'] = teamKey;
    data['team_name'] = teamName;
    data['team_logo'] = teamLogo;
    return data;
  }
}
