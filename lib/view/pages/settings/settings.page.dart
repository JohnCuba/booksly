import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:booksly/view/pages/settings/components/opds_library_list_tile.component.dart';
import 'package:booksly/view/pages/settings/components/opds_library_modal.component.dart';
import 'package:booksly/view/shared/loading/loading_indicator.component.dart';

import 'view_model/settings.cubit.dart';

@RoutePage(name: SettingsPage.name)
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  static const name = 'settings';
  static const path = '/settings';
  static const initial = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingsCubit(),
      child: const SettingsView()
    );
  }
}

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        toolbarHeight: 40,
        title: Text(tr('pages.${SettingsPage.name}')),
        automaticallyImplyLeading: false,
      ),
      body: _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final isLoading = context
        .select((SettingsCubit cubit) => cubit.state.settings == null);

    switch (isLoading) {
      case true:
        return const LoadingIndicatorComponent();
      default:
        return _buildContent(context);
    }
  }

  Widget _buildContent(BuildContext context) {
    final localLibraryPath = context.watch<SettingsCubit>().state.settings!.localLibPath;
    final opdsLibraries = context.watch<SettingsCubit>().state.opdsLibraies;

    final handleClickSelectDirectory =
        context.read<SettingsCubit>().changeLocalLibraryPath;
    final onRemoveLibrary = context.read<SettingsCubit>().removeOpdsLibrary;
    
    handleClickAddOnlineLibrary() {
      showDialog(
          context: context,
          builder: (BuildContext ctx) => BlocProvider.value(
            value: BlocProvider.of<SettingsCubit>(context),
            child: const OpdsLibraryModal()
          )
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
            trailing: ElevatedButton(
              onPressed: handleClickSelectDirectory,
              child: const Icon(CupertinoIcons.folder, color: Colors.white),
            ),
          ),
          ListTile(
            title: Text(tr('settings.online_libraries')),
            trailing: ElevatedButton(
              onPressed: handleClickAddOnlineLibrary,
              child: const Icon(CupertinoIcons.add, color: Colors.white),
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
