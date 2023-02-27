import 'package:booksly/config/injector.dart';
import 'package:booksly/view/pages/settings/components/opds_library_list_tile.component.dart';
import 'package:booksly/view/pages/settings/components/opds_library_modal.component.dart';
import 'package:booksly/view/shared/loading/loading_indicator.component.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booksly/view/pages/settings/settings.view_model.dart';
import 'package:macos_ui/macos_ui.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  static const name = 'settings';
  static const path = '/settings';
  static const initial = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.get<SettingsViewModel>(),
      child: const SettingsView()
    );
  }
}

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MacosScaffold(
        toolBar: ToolBar(
          title: Text(tr('pages.${SettingsPage.name}')),
        ),
        children: [
          ContentArea(
            builder: _buildPage,
          )
        ]);
  }

  Widget _buildPage(BuildContext context, ScrollController scrollController) {
    final isLoading = context
        .select((SettingsViewModel cubit) => cubit.state.settings == null);

    switch (isLoading) {
      case true:
        return const LoadingIndicatorComponent();
      default:
        return _buildContent(context);
    }
  }

  Widget _buildContent(BuildContext context) {
    final localLibraryPath = context.watch<SettingsViewModel>().state.settings!.localLibPath;
    final opdsLibraries = context.watch<SettingsViewModel>().state.opdsLibraies;

    final handleClickSelectDirectory =
        context.read<SettingsViewModel>().changeLocalLibraryPath;
    final onRemoveLibrary = context.read<SettingsViewModel>().removeOpdsLibrary;
    
    handleClickAddOnlineLibrary() {
      showMacosSheet(
        context: context, 
        // TODO: Bug in macos ui
        builder: (BuildContext ctx) {
          return MacosSheet(
            insetPadding: const EdgeInsets.symmetric(vertical: 200, horizontal: 140),
            child: BlocProvider.value(
              value: BlocProvider.of<SettingsViewModel>(context),
              child: const OpdsLibraryModal()
            ),
          );
        }
      );
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            title: Text(
              tr('settings.local_library_path')
            ),
            subtitle: Text(localLibraryPath),
            trailing: PushButton(
              buttonSize: ButtonSize.large,
              onPressed: handleClickSelectDirectory,
              child: const MacosIcon(CupertinoIcons.folder, color: Colors.white),
            ),
          ),
          ListTile(
            title: Text(tr('settings.online_libraries')),
            trailing: PushButton(
              buttonSize: ButtonSize.large,
              onPressed: handleClickAddOnlineLibrary,
              child: const MacosIcon(CupertinoIcons.add, color: Colors.white),
            ),
          ),
          ListView.builder(
            itemCount: opdsLibraries!.length,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return OpdsLibraryListTile(
                libraryData: opdsLibraries[index],
                onRemoveLibrary: onRemoveLibrary);
            },
          )
        ],
      ),
    );
  }
}
