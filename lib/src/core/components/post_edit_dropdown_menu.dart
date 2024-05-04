// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../features/dashboard/dashboard.dart';
// import '../assets/assets.gen.dart';
// import '../core.dart';

// class PostEditDropdownMenu extends StatelessWidget {
//   PostEditDropdownMenu({required this.feed});
//   final FeedModel feed;
//   final GlobalKey _popupMenuButtonKey = GlobalKey();

//   Border get _border => Border(
//         bottom: BorderSide(
//           color: AppColors.textGrey.withOpacity(0.2),
//           width: 1.0,
//         ),
//       );

//   void _openPopupMenu(BuildContext context, String currentUserId) {
//     final RenderBox button = _popupMenuButtonKey.currentContext!.findRenderObject() as RenderBox;
//     final Offset offset = button.localToGlobal(Offset(20, button.size.height - 20));
//     final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
//     final RelativeRect position = RelativeRect.fromRect(
//       Rect.fromPoints(offset, offset.translate(1.0, 1.0)),
//       Offset.zero & overlay.size,
//     );

//     bool isUser = feed.user.id == currentUserId;
//     showMenu<String>(
//       constraints: const BoxConstraints(minWidth: 200),
//       context: context,
//       position: position,
//       shape: RoundedRectangleBorder(borderRadius: 4.rounded),
//       surfaceTintColor: AppColors.white,
//       color: AppColors.white,
//       items: [
//         if (isUser)
//           PopupMenuItem<String>(
//             child: ListTile(
//               contentPadding: EdgeInsets.zero,
//               title: const Text('Edit Post'),
//               onTap: () {
//                 Navigator.pop(context);
//                 if (feed.postType == FeedType.POST) {
//                   // context.navigateTo(FeedWrapperRoute(children: [CreatePostRoute(feedModel: feed, editPost: true)]));
//                 } else if (feed.postType == FeedType.JOB) {
//                   // context.navigateTo(FeedJobWrapperRoute(children: [FeedJobRoute(), JobPostRoute(jobEdit: true, feedId: feed.job!.id)]));
//                 } else {
//                   // context.navigateTo(
//                   //     RoomFinderWrapperRoute(children: [const RoomFinderRoute(), CreateRoomRoute(roomEdit: true, feedId: feed.room!.id)]));
//                 }
//               },
//               shape: _border,
//               leading: Icon(Icons.edit),
//             ),
//           ),
//         PopupMenuItem<String>(
//           value: 'Report Post',
//           child: ListTile(
//             contentPadding: EdgeInsets.zero,
//             title: const Text('Report Post'),
//             onTap: () {
//               Navigator.pop(context);
//               // showReportBottomSheet(context, feed.id, 'Post', ReportTypeEnum.POST, null);
//             },
//             shape: _border,
//             leading: Icon(Icons.save)
//           ),
//         ),
//         if (isUser)
//           PopupMenuItem<String>(
//             value: 'Delete Post',
//             child: ListTile(
//               contentPadding: EdgeInsets.zero,
//               title: const Text(
//                 'Delete Post',
//                 style: TextStyle(color: AppColors.statusRed),
//               ),
//               onTap: () {
//                 Navigator.pop(context);
//                 DeleteDialog.show(context, id: feed.id);
//               },
//               leading: Icon(Icons.delete,color: AppColors.statusRed,)
//             ),
//           ),
//       ],
//     ).then((value) {
//       if (value != null) {}
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => getIt<UserInfoCubit>(),
//       child: BlocBuilder<UserInfoCubit, UserInfoState>(
//         builder: (context, state) {
//           return state.maybeWhen(
//             orElse: Container.new,
//             success: (userInfo) => IconButton(
//               onPressed: () {
//                 _openPopupMenu(context, userInfo.id);
//               },
//               icon: const Icon(Icons.more_vert_sharp),
//               key: _popupMenuButtonKey,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class DeleteDialog extends StatelessWidget {
//   const DeleteDialog({super.key, required this.id});

//   final String id;

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (context) => getIt<DeletePostCubit>(),
//         ),
//       ],
//       child: BlocListener<DeletePostCubit, DeletePostState>(
//         listener: (context, state) {
//           state.maybeWhen(
//             orElse: () {},
//             success: (message) {
//               Navigator.pop(context);
              
//             },
//             error: (message) => Text(message),
//           );
//         },
//         child: AlertDialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           surfaceTintColor: AppColors.white,
//           insetPadding: EdgeInsets.zero,
//           contentPadding: const EdgeInsets.symmetric(horizontal: 25).copyWith(
//             bottom: 20,
//           ),
//           title: Center(
//             child: Column(
//               children: [
//                 Lottie.asset(
//                   Assets.lottie.delete,
//                   height: 120,
//                   fit: BoxFit.cover,
//                   repeat: false,
//                 ),
//                 6.verticalSpace,
//                 Text('Delete  Post ?', style: AppStyles.text20PxBold),
//               ],
//             ),
//           ),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Do you sure want to delete ?',
//                 style: AppStyles.text14Px,
//                 textAlign: TextAlign.center,
//               ),
//               15.verticalSpace,
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   TextButton(
//                     onPressed: () => Navigator.pop(context),
//                     style: ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20.0),
//                       ),
//                     ),
//                     child: Text(
//                       'Cancel',
//                       style: AppStyles.text12PxMedium.black,
//                     ),
//                   ),
//                   BlocBuilder<DeletePostCubit, DeletePostState>(
//                     builder: (context, state) => state.maybeWhen(
//                       orElse: () => ElevatedButton(
//                         onPressed: () => context.read<DeletePostCubit>().deletePost(id),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: AppColors.statusRed,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20.0),
//                           ),
//                         ),
//                         child: Text(
//                           'Delete',
//                           style: AppStyles.text12PxMedium.white,
//                         ),
//                       ),
//                       loading: () => const Center(
//                         child: CustomCircularProgressIndicator(),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               10.verticalSpace,
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   static void show(BuildContext context, {required String id}) {
//     showModal<void>(
//       context: context,
//       configuration: const FadeScaleTransitionConfiguration(
//         barrierDismissible: true,
//         transitionDuration: Duration(milliseconds: 400),
//         reverseTransitionDuration: Duration(milliseconds: 400),
//       ),
//       builder: (context) => DeleteDialog(id: id),
//     );
//   }
// }
