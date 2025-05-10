import 'package:flutter/material.dart';

import '../../../../res/theme.dart';

class SegmentedControlButtonsWidget extends StatelessWidget {
  final List<Widget> items;
  final TabController controller;

  const SegmentedControlButtonsWidget({
    required this.items,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final segments = List.generate(items.length, (index) {
      final item = items.elementAt(index);
      return Expanded(
        child: _SegmentButton(
          controller: controller,
          index: index,
          child: item,
        ),
      );
    });

    return DecoratedBox(
      decoration: BoxDecoration(
        color: ProjectColors.light4,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final thumbWidth = constraints.maxWidth / segments.length;
            final availableWidth = thumbWidth - 7;
            return ListenableBuilder(
              listenable: controller.animation ?? controller,
              child: Row(children: segments),
              builder:
                  (context, child) => Stack(
                    children: [
                      Positioned(
                        top: 5,
                        left:
                            thumbWidth *
                                (controller.animation?.value ??
                                    controller.index) +
                            4,
                        child: SizedBox(
                          width: availableWidth,
                          child: _ContolThumb(width: thumbWidth),
                        ),
                      ),
                      if (child != null) child,
                    ],
                  ),
            );
          },
        ),
      ),
    );
  }
}

class _ContolThumb extends StatelessWidget {
  final double width;

  const _ContolThumb({required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: ProjectColors.light1,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );
  }
}

class _SegmentButton extends StatelessWidget {
  final TabController controller;
  final int index;

  final Widget child;

  const _SegmentButton({
    required this.controller,
    required this.index,
    required this.child,
  });

  void _onPressed() {
    controller.animateTo(
      index,
      duration: kTabScrollDuration,
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: _onPressed,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(14)),
        child: SizedBox(
          height: 50,
          child: ListenableBuilder(
            listenable: controller,
            builder:
                (context, child) => DefaultTextStyle(
                  style: ProjectTextStyles.p1.copyWith(
                    color: ProjectColors.black,
                  ),
                  child: Center(child: this.child),
                ),
          ),
        ),
      ),
    );
  }
}
