import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../res/theme.dart';
import '../../controller/home_bloc.dart' show HomeBloc;
import '../../controller/home_event.dart';
import '../../widgets/button.dart';

class CoinScreen extends StatefulWidget {
  final String coinName;
  final String price;

  const CoinScreen({super.key, required this.coinName, required this.price});

  @override
  State<CoinScreen> createState() => _CoinScreenState();
}

class _CoinScreenState extends State<CoinScreen> {
  final TextEditingController _amountController = TextEditingController();
  String? _errorMessage;

  @override
  void dispose() {
    super.dispose();
    _amountController.dispose();
  }

  void _buyCoin() {
    final amount = double.tryParse(_amountController.text);
    if (amount == null || amount <= 0) {
      setState(() {
        _errorMessage = 'Please enter a valid amount';
      });
      return;
    }

    final price = double.parse(widget.price);
    final totalCost = price * amount;
    final balance = context.read<HomeBloc>().state.balance;

    if (totalCost > balance) {
      setState(() {
        _errorMessage = 'Insufficient balance';
      });
      return;
    }

    setState(() {
      _errorMessage = null;
    });

    context.read<HomeBloc>().add(
      BuyCoin(coinName: widget.coinName, price: price, amount: amount),
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
                  style: ProjectTextStyles.p1.copyWith(color: ProjectColors.red),
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
              ButtonWidget(title: 'Buy ${widget.coinName}', onTap: _buyCoin),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAmountField extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomAmountField({
    super.key,
    this.controller,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      style: ProjectTextStyles.p1,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintStyle: ProjectTextStyles.p1.copyWith(color: ProjectColors.grey3),
        filled: true,
        fillColor: ProjectColors.light4,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        hintText: 'Amount',
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 30),
          child: SvgPicture.asset(ProjectIcons.arrow),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 16,
        ),
      ),
    );
  }
}
