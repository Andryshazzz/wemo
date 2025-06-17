import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'dependencies.config.dart';

final getIt = GetIt.instance;
final logger = TalkerFlutter.init(
  settings: TalkerSettings(
    colors: {
      TalkerLogType.httpResponse.key: AnsiPen()..red(),
      TalkerLogType.error.key: AnsiPen()..green(),
      TalkerLogType.info.key: AnsiPen()..blue(),
      TalkerLogType.verbose.key: AnsiPen()..blue(),
    },
  ),
);

@injectableInit
void configureDependencies() {
  getIt.init();
  Bloc.observer = TalkerBlocObserver(
    talker: logger,
    settings: const TalkerBlocLoggerSettings(
      printCreations: true,
      printClosings: true,
    ),
  );
  logger.verbose('Talker init');
}
