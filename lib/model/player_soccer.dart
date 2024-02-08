// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:example_provider/model/position_player.dart';

class PlayerSoccerModel {
  String name;
  double height;
  String country;
  String team;
  PositionPlayerModel position;
  
  PlayerSoccerModel({
    required this.name,
    required this.height,
    required this.country,
    required this.team,
    required this.position
  });

}
