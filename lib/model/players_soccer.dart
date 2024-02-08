// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:example_provider/model/player_soccer.dart';

class PlayersSoccer extends ChangeNotifier {
  List<PlayerSoccerModel> players;
  
  PlayersSoccer({
    required this.players,
  });

  void add(PlayerSoccerModel player){
    players.add(player);
    notifyListeners();
  }
}
