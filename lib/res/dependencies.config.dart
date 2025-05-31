// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:wemo/data/source/local/prefs.dart' as _i874;
import 'package:wemo/data/source/network/api_client.dart' as _i80;
import 'package:wemo/repos/home_repo.dart' as _i136;

import '../feature/home/controller/home_bloc.dart' as _i429;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i80.ApiClient>(() => _i80.ApiClient());
    gh.singleton<_i874.Prefs>(() => _i874.Prefs());
    gh.singleton<_i136.HomeRepository>(
      () => _i136.HomeRepository(
        apiClient: gh<_i80.ApiClient>(),
        prefs: gh<_i874.Prefs>(),
      ),
    );
    gh.factory<_i429.HomeBloc>(
      () => _i429.HomeBloc(repository: gh<_i136.HomeRepository>()),
    );
    return this;
  }
}
