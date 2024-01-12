import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kt_course/app/navigation/navigator_define.dart';
import 'package:kt_course/common/color/color.dart';
import 'package:kt_course/common/extensions/context_extensions.dart';
import 'package:kt_course/common/extensions/number_extensions.dart';

class CourseItem extends StatelessWidget {
  const CourseItem({super.key}): width = 300, titleLine = 2;
  const CourseItem.small({super.key}): width = 200, titleLine = 3;

  final double width;
  final int titleLine;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => nav.toCourseDetails(),
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
        ),
        padding: EdgeInsets.zero,
      ),
      child: Container(
        width: width,
        margin: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  'https://images.ctfassets.net/ub3bwfd53mwy/5WFv6lEUb1e6kWeP06CLXr/acd328417f24786af98b1750d90813de/4_Image.jpg?w=750',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 24.0 * titleLine,
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'AWS Certified Solutions Architect - Associate',
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: titleLine,
              ),
            ),
            Text(
              'Linh nguyen',
              style: context.textTheme.bodySmall?.copyWith(fontSize: 12),
            ),
            const SizedBox(height: 5,),
            _rating,
            const SizedBox(height: 5,),
            _prices,
          ],
        ),
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
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: context.color.primary
              ),
            ),
            const SizedBox(width: 5,),
            RatingBarIndicator(
              itemBuilder: (_, __) => Icon(Icons.star, color: context.color.primary.withOpacity(.8),),
              rating: 4,
              itemSize: 18,
            ),
            const SizedBox(width: 5,),
            Text(
              '(${NumberFormat.decimalPattern().format(1233)})',
              style: TextStyle(
                fontSize: 12,
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
