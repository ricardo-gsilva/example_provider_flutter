// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:example_provider/model/player_soccer.dart';

class CardPlayer extends StatelessWidget {
  final PlayerSoccerModel player;
  const CardPlayer({
    Key? key,
    required this.player,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      titlePadding: EdgeInsets.zero,      
      title: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.indigo,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(player.name),
          )
        )
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('País:'),
              Text(player.country, style: const TextStyle(fontSize: 18),),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Altura:'),
              Text(player.height.toString(), style: const TextStyle(fontSize: 18),),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Time:'),
              Text(player.team, style: const TextStyle(fontSize: 18),)
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back)
        )
      ],
    
    );
  }
}
