import 'package:example_provider/components/card_player.dart';
import 'package:example_provider/components/drawer_menu.dart';
import 'package:example_provider/model/player_soccer.dart';
import 'package:example_provider/model/players_soccer.dart';
import 'package:example_provider/model/position_player.dart';
import 'package:example_provider/model/positions_players.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayerSoccer extends StatefulWidget {
  const PlayerSoccer({super.key});

  @override
  State<PlayerSoccer> createState() => _PlayerSoccerState();
}

class _PlayerSoccerState extends State<PlayerSoccer> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Jogadores"),
        backgroundColor: Colors.indigo,
      ),
      drawer: const DrawerMenu(),
      body: Consumer<PlayersSoccer>(
        builder: (BuildContext context, PlayersSoccer list, Widget? widget){          
          return ListView.builder(
            itemCount: list.players.length,
            itemBuilder: ((context, index) {
                return Dismissible(
                  key: UniqueKey(),                  
                  background: Container(color: Colors.red,),
                  child: ListTile(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_){
                          return CardPlayer(player: list.players[index],);
                        }
                      );
                    },
                    leading: Icon(list.players[index].position.icon),
                    title: Text(list.players[index].name),
                    iconColor: Colors.indigo,
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      list.players.removeAt(index);
                    });
                  },
                );
              }
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          createType(context);
        },
        backgroundColor: Colors.indigo,
        tooltip: 'Add Tipo',
        child: const Icon(Icons.add),
      ),
    );
  }

  void createType(context){
    TextEditingController nameInput = TextEditingController();
    TextEditingController heightInput = TextEditingController();
    TextEditingController countryInput = TextEditingController();
    TextEditingController teamInput = TextEditingController();
    PositionsPlayers listPositions = Provider.of<PositionsPlayers>(context, listen: false);
    PositionPlayerModel dropDownValue = listPositions.positions[0];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: const Text(''),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: nameInput,
                    decoration: const InputDecoration(
                      labelText: '',
                      icon: Icon(Icons.abc)
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(5)),
                        TextFormField(
                          controller: heightInput,
                          decoration: const InputDecoration(
                            labelText: 'Altura',
                            icon: Icon(Icons.email),
                          ),
                        ),
                  const Padding(padding: EdgeInsets.all(5)),
                        TextFormField(
                          controller: countryInput,
                          decoration: const InputDecoration(
                            labelText: 'País',
                            icon: Icon(Icons.email),
                          ),
                        ),
                  const Padding(padding: EdgeInsets.all(5)),
                        TextFormField(
                          controller: teamInput,
                          decoration: const InputDecoration(
                            labelText: 'Time',
                            icon: Icon(Icons.email),
                          ),
                        ),                  
                        const Padding(padding: EdgeInsets.all(5)),
                        StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
                          return DropdownButton(
                            isExpanded: true,
                            value: dropDownValue,
                            icon: const Icon(Icons.arrow_downward),
                            style: const TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 2,
                              color: Colors.indigo,
                            ),
                            onChanged: (newValue) {
                              setState(() {
                                dropDownValue = newValue as PositionPlayerModel;
                              });
                            },
                            items: listPositions.positions.map((PositionPlayerModel position) {
                              return DropdownMenuItem<PositionPlayerModel>(
                                value: position,
                                child: Text(position.position),
                              );
                            }).toList(),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
                actions: [
                  Consumer<PlayersSoccer>(
                    builder: (BuildContext context, PlayersSoccer list, Widget? widget) {
                      return TextButton(
                        child: const Text("Salvar"),
                        onPressed: () async {
                          setState(() {
                            list.add(PlayerSoccerModel(
                              name: nameInput.text,
                              height: double.parse(heightInput.text),
                              country: countryInput.text,
                              team: teamInput.text,
                              position: dropDownValue)
                            );
                          });
                          Navigator.pop(context);
                        }
                      );
                    }
                  ),                  
                  TextButton(
                    child: const Text("Calcelar"),
                    onPressed: () {
                      Navigator.pop(context);
                    }
                  ),
                ],
              );
      }
    );
  }
}