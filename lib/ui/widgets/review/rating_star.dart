import 'package:flutter/material.dart';

class RatingStar extends StatefulWidget {
  const RatingStar({
    super.key,
    required this.initVal,
    this.size = 18,
    this.readOnly = false,
    this.onChanged
  });

  final int initVal;
  final bool readOnly;
  final double size;
  final Function(int)? onChanged;

  @override
  State<RatingStar> createState() => _RatingStarState();
}

class _RatingStarState extends State<RatingStar> {
  int _ratingVal = 0;

  void _handleRatingValue(int val) {
    setState(() {
      _ratingVal = val;
    });
  }

  @override
  void initState() {
    _ratingVal = widget.initVal;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const int maxVal = 5;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(maxVal, (index) {
        return index < _ratingVal ?
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: RatingButton(
              stared: true,
              size: widget.size,
              onTap: !widget.readOnly ? () {
                if (widget.onChanged != null) {
                  widget.onChanged!(index + 1);
                }
                _handleRatingValue(index + 1);
              } : null
            ),
          )
          : Padding(
            padding: const EdgeInsets.only(right: 4),
            child: RatingButton(
              stared: false,
              size: widget.size,
              onTap: !widget.readOnly ? () {
                if (widget.onChanged != null) {
                  widget.onChanged!(index + 1);
                }
                _handleRatingValue(index + 1);
              } : null
            ),
          );
      })
    );
  }
}

class RatingButton extends StatelessWidget {
  const RatingButton({
    super.key,
    required this.stared,
    this.onTap,
    this.size = 14,
  });

  final bool stared;
  final double size;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        shape: BoxShape.circle
      ),
      child: InkWell(
        onTap: onTap,
        child: Icon(
          stared ? Icons.star : Icons.star_outline,
          size: size,
          color: stared ? Colors.amber : Theme.of(context).colorScheme.outline
        ),
      ),
    );
  }
}