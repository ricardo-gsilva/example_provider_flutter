import 'package:example_provider/model/players_soccer.dart';
import 'package:example_provider/model/position_player.dart';
import 'package:example_provider/model/positions_players.dart';
import 'package:example_provider/pages/player_soccer.dart';
import 'package:example_provider/pages/position_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => PlayersSoccer(players: [])),
    ChangeNotifierProvider(create: (context) => PositionsPlayers(positions: [
      PositionPlayerModel(position: 'Goleiro', icon: Icons.abc),
      PositionPlayerModel(position: 'Lateral Direito', icon: Icons.abc),
      PositionPlayerModel(position: 'Lateral Esquerdo', icon: Icons.abc),
      PositionPlayerModel(position: 'Zagueiro', icon: Icons.abc),
    ]))
  ],
  child: const MyApp(),    
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Jogadores',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PlayerSoccer(),
        '/position': (context) => const PositionPlayer(),
      },
    );
  }
}