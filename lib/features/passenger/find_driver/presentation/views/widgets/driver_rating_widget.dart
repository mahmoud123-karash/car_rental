import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DriverRatingWidget extends StatefulWidget {
  const DriverRatingWidget({super.key, required this.rating});
  final List<num> rating;

  @override
  State<DriverRatingWidget> createState() => _DriverRatingWidgetState();
}

class _DriverRatingWidgetState extends State<DriverRatingWidget> {
  late num rate;
  @override
  void initState() {
    rate = widget.rating.isEmpty
        ? 0.0
        : widget.rating.reduce((value, element) => value + element) /
            widget.rating.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar.builder(
          allowHalfRating: true,
          itemSize: 20,
          initialRating: rate.toDouble(),
          ignoreGestures: true,
          direction: Axis.horizontal,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {},
        ),
        Text("(${widget.rating.length})")
      ],
    );
  }
}
