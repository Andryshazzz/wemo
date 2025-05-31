import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'feature/home/controller/home_bloc.dart';
import 'feature/home/controller/home_event.dart';
import 'feature/home/screens/home_screen/home_screen.dart';
import 'res/dependencies.dart';
import 'res/theme.dart';

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
