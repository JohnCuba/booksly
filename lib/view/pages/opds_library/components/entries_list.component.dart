import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booksly/data/opds/models/opds_link.model.dart';

import '../state/opds_library.cubit.dart';

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

    handleClick() {
      final catalogLink = entry.links.firstWhere((link) => link is OpdsLinkCatalog) as OpdsLinkCatalog;
      goTo(catalogLink.uri, entry.title);
    }
  
    return ListTile(
      title: Text(entry.title),
      subtitle: Text(entry.content),
      onTap: handleClick,
    );
  }
}