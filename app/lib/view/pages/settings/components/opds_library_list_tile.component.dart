import 'package:booksly/data/settings/models/opds_library.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OpdsLibraryListTile extends StatefulWidget {
  final OpdsLibrary libraryData;
  final Function(OpdsLibrary library) onRemoveLibrary;
  const OpdsLibraryListTile({super.key, required this.libraryData, required this.onRemoveLibrary});

  @override
  State<OpdsLibraryListTile> createState() => _OpdsLibraryListTileState();
}

class _OpdsLibraryListTileState extends State<OpdsLibraryListTile> {
  handleClickRemove() {
    widget.onRemoveLibrary(widget.libraryData);
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(widget.libraryData.title),
        trailing: ElevatedButton(
          onPressed: handleClickRemove,
          child: const Icon(CupertinoIcons.delete, color: Colors.white,),
        ),
      )
    );
  }
}