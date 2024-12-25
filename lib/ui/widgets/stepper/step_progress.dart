import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';

class StepProgress extends StatefulWidget {
  const StepProgress({
    super.key,
    this.activeIndex = 0,
    required this.items
  });

  final int activeIndex;
  final List <String>items;

  @override
  State<StepProgress> createState() => _StepProgressState();
}

class _StepProgressState extends State<StepProgress> {
  final _scrollController = ScrollController();
  final double stepWidth = 180;

  @override
  void initState() {
     SchedulerBinding.instance.addPostFrameCallback((_) => _scrollController.animateTo(
      widget.activeIndex * stepWidth - 16,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn
    ));
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      height: 40,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: spacingUnit(1)),
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.items.length,
        itemBuilder: ((BuildContext context, int index) {
          return Opacity(
            opacity: index <= widget.activeIndex ? 1 : 0.25,
            child: SizedBox(
              width: index == 0 ? stepWidth * 1.8 : stepWidth,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  index == 0 ? SizedBox(width: stepWidth - 25) : Container(),
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: colorScheme.outline,
                        width: 1,
                      ),
                    ),
                    child: Center(child: widget.activeIndex > index ? Icon(Icons.check_circle, color: ThemePalette.primaryMain, size: 16) : Text((index + 1).toString())),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
                    child: Text(widget.items[index].toUpperCase()),
                  ),
                  index < widget.items.length - 1 ? Expanded(
                    child: Container(
                      height: 4,
                      decoration: BoxDecoration(
                        color: colorScheme.outlineVariant,
                        borderRadius: ThemeRadius.small
                      ),
                    ),
                  ) : Container(),
                  const SizedBox(width: 8)
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}