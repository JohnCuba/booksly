import 'package:booksly/view/app/view_models/download_manager/download_manager.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opds_catalog/main.dart';

import '../viev_model/opds_library.cubit.dart';


class EntriesList extends StatelessWidget {
  const EntriesList({super.key});
  
  @override
  Widget build(BuildContext context) {
    final itemsCount = context.watch<OpdsLibraryCubit>().state.page?.entries.length ?? 0;
    
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: itemsCount,
      itemBuilder: _buildItem,
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    final goTo = context.read<OpdsLibraryCubit>().goTo;
    final page = context.watch<OpdsLibraryCubit>().state.page;
    final entry = page!.entries[index];
    final downloadLinks = entry.links.whereType<OpdsLinkDownload>();

    handleClick() {
      final catalogLink = entry.links.whereType<OpdsLinkCatalog>().first;
      goTo(catalogLink.uri, entry.title);
    }
  
    return ListTile(
      title: Text(entry.title),
      subtitle: Text(entry.content),
      onTap: handleClick,
      trailing: _buildDownloadButton(context, downloadLinks, entry.title),
    );
  }

  Widget? _buildDownloadButton(
      BuildContext context,
      Iterable<OpdsLinkDownload> links,
      String title,
  ) {
    if (links.isEmpty) {
      return null;
    }

    handleClick() {
      final downloadBook = context.read<DownloadManagerCubit>().downloadBook;

      downloadBook(links.first, title);
    }

    return IconButton(
      icon: const Icon(Icons.download),
      onPressed: handleClick,
    );
  }
}