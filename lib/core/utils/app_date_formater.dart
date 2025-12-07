
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppDateFormatter {
  /// Converts ISO string to 'HH:mm' format (e.g. 20:30)
  static String formatToHourMinute(String dateTimeString) {
    try {
      final dateTime = DateTime.parse(dateTimeString).toLocal();
      return DateFormat('HH:mm').format(dateTime);
    } catch (_) {
      return '--:--';
    }
  }

  static DateTime? unixToDateTime(int? timestampInSeconds) {
    if (timestampInSeconds == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(timestampInSeconds * 1000);
  }

  static TimeOfDay? unixToTimeOfDay(int? timestampInSeconds) {
    if (timestampInSeconds == null) return null;
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      timestampInSeconds * 1000,
    );
    return TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
  }

  /// Returns time difference in human-readable form (e.g. 2h ago, 1d ago)
  static String timeAgo(String dateTimeString) {
    try {
      final dateTime = DateTime.parse(dateTimeString).toLocal();
      final now = DateTime.now();
      final diff = now.difference(dateTime);

      if (diff.inSeconds < 60) return '${diff.inSeconds}s ago';
      if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
      if (diff.inHours < 24) return '${diff.inHours}h ago';
      if (diff.inDays < 7) return '${diff.inDays}d ago';

      return DateFormat('MMM d, yyyy').format(dateTime); // fallback
    } catch (_) {
      return '';
    }
  }
  static String timeAgoExtendedDates(String dateTimeString) {
  try {
    final dateTime = DateTime.parse(dateTimeString).toLocal();
    final now = DateTime.now();
    final diff = now.difference(dateTime);

    if (diff.inSeconds < 60) return '${diff.inSeconds}s ago';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    
    // Handle days
    if (diff.inDays < 7) return '${diff.inDays}d ago';
    
    // Handle weeks (up to 4 weeks)
    final weeks = (diff.inDays / 7).floor();
    if (weeks <= 4) return '$weeks week${weeks > 1 ? 's' : ''} ago';
    
    // Handle months (up to 12 months)
    final months = (diff.inDays / 30).floor();
    if (months <= 12) return '$months month${months > 1 ? 's' : ''} ago';
    
    // For anything older than 12 months, show month and year
    return DateFormat('MMMM yyyy').format(dateTime);
  } catch (_) {
    return '';
  }
}

  static String formatTime(DateTime date, {bool use24Hour = false}) {
    final formatter = DateFormat.Hm();

    return formatter.format(date);
  }

  //   /// Format duration between two dates
  static String formatDuration(DateTime start, DateTime end) {
    final duration = end.difference(start);
    final days = duration.inDays;
    final hours = duration.inHours % 24;
    final minutes = duration.inMinutes % 60;

    if (days > 0) {
      return '$days ${days == 1 ? 'day' : 'days'}, '
          '$hours ${hours == 1 ? 'hour' : 'hours'}';
    } else if (hours > 0) {
      return '$hours ${hours == 1 ? 'hour' : 'hours'}, '
          '$minutes ${minutes == 1 ? 'minute' : 'minutes'}';
    } else {
      return '$minutes ${minutes == 1 ? 'minute' : 'minutes'}';
    }
  }

  static String timeAgoInShort(DateTime start, DateTime end) {
    final duration = end.difference(start);
    final days = duration.inDays;
    final hours = duration.inHours % 24;
    final minutes = duration.inMinutes % 60;

    if (days > 0) {
      return '$days ${days == 1 ? 'd' : 'd'}, '
          '$hours ${hours == 1 ? 'h' : 'h'}';
    } else if (hours > 0) {
      return '$hours ${hours == 1 ? 'h' : 'h'}, '
          '$minutes ${minutes == 1 ? 'm' : 'm'}';
    } else {
      return '$minutes ${minutes == 1 ? 'm' : 'm'}';
    }
  }

  static String formatUnixTime(
    int? timestampInSeconds, {
    String fallback = "--",
  }) {
    if (timestampInSeconds == null) return fallback;

    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      timestampInSeconds * 1000,
    );
    return DateFormat.jm().format(dateTime); // e.g., "5:45 AM"
  }

  static String dateShort(DateTime? date) {
    if (date == null) return '';
    return DateFormat('d-M-yyyy').format(date); // e.g., 22/7/2023
  }
  static String dateShortMMMdyyyy(DateTime? date) {
  if (date == null) return '';
  return DateFormat("MMM d, yyyy").format(date); // e.g., Oct 22, 2025
}

}
