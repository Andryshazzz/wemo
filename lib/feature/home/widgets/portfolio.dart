import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../res/theme.dart';
import '../controller/home_bloc.dart';
import '../controller/home_state.dart';
import '../screens/portfolio_screen/potfolio_screen.dart';

class PortfolioWidget extends StatelessWidget {
  const PortfolioWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const radius = BorderRadius.all(Radius.circular(12));
    return ClipRRect(
      borderRadius: radius,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const PortfolioScreen()),
          );
        },
        borderRadius: radius,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 200),
          child: DecoratedBox(
            decoration: BoxDecoration(color: Color(0xffFEFEFE)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('balance', style: ProjectTextStyles.p1),
                  const Spacer(),
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      final balanceStr = state.balance.toStringAsFixed(2);
                      final parts = balanceStr.split('.');
                      return Text.rich(
                        TextSpan(
                          style: ProjectTextStyles.h1,
                          children: [
                            TextSpan(
                              text: parts[0],
                              style: const TextStyle(
                                color: ProjectColors.black,
                              ),
                            ),
                            TextSpan(
                              text: '.${parts[1]}\$',
                              style: TextStyle(color: ProjectColors.grey3),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
