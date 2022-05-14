class TeamResponse {
    TeamResponse({
        this.success,
        this.result,
    });

    int? success;
    List<Result>? result;

    factory TeamResponse.fromJson(Map<String, dynamic> json) => TeamResponse(
        success: json["success"],
        result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        this.teamKey,
        this.teamName,
        this.teamLogo,
    });

    String? teamKey;
    String? teamName;
    String? teamLogo;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        teamKey: json["team_key"],
        teamName: json["team_name"],
        teamLogo: json["team_logo"] == null ? null : json["team_logo"],
    );

    Map<String, dynamic> toJson() => {
        "team_key": teamKey,
        "team_name": teamName,
        "team_logo": teamLogo == null ? null : teamLogo,
    };
}