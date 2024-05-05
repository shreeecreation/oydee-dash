import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../assets/assets.gen.dart';
import '../core.dart';

class ReactionWidget extends StatelessWidget {
  const ReactionWidget(
      {super.key,
      this.commentCount = 0,
      this.likeCount = 0,
      this.seenCount = 0,
      this.onShare,
      this.commentId,
      required this.feedId,
      required this.hasLiked,
      required this.canShare});

  final int commentCount;
  final int likeCount;
  final int seenCount;
  final String feedId;
  final String? commentId;
  final VoidCallback? onShare;
  final bool hasLiked;
  final bool canShare;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 40,
                    child: Builder(builder: (context) {
                      return IconButton(
                        onPressed: () {},
                        icon: Assets.icons.favoriteIcon.svg(
                          colorFilter: const ColorFilter.mode(
                            AppColors.black,
                            BlendMode.srcIn,
                          ),
                        ),
                      );
                    }),
                  ),
                  Text(
                    likeCount.toString(),
                    style: AppTextStyles.text12PxSemiBold,
                  )
                ],
              ),
              canShare
                  ? TextButton.icon(
                      onPressed: () {
                        // CommentBottomSheet.show(
                        //     context: context, feedId: feedId);
                        HapticFeedback.lightImpact();
                      },
                      icon: Assets.icons.commentIcon.svg(),
                      label: Text(
                        commentCount.toString(),
                        style: AppTextStyles.text14Px.black,
                      ),
                    )
                  : const Text(''),
              canShare
                  ? TextButton.icon(
                      onPressed: onShare,
                      icon: Assets.icons.shareIcon.svg(),
                      label: Text('Share', style: AppTextStyles.text14Px.black),
                    )
                  : const Text(''),
            ],
          ),
          canShare ? const Spacer() : const Text(''),
          if (seenCount > 0) canShare ? Text('Seen by $seenCount') : const Text(''),
        ],
      ),
    );
  }
}
