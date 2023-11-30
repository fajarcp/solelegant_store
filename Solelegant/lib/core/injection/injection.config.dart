// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:solelegant/core/injection/injection.dart' as _i5;
import 'package:solelegant/core/provider/bottom_tab_provider.dart' as _i4;
import 'package:solelegant/core/route/app_router.dart' as _i3;

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
    final registerModule = _$RegisterModule();
    gh.singleton<_i3.AppRouter>(registerModule.instance);
    gh.lazySingleton<_i4.BottomTabProvider>(() => _i4.BottomTabProvider());
    return this;
  }
}

class _$RegisterModule extends _i5.RegisterModule {}
