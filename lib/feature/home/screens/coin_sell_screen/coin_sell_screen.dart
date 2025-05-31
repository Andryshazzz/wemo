import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../res/theme.dart';
import '../coin_screen/coin_screen.dart';
import '../../controller/home_bloc.dart' show HomeBloc;
import '../../controller/home_event.dart';
import '../../widgets/button.dart';

class CoinSellScreen extends StatefulWidget {
  final String coinName;
  final String price;

  const CoinSellScreen({
    super.key,
    required this.coinName,
    required this.price,
  });

  @override
  State<CoinSellScreen> createState() => _CoinScreenSellState();
}

class _CoinScreenSellState extends State<CoinSellScreen> {
  final TextEditingController _amountController = TextEditingController();
  String? _errorMessage;

  @override
  void dispose() {
    super.dispose();
    _amountController.dispose();
  }

  void _sellCoin() {
    final amount = double.tryParse(_amountController.text);
    if (amount == null || amount <= 0) {
      setState(() {
        _errorMessage = 'Please enter a valid amount';
      });
      return;
    }

    final portfolioEntry =
        context.read<HomeBloc>().state.portfolio[widget.coinName];
    if (portfolioEntry == null || portfolioEntry < amount) {
      setState(() {
        _errorMessage = 'Not enough coins to sell';
      });
      return;
    }

    setState(() {
      _errorMessage = null;
    });

    context.read<HomeBloc>().add(
      SellCoin(coinName: widget.coinName, price: 500.0, amount: amount),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Successfully sold $amount ${widget.coinName}')),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ProjectColors.light1,
        title: Text(widget.coinName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${widget.coinName}/USD', style: ProjectTextStyles.h2),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text.rich(
                          TextSpan(
                            style: ProjectTextStyles.h1,
                            children: [
                              TextSpan(
                                text: widget.price.split('.')[0],
                                style: const TextStyle(
                                  color: ProjectColors.black,
                                ),
                              ),
                              TextSpan(
                                text: '.${widget.price.split('.')[1]}\$',
                                style: TextStyle(color: ProjectColors.grey3),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              CustomAmountField(
                controller: _amountController,
                onChanged: (value) {
                  setState(() {
                    _errorMessage = null;
                  });
                  print('Entered amount: $value');
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an amount';
                  }
                  final amount = double.tryParse(value);
                  if (amount == null || amount <= 0) {
                    return 'Please enter a valid amount';
                  }
                  return null;
                },
              ),
              if (_errorMessage != null) ...[
                const SizedBox(height: 8),
                Text(
                  _errorMessage!,
                  style: ProjectTextStyles.p1.copyWith(
                    color: ProjectColors.red,
                  ),
                ),
              ],
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        style: ProjectTextStyles.h2,
                        children: [
                          TextSpan(
                            text: 'Max:',
                            style: const TextStyle(color: ProjectColors.grey3),
                          ),
                          TextSpan(
                            text: ' 123 ${widget.coinName}',
                            style: TextStyle(color: ProjectColors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              ButtonWidget(title: 'Sell ${widget.coinName}', onTap: _sellCoin),
            ],
          ),
        ),
      ),
    );
  }
}
