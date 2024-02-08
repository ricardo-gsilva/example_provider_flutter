import 'package:flutter/material.dart';

Future<IconData?> showIconPicker({
  required BuildContext context, IconData? defaultIcon}) async {

  final List<IconData> allIcons = [
    Icons.person
  ];

  IconData? selectedIcon = defaultIcon;

  await showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text('Escolha um ícone'),
      content: Container(
        width: 320,
        height: 400,
        alignment: Alignment.center,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 60,
            childAspectRatio: 1/1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10
          ),
          itemCount: allIcons.length,
          itemBuilder: (_, index) => Container(
            key: ValueKey(allIcons[index].codePoint),
            padding: const EdgeInsets.all(10),
            child: Center(
              child: IconButton(
                onPressed: (){
                  selectedIcon = allIcons[index];
                  Navigator.of(context).pop();
                },
                color: selectedIcon == allIcons[index]?
                  Colors.indigo : Colors.black,
                iconSize: 30,
                icon: Icon(allIcons[index])
              ),
            ),
          )
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          child: const Text('Fechar')
        )
      ],
    )
  );
  return selectedIcon;
}