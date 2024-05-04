import 'package:flutter/material.dart';
import 'package:oydeeedashboard/src/core/core.dart';

import '../dashboard.dart';

class RoomCard extends StatelessWidget {
  const RoomCard(
      {super.key,
      required this.title,
      this.rating,
      required this.location,
      required this.price,
      this.onTap,
      this.hasBorder = false,
      this.imageUrl,
      required this.paymentTypeEnum,
      required this.roomStatus});

  final String title;
  final double? rating;
  final String location;
  final String price;
  final void Function()? onTap;
  final bool hasBorder;
  final String? imageUrl;
  final RoomPaymentTypeEnum paymentTypeEnum;
  final RoomStatus roomStatus;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: 8.rounded,
          border: hasBorder
              ? Border.all(
                  color: AppColors.lightWhite,
                  width: 1,
                )
              : null,
          boxShadow: const [
            BoxShadow(
              color: AppColors.fadedBlack,
              offset: Offset(0, 4),
              blurRadius: 30,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: onTap,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: 8.rounded,
                        child: SizedBox(
                          height: 120,
                          width: 100,
                          child: AppCacheImageViewer(
                            imageUrl: imageUrl ?? '',
                            imageTypeEnum: ImageTypeEnum.network,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      14.horizontalSpace,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(),
                            Row(
                              children: [
                                SizedBox(
                                  width: context.width / 1.8,
                                  child: Text(
                                    title,
                                    overflow: TextOverflow.clip,
                                    style: AppTextStyles.text14PxBold.black,
                                  ),
                                ),
                                // if (rating != null) RatingCount(rating: rating!),
                              ],
                            ),
                            3.verticalSpace,
                            Text(location, style: AppTextStyles.text12Px.textGrey),
                            5.verticalSpace,
                            Row(
                              children: [
                                Text(
                                  price,
                                  style: AppTextStyles.text16PxMedium.textBlue,
                                ),
                                Text(' / ${paymentTypeEnum.title}'),
                              ],
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Container(
                                  height: 8,
                                  width: 8,
                                  decoration: BoxDecoration(
                                    color: roomStatus.getStatusColor,
                                    borderRadius: 8.rounded,
                                  ),
                                ),
                                6.horizontalSpace,
                                Text(
                                  roomStatus.getStatusText,
                                  style: AppTextStyles.text12Px.textGrey,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
