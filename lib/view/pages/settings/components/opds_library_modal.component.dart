import 'package:booksly/view/pages/settings/settings.view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OpdsLibraryModal extends StatefulWidget {
  const OpdsLibraryModal({super.key});

  @override
  State<OpdsLibraryModal> createState() => _OpdsLibraryModalState();
}

class _OpdsLibraryModalState extends State<OpdsLibraryModal> {
  final linkEditingController = TextEditingController();
  bool isLinkValid = false;

  void handleLinkEditing(String link) {
    final isCurrentlyValid = Uri.tryParse(link) != null;

    if (isLinkValid != isCurrentlyValid) {
      setState(() {
        isLinkValid = isCurrentlyValid;
      });
    }
  } 

  @override
  Widget build(BuildContext context) {
    final onAddOpdsLibrary = context.read<SettingsViewModel>().addOpdsLibrary;

    handleClickCancel() {
      Navigator.of(context).pop();
    }

    handleClickSave() async {
      if (isLinkValid) {
        await onAddOpdsLibrary(linkEditingController.text);
        handleClickCancel();
      }
    }

    return AlertDialog(
      title: Text(tr('settings.add_library')),
      content: Center(
        child: Flex(
            direction: Axis.vertical,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Spacer(flex: 1),
              Flex(
                direction: Axis.horizontal,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Spacer(flex: 1),
                  Flexible(
                      flex: 6,
                      child: TextField(
                        controller: linkEditingController,
                        onChanged: handleLinkEditing,
                        decoration: InputDecoration(
                          labelText: tr('settings.uri_placeholder'),
                        ),
                      )
                  ),
                  _buildValidityLinkIcon(),
                  const Spacer(flex: 1),
                ],
              ),
              const Spacer(flex: 1),
            ]
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: handleClickCancel,
          child: Text(tr('common.cancel')),
        ),
        ElevatedButton(
          onPressed: handleClickSave,
          child: Text(tr('common.save')),
        ),
      ],
    );
  }

  Widget _buildValidityLinkIcon() {
    switch(isLinkValid) {
      case true: return const Icon(CupertinoIcons.check_mark_circled);
      default: return const Icon(CupertinoIcons.clear_circled);
    }
  }
}