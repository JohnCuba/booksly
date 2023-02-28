import 'package:bloc/bloc.dart';
import 'package:booksly/data/local_library/models/local_book.model.dart';
import 'package:booksly/domain/local_library/local_library.repository.dart';
import 'package:injectable/injectable.dart';
import 'package:equatable/equatable.dart';
import 'package:booksly/domain/settings/settings.repository.dart';

class LocalLibraryState extends Equatable {
  final bool isLoading;
  final String localLibPath;
  final List<LocalBook> files;

  const LocalLibraryState({
    this.isLoading = true,
    this.localLibPath = '',
    this.files = const [],
  });

  @override
  List<Object?> get props => [localLibPath];
}

@injectable
class LocalLibraryViewModel extends Cubit<LocalLibraryState> {
  final SettingsRepository _settingsRepository;
  final LocalLibraryRepository _localLibraryRepository;

  LocalLibraryViewModel(this._settingsRepository, this._localLibraryRepository)
      : super(const LocalLibraryState()) {
    _settingsRepository.init().then((value) => update());
  }

  update() async {
    emit(const LocalLibraryState());
    final localLibPath =
        await _settingsRepository.getSettings().then((value) => value.localLibPath);

    _localLibraryRepository.getBooks(localLibPath).then((value) {
      emit(LocalLibraryState(
          isLoading: false, localLibPath: localLibPath, files: value));
    });
  }

  deleteBook(LocalBook book) async {
    await book.file.delete();
    await update();
  }
}
