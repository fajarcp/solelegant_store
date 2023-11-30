import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:solelegant/core/route/app_router.dart';

import 'injection.config.dart';


final GetIt locator = GetIt.instance;

@InjectableInit(generateForDir: ['lib', 'bin', 'test'])
void configureDependencies()=>locator.init();


@module
abstract class RegisterModule{

  @singleton
  AppRouter get instance=>AppRouter();


}