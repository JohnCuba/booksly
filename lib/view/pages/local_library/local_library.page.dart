import 'package:booksly/config/injector.dart';
import 'package:booksly/view/pages/local_library/local_library.view_model.dart';
import 'package:booksly/view/shared/loading/loading_indicator.component.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macos_ui/macos_ui.dart';

class LocalLibraryPage extends StatelessWidget {
  const LocalLibraryPage({super.key});
  static const name = 'local_library';
  static const path = '/local_library';
  static const initial = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => getIt.get<LocalLibraryViewModel>(),
        child: const LocalLibraryView());
  }
}

class LocalLibraryView extends StatelessWidget {
  const LocalLibraryView({super.key});

  @override
  Widget build(BuildContext context) {
    final handleClickRefresh = context.read<LocalLibraryViewModel>().update;
    return MacosScaffold(
        toolBar: ToolBar(
          title: Text(tr('pages.${LocalLibraryPage.name}')),
          actions: [
            ToolBarIconButton(
                label: tr('common.refresh'),
                icon: const MacosIcon(CupertinoIcons.refresh),
                onPressed: handleClickRefresh,
                showLabel: false),
          ],
        ),
        children: [ContentArea(builder: _buildPage)]);
  }

  Widget _buildPage(BuildContext context, ScrollController scrollController) {
    final isLoading = context.watch<LocalLibraryViewModel>().state.isLoading;

    switch (isLoading) {
      case true:
        return const LoadingIndicatorComponent();
      default:
        return _buildContent(context);
    }
  }

  Widget _buildContent(BuildContext context) {
    final files = context.watch<LocalLibraryViewModel>().state.files;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: files.length,
        itemBuilder: (context, index) {
          final onDeleteBook = context.read<LocalLibraryViewModel>().deleteBook;

          handleDelete() {
            onDeleteBook(files[index]);
          }

          return Card(
            elevation: 2,
            child: ListTile(
              title: Text(files[index].title),
              subtitle: Text(files[index].author),
              trailing: PushButton(
                buttonSize: ButtonSize.large,
                onPressed: handleDelete,
                child: const MacosIcon(
                  CupertinoIcons.delete,
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
