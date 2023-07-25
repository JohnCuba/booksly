import 'package:booksly/config/injector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:booksly/view/shared/loading/loading_indicator.component.dart';

import 'view_model/local_library.cubit.dart';

@RoutePage(name: LocalLibraryPage.name)
class LocalLibraryPage extends StatelessWidget {
  const LocalLibraryPage({super.key});
  static const name = 'local_library';
  static const path = '/local_library';
  static const initial = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocalLibraryCubit>(
      create: (_) => getIt.get<LocalLibraryCubit>(),
      child: const LocalLibraryView()
    );
  }
}

class LocalLibraryView extends StatelessWidget {
  const LocalLibraryView({super.key});

  @override
  Widget build(BuildContext context) {
    final handleClickRefresh = context.read<LocalLibraryCubit>().update;
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        toolbarHeight: 40,
        title: Text(tr('pages.${LocalLibraryPage.name}')),
        actions: [
          IconButton(
            onPressed: handleClickRefresh,
            icon: const Icon(CupertinoIcons.refresh),
            tooltip: tr('common.refresh'),
            splashRadius: 14,
          )
        ],
      ),
      body: _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final isLoading = context.watch<LocalLibraryCubit>().state.isLoading;

    switch (isLoading) {
      case true:
        return const LoadingIndicatorComponent();
      default:
        return _buildContent(context);
    }
  }

  Widget _buildContent(BuildContext context) {
    final files = context.watch<LocalLibraryCubit>().state.files;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: files.length,
        itemBuilder: (context, index) {
          final onDeleteBook = context.read<LocalLibraryCubit>().deleteBook;

          handleDelete() {
            onDeleteBook(files[index]);
          }

          return Card(
            elevation: 2,
            child: ListTile(
              title: Text(files[index].title),
              subtitle: Text(files[index].author),
              trailing: ElevatedButton(
                onPressed: handleDelete,
                child: const Icon(
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
