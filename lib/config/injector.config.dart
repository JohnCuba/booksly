// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:booksly/data/local_library/local_library.local.dart' as _i4;
import 'package:booksly/data/local_library/local_library_api.dart' as _i3;
import 'package:booksly/data/settings/settings_api.dart' as _i6;
import 'package:booksly/data/settings/settings_api.local.dart' as _i7;
import 'package:booksly/domain/local_library/local_library.repository.dart'
    as _i5;
import 'package:booksly/domain/settings/settings.repository.dart' as _i8;
import 'package:booksly/view/app/navigation.cubit.dart' as _i11;
import 'package:booksly/view/pages/local_library/local_library.view_model.dart'
    as _i10;
import 'package:booksly/view/pages/settings/settings.view_model.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart'
    as _i2; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.LocalLibraryApi>(() => _i4.LocalLibraryLocal());
    gh.singleton<_i5.LocalLibraryRepository>(
        _i5.LocalLibraryRepository(gh<_i3.LocalLibraryApi>()));
    gh.singleton<_i6.SettingsApi>(_i7.LocalSettingsApi());
    gh.singleton<_i8.SettingsRepository>(
        _i8.SettingsRepository(gh<_i6.SettingsApi>()));
    gh.singleton<_i9.SettingsViewModel>(
        _i9.SettingsViewModel(gh<_i8.SettingsRepository>()));
    gh.factory<_i10.LocalLibraryViewModel>(() => _i10.LocalLibraryViewModel(
          gh<_i8.SettingsRepository>(),
          gh<_i5.LocalLibraryRepository>(),
        ));
    gh.factory<_i11.NavigationCubit>(
        () => _i11.NavigationCubit(gh<_i8.SettingsRepository>()));
    return this;
  }
}
