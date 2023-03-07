import 'package:booksly/view/pages/settings/settings.view_model.dart';
import 'package:booksly/lib/utils/check_link.util.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macos_ui/macos_ui.dart';

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

    return Center(
        child: Flex(
          direction: Axis.vertical,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(flex: 1),
            Text(tr('settings.add_library')),
            const Spacer(flex: 2),
            Flex(
              direction: Axis.horizontal,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Spacer(flex: 1),
                Flexible(
                  flex: 6,
                  child: MacosTextField(
                    controller: linkEditingController,
                    placeholder: tr('settings.uri_placeholder'),
                    onChanged: handleLinkEditing,
                  )
                ),
                _buildValidityLinkIcon(),
                const Spacer(flex: 1),
              ],
            ),
            const Spacer(flex: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PushButton(
                  onPressed: handleClickCancel,
                  buttonSize: ButtonSize.large,
                  isSecondary: true,
                  child: Text(tr('common.cancel')),
                ),
                PushButton(
                  onPressed: handleClickSave,
                  buttonSize: ButtonSize.large,
                  child: Text(tr('common.save')),
                ),
              ],
            ),
            const Spacer(flex: 1),
          ]
        ),
      );
  }

  Widget _buildValidityLinkIcon() {
    switch(isLinkValid) {
      case true: return const MacosIcon(CupertinoIcons.check_mark_circled);
      default: return const MacosIcon(CupertinoIcons.clear_circled);
    }
  }
}