import 'package:flutter/material.dart';
import 'package:oydeeedashboard/src/core/core.dart';

enum RoomStatusEnum { available, notavailable, booked, deleted, interview }

enum CurrencyEnum { aud, nrp }

enum RoomPaymentTypeEnum {
  monthly('per month'),
  weekly('by weekly');

  const RoomPaymentTypeEnum(this.title);
  final String title;
}

enum RoomTypeEnum { apartment, house, combo, studio, townhouse, basement, duplex, loft, other }

enum AvailabilityForEnum { male, female, couple }

enum FurnishingTypeEnum { furnished, semifurnished, unfurnished }

enum RoomSharingTypeEnum { single, sharing }

enum RoomStatus {
  avialable,
  notavailable,
  booked;

  static List<RoomStatus> loginText = RoomStatus.values.map((e) => e).toList();

  String get getStatusText {
    return switch (this) {
      RoomStatus.avialable => 'Available',
      RoomStatus.notavailable => 'Not Available',
      RoomStatus.booked => 'Booked',
    };
  }

  Color get getStatusColor {
    return switch (this) {
      RoomStatus.avialable => AppColors.statusGreen,
      RoomStatus.notavailable => AppColors.statusRed,
      RoomStatus.booked => AppColors.primary,
    };
  }

  static RoomStatus getStatus(String value) {
    switch (value) {
      case 'AVAILABLE':
        return RoomStatus.avialable;
      case 'NOTAVAILABLE':
        return RoomStatus.notavailable;
      case 'BOOKED':
        return RoomStatus.booked;
      default:
        return RoomStatus.avialable;
    }
  }
}
