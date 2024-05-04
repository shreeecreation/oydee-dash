import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oydeeedashboard/src/core/core.dart';

import '../dashboard.dart';

class UserPost extends StatefulWidget {
  const UserPost({super.key, required this.feed});

  final FeedModel feed;

  @override
  State<UserPost> createState() => _UserPostState();
}

class _UserPostState extends State<UserPost> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: 10.rounded,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: SizedBox(
                    height: 50,
                    width: 50,
                    child: widget.feed.user.profilePicture,
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.feed.user.name, style: AppTextStyles.text16PxBold),
                      Text(
                        widget.feed.createdAt.format,
                        style: AppTextStyles.text12Px.textGrey,
                      ),
                    ],
                  ),
                  onTap: () {},
                  trailing: Icon(Icons.more_vert)),
            ),
            FeedBody(feed: widget.feed),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              leading: widget.feed.user.profilePicture,
              title: SizedBox(
                height: 45,
                child: GestureDetector(
                  onTap: () {
                    // CommentBottomSheet.show(
                    //   context: context,
                    //   feedId: widget.feed.id,
                    // );
                    HapticFeedback.lightImpact();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                    decoration: BoxDecoration(color: AppColors.textGrey.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      'See all comments',
                      style: AppTextStyles.text14Px.textGrey,
                    ),
                  ),
                ),
              ),
            ),
            10.verticalSpace
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class FeedBody extends StatelessWidget {
  FeedBody({super.key, required this.feed});

  final FeedModel feed;

  @override
  Widget build(BuildContext context) {
    switch (feed.postType) {
      case FeedType.POST:
        return FeedTypePost(feed: feed);

      case FeedType.ROOM:
        final roomInfo = feed.room!;
        return FeedTypeRoom(roomInfo: roomInfo);
      case FeedType.JOB:
        final jobInfo = feed.job!;
        return FeedTypeJob(jobInfo: jobInfo);
      case FeedType.ADS:
        return const Text('this is ads');
    }
  }
}
