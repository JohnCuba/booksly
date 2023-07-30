// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:booksly/app/view_models/download_manager/download_manager.cubit.dart'
    as _i3;
import 'package:booksly/navigation/navigation.cubit.dart' as _i5;
import 'package:booksly/pages/local_library/view_model/local_library.cubit.dart'
    as _i4;
import 'package:booksly/pages/settings/view_model/settings.cubit.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.DownloadManagerCubit>(() => _i3.DownloadManagerCubit());
  gh.factory<_i4.LocalLibraryCubit>(() => _i4.LocalLibraryCubit());
  gh.factory<_i5.NavigationCubit>(() => _i5.NavigationCubit());
  gh.factory<_i6.SettingsCubit>(() => _i6.SettingsCubit());
  return getIt;
}
