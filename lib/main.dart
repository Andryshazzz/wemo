import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'res/dependencies.dart';
import 'res/theme.dart';
import 'screens/home/controller/home_bloc.dart';
import 'screens/home/controller/home_event.dart';
import 'screens/home/home_screen/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const Wemo());
}

class Wemo extends StatelessWidget {
  const Wemo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return GetIt.I<HomeBloc>()..add(LoadCoin());
      },
      child: MaterialApp(theme: lightTheme, home: const HomeScreen()),
    );
  }
}
