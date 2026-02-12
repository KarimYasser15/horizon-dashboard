import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:admin_dashboard/core/di/service_locator.config.dart';

final sl = GetIt.instance;

@InjectableInit()
Future<void> init() async => sl.init();
