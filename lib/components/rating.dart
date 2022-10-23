import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_login/theme/constants.dart';

typedef void RatingChangeCallback(double rating);

class StarRating extends StatefulWidget {
  final int starCount;
  final int rating;
  final RatingChangeCallback? onRatingChanged;
  final Color? color;

  StarRating({this.starCount = 5, this.rating = 0 , this.onRatingChanged,  this.color});

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  int currentRate = 0;
  Widget buildStar(BuildContext context, int index , int rate) {
    Icon icon;
    if (index >= rate) {
      icon = new Icon(
        Icons.star_border,
        color: Theme.of(context).buttonColor,
      );
    }
    else if (index > rate - 1 && index < rate) {
      icon = new Icon(
        Icons.star_half,
        color: widget.color ??  AppTheme.mainBlue,
      );
    } else {
      icon = new Icon(
        Icons.star,
        color: widget.color ??  AppTheme.mainBlue,
      );
    }
    return new InkResponse(
      onTap: widget.onRatingChanged == null ? null : () {
        print(index);
        setState(() {
          currentRate = index  + 1;
        });
        widget.onRatingChanged!(index + 1.0);
      } ,
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(children: new List.generate(widget.starCount, (index) => buildStar(context, index , widget.rating == 0 ? currentRate : widget.rating)));
  }
}