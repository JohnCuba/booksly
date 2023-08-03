import 'package:booksly/app/view_models/download_manager/download_manager.state.dart';
import 'package:flutter/material.dart';
import 'package:download_manager/main.dart';

class DownloadsDropdown extends StatelessWidget {
  const DownloadsDropdown({
    super.key, 
    required this.list
  });
  final List<DownloadEntityState> list;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<DownloadTask>(
      enabled: list.isNotEmpty,
      itemBuilder: _listItemBuilder,
      icon: Center(
        child: Badge(
          isLabelVisible: list.isNotEmpty,
          label: Text(list.length.toString()),
          child: Icon(list.isEmpty ? Icons.download_done_rounded : Icons.download_rounded),
        ),
      ),
    );
  }

  List<PopupMenuEntry<DownloadTask>> _listItemBuilder(BuildContext context) {
    return List.generate(
      list.length,
      (index) => PopupMenuItem<DownloadTask>(
        child: ListTile(
          title: Text(list[index].task.title),
          subtitle: const LinearProgressIndicator(),
        )
      )
    );
  }
}