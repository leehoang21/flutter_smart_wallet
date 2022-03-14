import 'package:flutter_smart_wallet/common/injector/injector.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final GetIt injector = GetIt.instance;

@InjectableInit()
void configDependency() => $initGetIt(injector);
