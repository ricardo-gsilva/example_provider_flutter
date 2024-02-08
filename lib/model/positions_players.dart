// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:example_provider/model/position_player.dart';

class PositionsPlayers extends ChangeNotifier {
  List<PositionPlayerModel> positions;

  PositionsPlayers({
    required this.positions,
  });

  void add (PositionPlayerModel position){
    positions.add(position);
    notifyListeners();
  }
}
