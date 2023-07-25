// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:booksly/data/local_library/local_library.local.dart' as _i5;
import 'package:booksly/data/local_library/local_library_api.dart' as _i4;
import 'package:booksly/data/opds/opds_api.dart' as _i9;
import 'package:booksly/data/opds/opds_api.network.dart' as _i10;
import 'package:booksly/data/settings/settings_api.dart' as _i12;
import 'package:booksly/data/settings/settings_api.local.dart' as _i13;
import 'package:booksly/domain/local_library/local_library.repository.dart'
    as _i7;
import 'package:booksly/domain/opds_library/opds_library.repository.dart'
    as _i11;
import 'package:booksly/domain/settings/settings.repository.dart' as _i15;
import 'package:booksly/view/app/view_models/download_manager/download_manager.cubit.dart'
    as _i3;
import 'package:booksly/view/navigation/navigation.cubit.dart' as _i8;
import 'package:booksly/view/pages/local_library/view_model/local_library.cubit.dart'
    as _i6;
import 'package:booksly/view/pages/settings/view_model/settings.cubit.dart'
    as _i14;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

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
    gh.factory<_i3.DownloadManagerCubit>(() => _i3.DownloadManagerCubit());
    gh.factory<_i4.LocalLibraryApi>(() => _i5.LocalLibraryLocal());
    gh.factory<_i6.LocalLibraryCubit>(() => _i6.LocalLibraryCubit());
    gh.singleton<_i7.LocalLibraryRepository>(
        _i7.LocalLibraryRepository(gh<_i4.LocalLibraryApi>()));
    gh.factory<_i8.NavigationCubit>(() => _i8.NavigationCubit());
    gh.factory<_i9.OpdsApi>(() => _i10.OpdsApiNetwork());
    gh.factory<_i11.OpdsLibraryRepository>(
        () => _i11.OpdsLibraryRepository(gh<_i9.OpdsApi>()));
    gh.singleton<_i12.SettingsApi>(_i13.LocalSettingsApi());
    gh.factory<_i14.SettingsCubit>(() => _i14.SettingsCubit());
    gh.factory<_i15.SettingsRepository>(
        () => _i15.SettingsRepository(gh<_i12.SettingsApi>()));
    return this;
  }
}
