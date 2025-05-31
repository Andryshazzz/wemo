import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../res/theme.dart';
import '../controller/home_bloc.dart';
import '../controller/home_event.dart';
import 'button.dart';

class RestartingWidget extends StatelessWidget {
  const RestartingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ProjectIcons.restart),
          const SizedBox(height: 16),
          Text(
            'Ooops...',
            textAlign: TextAlign.center,
            style: ProjectTextStyles.h2.copyWith(color: ProjectColors.grey7),
          ),
          Text(
            'something went wrong.\nPlease, try to restart',
            textAlign: TextAlign.center,
            style: ProjectTextStyles.p1.copyWith(color: ProjectColors.grey3),
          ),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 165),
            child: ButtonWidget(
              title: 'Restarting',
              onTap: () async {
                context.read<HomeBloc>().add(LoadCoin());
                await context.read<HomeBloc>().stream.firstWhere(
                  (state) => !state.isLoading,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
