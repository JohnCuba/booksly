import 'package:auto_route/auto_route.dart';
import 'package:booksly/data/opds/models/opds_link.model.dart';
import 'package:booksly/view/shared/loading/loading_indicator.component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macos_ui/macos_ui.dart';

import 'opds_library.view_model.dart';

class OpdsLibraryPage extends StatelessWidget {
  const OpdsLibraryPage({
    super.key,
    @PathParam('slug') required this.librarySlug
  });
  final String librarySlug;
  static const name = 'opds_library';
  static const path = '/opds/:slug';
  static const initial = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      key: Key(librarySlug),
      create: (_) => OpdsLibraryViewModel(librarySlug),
      child: const OpdsLibraryView()
    );
  }
}

class OpdsLibraryView extends StatelessWidget {
  const OpdsLibraryView({super.key});
  
  @override
  Widget build(BuildContext context) {
    final libraryTitle = context.watch<OpdsLibraryViewModel>().state.library?.title;

    return MacosScaffold(
      toolBar: ToolBar(
        title: Text(libraryTitle ?? ''),
      ),
      children: [ContentArea(builder: _buildPage)],
    );
  }
  
  Widget _buildPage(BuildContext context, ScrollController scrollController) {
    final isLoading = context.watch<OpdsLibraryViewModel>().state.isLoading;
    
    switch (isLoading) {
      case true:
        return const LoadingIndicatorComponent();
      default:
        return _buildContent(context);
    }
  }

  Widget _buildContent(BuildContext context) {
    final page = context.watch<OpdsLibraryViewModel>().state.page;


    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              InkWell(child: const Text('Home'), onTap: () {})
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: page?.entries.length ?? 0,
            itemBuilder: (context, index) {
              final entry = page!.entries[index];
        
              return ListTile(
                title: Text(entry.title),
                subtitle: Text(entry.content),
                onTap: () {
                  final catalogLink = entry.links.firstWhere((element) => element is OpdsLinkCatalog);
                  final goTo = context.read<OpdsLibraryViewModel>().goTo;

                  goTo(catalogLink.path);
                },
              );
            },
          )
        ],
      ),
    );
  }
}