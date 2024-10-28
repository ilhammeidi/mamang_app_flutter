import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/post.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/shimmer_preloader.dart';

class PostComments extends StatelessWidget {
  const PostComments({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
          child: Text('${commentList.length} Comments', style: ThemeText.subtitle.copyWith(fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: spacingUnit(1)),
        ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: commentList.length,
          padding: const EdgeInsets.all(0),
          itemBuilder: ((BuildContext context, int index) {
            Comment item = commentList[index];
            return CommentItem(
              avatar: item.avatar,
              name: item.name,
              message: item.comment,
              date: item.date,
              isLast: commentList.length == index + 1,
            );
          })
        ),
      ],
    ); 
  }
}

class CommentItem extends StatelessWidget {
  const CommentItem({
    super.key,
    required this.avatar,
    required this.name,
    required this.message,
    required this.date,
    required this.isLast,
  });

  final String avatar;
  final String name;
  final String message;
  final String date;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Column(children: [
      ListTile(
        contentPadding: EdgeInsets.all(spacingUnit(1)),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.network(
            avatar,
            width: 40,
            height: 40,
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return const SizedBox(
                width: 50,
                height: 50,
                child: ShimmerPreloader()
              );
            },
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name, style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(width: spacingUnit(2)),
            Text(date, style: ThemeText.caption.copyWith(color: colorScheme.onSurfaceVariant)),
          ],
        ),
        subtitle: Text(message, maxLines: 2, overflow: TextOverflow.ellipsis),
      ),
      !isLast ? const LineList() : Container()
    ]);
  }
}