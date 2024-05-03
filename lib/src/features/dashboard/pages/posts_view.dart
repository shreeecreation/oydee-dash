import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:oydeeedashboard/src/core/core.dart';

import '../dashboard.dart';

class PostsView extends StatelessWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
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
          if (feed.images.length != 0)
            PhotoGrid(
              imageUrls: feed.images.map((e) => e.url).toList(),
              onImageClicked: (index) => print('Image Clicked: ${feed.images[index].url}'),
              onExpandClicked: () {},
              maxImages: 2,
              type: feed.images.map((e) => e.type).toList(),
            )
        ],
      ),
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
                : Text("Vide"),
            onTap: () => widget.onImageClicked(index),
          );
        } else {
          // Create the facebook like effect for the last image with number of remaining  images
          return GestureDetector(
            onTap: () => widget.onExpandClicked(),
            child: Stack(
              fit: StackFit.expand,
              children: [
                imageTypeEnum[index] == FeedImageTypeEnum.image ? Image.network(imageUrl, fit: BoxFit.cover) : Text("Video"),
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
              : Text("data"),
          onTap: () => widget.onImageClicked(index),
        );
      }
    });
  }
}

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


// class FeedTypeRoom extends StatelessWidget {
//   const FeedTypeRoom({
//     super.key,
//     required this.roomInfo,
//   });

//   final RoomModel roomInfo;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
//       child: RoomCard(
//         imageUrl: roomInfo.image,
//         title: roomInfo.name.toString(),
//         hasBorder: true,
//         location: roomInfo.location,
//         price: roomInfo.price.toString(),
//         onTap: () => context.navigateTo(
//           RoomFinderWrapperRoute(children: [
//             const RoomFinderRoute(),
//             RoomInfoRoute(id: roomInfo.id),
//           ]),
//         ),
//         paymentTypeEnum: roomInfo.paymentType, roomStatus: RoomStatus.getStatus(roomInfo.roomStatus.name),
//       ),
//     );
//   }
// }

// class FeedTypeJob extends StatelessWidget {
//   const FeedTypeJob({
//     super.key,
//     required this.jobInfo,
//   });

//   final GetJobModel jobInfo;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
//       child: JobCard(
//         jobModel: jobInfo,
//         onTap: () => context.navigateTo(
//           FeedJobWrapperRoute(
//             children: [
//               FeedJobRoute(),
//               JobInfoRoute(id: jobInfo.id),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }