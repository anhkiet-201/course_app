import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kt_course/common/color/color.dart';
import 'package:kt_course/common/extensions/context_extensions.dart';
import 'package:kt_course/common/extensions/number_extensions.dart';

class CourseListItem extends StatelessWidget {
  const CourseListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      child: Row(
        children: [
          AspectRatio(
              aspectRatio: 1,
            child: Image.network(
              'https://images.ctfassets.net/ub3bwfd53mwy/5WFv6lEUb1e6kWeP06CLXr/acd328417f24786af98b1750d90813de/4_Image.jpg?w=750',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'The Complete Flutter Development Bootcamp with Dart',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                    'Dr.Angela Yu',
                  style: TextStyle(
                    fontSize: 12
                  ),
                ),
                _rating,
                _prices
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget get _rating => Builder(builder: (context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '4.0',
          style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: context.color.primary
          ),
        ),
        const SizedBox(width: 2,),
        RatingBarIndicator(
          itemBuilder: (_, __) => Icon(Icons.star, color: context.color.primary.withOpacity(.8),),
          rating: 4,
          itemSize: 13,
        ),
        const SizedBox(width: 5,),
        Text(
          '(${NumberFormat.decimalPattern().format(1233)})',
          style: TextStyle(
              fontSize: 10,
              color: context.color.primary
          ),
        ),
      ],
    );
  });

  Widget get _prices => Builder(builder: (context) {
    return Row(
        children: [
          Text(
            100000.pricesFormat,
            style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(width: 10,),
          Text(
            150000.pricesFormat,
            style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.lineThrough,
                fontSize: 14
            ),
          )
        ]
    );
  });
}
