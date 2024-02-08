import 'package:example_provider/components/drawer_menu.dart';
import 'package:example_provider/components/icon_picker.dart';
import 'package:example_provider/model/position_player.dart';
import 'package:example_provider/model/positions_players.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PositionPlayer extends StatefulWidget {
  const PositionPlayer({Key? key}) : super(key: key);

  @override
  State<PositionPlayer> createState() => _PositionPlayerState();
}

class _PositionPlayerState extends State<PositionPlayer> {
  IconData? selectedIcon;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Posições'),
      ),
      drawer: const DrawerMenu(),
      body: Consumer<PositionsPlayers>(
        builder: (BuildContext context, PositionsPlayers list, Widget? widget) {
          return ListView.builder(
          itemCount: list.positions.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              background: Container(color: Colors.red),
              child: ListTile(
                leading: Icon(list.positions[index].icon),
                title: Text(list.positions[index].position),
                iconColor: Colors.deepOrange,
              ),
              onDismissed: (direction) {
                setState(() {
                  list.positions.removeAt(index);
                });
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: (){createType(context);},
        tooltip: 'Add Tipo',
        child: const Icon(Icons.add),
      ),
    );
  }

  void createType(context) {
    TextEditingController positionInput = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: const Text('Cadastrar tipo'),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: positionInput,
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                      icon: Icon(Icons.account_box),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(5)),
                  StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
                    return Column(children: [
                      const Padding(padding: EdgeInsets.all(5)),
                      selectedIcon != null ? Icon(selectedIcon, color: Colors.deepOrange) : const Text('Selecione um ícone'),
                      const Padding(padding: EdgeInsets.all(5)),
                      SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                            onPressed: () async {
                              final IconData? result = await showIconPicker(context: context, defaultIcon: selectedIcon);
                              setState(() {
                                selectedIcon = result;
                              });
                            },
                            child: const Text('Selecionar icone')
                        ),
                      ),
                    ]);
                  }),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              child: const Text("Salvar"),
              onPressed: () {
                selectedIcon ??= Icons.credit_score;
                Provider.of<PositionsPlayers>(context, listen: false).add(PositionPlayerModel(position: positionInput.text, icon: selectedIcon));
                selectedIcon = null;
                Navigator.pop(context);
              }
            ),
            TextButton(
              child: const Text("Calcelar"),
              onPressed: () async {
                selectedIcon = null;
                Navigator.pop(context);
              }
            )
          ],
        );
      }
    );
  }
}
