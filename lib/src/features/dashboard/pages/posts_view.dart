import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:oydeeedashboard/src/core/core.dart';
import 'package:oydeeedashboard/src/core/di/injector.dart';

import '../bloc/get_feed_cubit.dart';
import '../dashboard.dart';
import '../widgets/show_post_widget.dart';

class PostsView extends StatelessWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FeedCubit>()..getUserFeed(),
      child: Builder(builder: (context) {
        return BlocConsumer<FeedCubit, FeedState>(listener: (context, state) {
          state.maybeWhen(
            orElse: () => null,
            success: (data, isLoadingMore, hasMoreItems) {
              if (isLoadingMore) {}
            },
          );
        }, builder: (context, state) {
          return state.when(
            initial: () => Container().toSliverBox,
            validationError: (message) => Container(
              child: Text(message.message),
            ).toSliverBox,
            error: () => const Text("Error"),
            noInternet: (message) {
              return const Text("NO Interenet");
            },
            loading: () => const Text("loading"),
            success: (data, isLoadingMore, hasMoreItems) {
              if (data.isEmpty) {
                return const Text("Empty");
              } else {
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final feed = data[index];
                    return SizedBox(
                      width: 200,
                      child: UserPost(feed: feed),
                    );
                  },
                );
              }
            },
          );
        });
      }),
    );
  }
}

class FeedTypePost extends StatelessWidget {
  const FeedTypePost({
    super.key,
    required this.feed,
  });

  final FeedModel feed;

  @override
  Widget build(BuildContext context) {
    void _copyToClipboard(String text) {
      Clipboard.setData(ClipboardData(text: text));
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onLongPress: () {
              _copyToClipboard(feed.description ?? '');
            },
            child: ExpandableLinkify(
              text: feed.description ?? '',
            ),
          ),
          // GestureDetector(
          //   onLongPress: () {
          //     _copyToClipboard(feed.description ?? '');
          //   },
          //   child: ExpandableText(
          //     text: "this is my text <b>http:facebook.com</b> and <b>http://example.com<b> this is my text",
          //     expandText: 'View More',
          //     collapseText: 'View Less',
          //     textStyle: TextStyle(fontSize: 16, color: Colors.black),
          //     maxLines: 2,
          //   ),
          // ),
          if (feed.images.length != 0)
            PhotoGrid(
              imageUrls: feed.images.map((e) => e.url).toList(),
              onImageClicked: (index) => print(index),
              onExpandClicked: () {},
              maxImages: 2,
              type: feed.images.map((e) => e.type).toList(),
            )
        ],
      ),
    );
  }
}

class FeedTypeRoom extends StatelessWidget {
  const FeedTypeRoom({
    super.key,
    required this.roomInfo,
  });

  final RoomResponse roomInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: RoomCard(
        imageUrl: roomInfo.image,
        title: roomInfo.name.toString(),
        hasBorder: true,
        location: roomInfo.location,
        price: roomInfo.price.toString(),
        onTap: () {},
        paymentTypeEnum: roomInfo.paymentType,
        roomStatus: RoomStatus.getStatus(roomInfo.roomStatus.name),
      ),
    );
  }
}

class FeedTypeJob extends StatelessWidget {
  const FeedTypeJob({
    super.key,
    required this.jobInfo,
  });

  final GetJobModel jobInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: JobCard(jobModel: jobInfo, onTap: () {}),
    );
  }
}

class PhotoGrid extends StatefulWidget {
  PhotoGrid({required this.imageUrls, required this.onImageClicked, required this.onExpandClicked, this.maxImages = 4, required this.type, Key? key})
      : super(key: key);
  final int maxImages;
  final List<String> type;
  final List<String> imageUrls;
  final void Function(int) onImageClicked;
  final Function onExpandClicked;

  @override
  createState() => _PhotoGridState();
}

class _PhotoGridState extends State<PhotoGrid> {
  @override
  Widget build(BuildContext context) {
    var images = buildImages();
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: widget.imageUrls.length == 1 ? context.width : 200,
        childAspectRatio: widget.imageUrls.length == 1 ? 1.5 : 1,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      children: images,
    );
  }

  List<Widget> buildImages() {
    int numImages = widget.imageUrls.length;
    List<FeedImageTypeEnum> imageTypeEnum = [];

    for (int i = 0; i < widget.type.length; i++) {
      switch (widget.type[i]) {
        case 'IMAGE':
          imageTypeEnum.add(FeedImageTypeEnum.image);
          break;
        default:
          imageTypeEnum.add(FeedImageTypeEnum.video);
          break;
      }
    }

    return List<Widget>.generate(min(numImages, widget.maxImages), (index) {
      String imageUrl = widget.imageUrls[index];

      // If its the last image
      if (index == widget.maxImages - 1) {
        // Check how many more images are left
        int remaining = numImages - widget.maxImages;

        // If no more are remaining return a simple image widget
        if (remaining == 0) {
          return GestureDetector(
            child: imageTypeEnum[index] == FeedImageTypeEnum.image
                ? AppCacheImageViewer(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    imageTypeEnum: ImageTypeEnum.network,
                  )
                : const Text("dasdas"),
            onTap: () => widget.onImageClicked(index),
          );
        } else {
          // Create the facebook like effect for the last image with number of remaining  images
          return GestureDetector(
            onTap: () => widget.onExpandClicked(),
            child: Stack(
              fit: StackFit.expand,
              children: [
                imageTypeEnum[index] == FeedImageTypeEnum.image ? Image.network(imageUrl, fit: BoxFit.cover) : const TypeViddeoWidget(),
                Positioned.fill(
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.black54,
                    child: Text(
                      '+' + remaining.toString(),
                      style: const TextStyle(fontSize: 32),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      } else {
        return GestureDetector(
          child: imageTypeEnum[index] == FeedImageTypeEnum.image
              ? widget.imageUrls.length == 1
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        child: AppCacheImageViewer(
                          imageUrl: widget.imageUrls[0],
                          fit: BoxFit.fitWidth,
                          imageTypeEnum: ImageTypeEnum.network,
                        ),
                      ),
                    )
                  : AppCacheImageViewer(
                      imageUrl: imageUrl,
                      fit: BoxFit.fill,
                      imageTypeEnum: ImageTypeEnum.network,
                    )
              : const Text("Video,"),
          onTap: () => widget.onImageClicked(index),
        );
      }
    });
  }
}

class TypeViddeoWidget extends StatelessWidget {
  const TypeViddeoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      color: AppColors.greyColor.withOpacity(1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(
        Icons.video_call,
        color: AppColors.primary,
        size: 55,
      ),
    );
  }
}

// class VideoThumbnailWidget extends StatelessWidget {
//   const VideoThumbnailWidget({required this.url, required this.imageLength});
//   final String url;
//   final int imageLength;
//   @override
//   Widget build(BuildContext context) {
//     final cubit = context.read<ThumbnailMakerCubit>();
//     cubit.fetchThumbnail(url);
//     return BlocBuilder<ThumbnailMakerCubit, ThumbnailMakerState?>(
//       builder: (context, state) {
//         return state!.maybeWhen(
//             orElse: Container.new,
//             success: (url) => Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     SingleVideoPlayerWidget(
//                       url: url,
//                     ),
//                     const Icon(
//                       Icons.play_circle_fill,
//                       size: 64,
//                       color: Colors.white,
//                     ),
//                   ],
//                 ),
//             loading: () => Shimmer.fromColors(
//                   baseColor: AppColors.white,
//                   highlightColor: AppColors.lightWhite,
//                   child: Container(
//                     width: 200,
//                     height: 100,
//                     color: AppColors.white,
//                   ),
//                 ));
//       },
//     );
//     // return SingleVideoPlayerWidget(url: url);
//   }
// }

class ExpandableLinkify extends StatefulWidget {
  ExpandableLinkify({required this.text});
  final String text;

  @override
  _ExpandableLinkifyState createState() => _ExpandableLinkifyState();
}

class _ExpandableLinkifyState extends State<ExpandableLinkify> {
  late ValueNotifier<bool> _expandedNotifier;

  @override
  void initState() {
    super.initState();
    _expandedNotifier = ValueNotifier<bool>(false);
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(
            child: ValueListenableBuilder<bool>(
              valueListenable: _expandedNotifier,
              builder: (context, child, _) {
                return Linkify(
                  text: renderTrunkedText(widget.text, _expandedNotifier.value ? widget.text.length : 100),
                  onOpen: _onLinkOpen,
                  options: const LinkifyOptions(humanize: false),
                  style: AppTextStyles.text14Px.black,
                  linkStyle: AppTextStyles.text14Px.primary.copyWith(
                    decoration: TextDecoration.none,
                  ),
                );
              },
            ),
          ),
          if (widget.text.length >= 100)
            WidgetSpan(
              child: GestureDetector(
                onTap: () {
                  _expandedNotifier.value = !_expandedNotifier.value;
                },
                child: ValueListenableBuilder<bool>(
                  valueListenable: _expandedNotifier,
                  builder: (context, expanded, child) {
                    return Text(
                      expanded ? ' View Less' : ' View More',
                      style: AppTextStyles.text13PxSemiBold,
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }

  String renderTrunkedText(String text, int maxLength) {
    return text.length <= maxLength ? text : '${text.substring(0, maxLength)}...';
  }

  Future<void> _onLinkOpen(LinkableElement link) async {
    String url = link.url;
  }
}
