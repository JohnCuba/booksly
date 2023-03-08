import 'package:auto_route/auto_route.dart';
import 'package:booksly/view/pages/opds_library/components/entries_list.component.dart';
import 'package:booksly/view/shared/loading/loading_indicator.component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macos_ui/macos_ui.dart';

import 'components/breadcrumb.component.dart';
import 'state/opds_library.cubit.dart';

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
      create: (_) => OpdsLibraryCubit(librarySlug),
      child: const OpdsLibraryView()
    );
  }
}

class OpdsLibraryView extends StatelessWidget {
  const OpdsLibraryView({super.key});
  
  @override
  Widget build(BuildContext context) {
    final libraryTitle = context.watch<OpdsLibraryCubit>().state.library?.title ?? '';

    return MacosScaffold(
      toolBar: ToolBar(
        title: Text(libraryTitle),
      ),
      children: [ContentArea(builder: _buildPage)],
    );
  }
  
  Widget _buildPage(BuildContext context, ScrollController scrollController) {
    final isLoading = context.watch<OpdsLibraryCubit>().state.isLoading;
    
    switch (isLoading) {
      case true:
        return const LoadingIndicatorComponent();
      default:
        return _buildContent(context);
    }
  }

  Widget _buildContent(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        children: const [
          SizedBox(
            height: 20,
            child: Breadcrumb()
          ),
          EntriesList()
        ],
      ),
    );
  }
}