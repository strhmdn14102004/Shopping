import 'dart:async';

import 'package:flutter/material.dart';

class FlashSaleCountdown extends StatefulWidget {
  const FlashSaleCountdown({Key? key}) : super(key: key);

  @override
  _FlashSaleCountdownState createState() => _FlashSaleCountdownState();
}

class _FlashSaleCountdownState extends State<FlashSaleCountdown> {
  late Timer _timer;
  late DateTime _endTime;

  @override
  void initState() {
    super.initState();
    // Set the end time for the flash sale (adjust this as needed)
    _endTime = DateTime.now().add(Duration(days: 1, hours: 1, minutes: 30));
    // Start the countdown timer
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
      if (DateTime.now().isAfter(_endTime)) {
        // The flash sale has ended, you can handle this event here
        _timer.cancel();
      }
    });
  }

  String _formatDuration(Duration duration) {
    return '${duration.inHours.remainder(24).toString().padLeft(2, '0')} : '
        '${(duration.inMinutes.remainder(60)).toString().padLeft(2, '0')} : '
        '${(duration.inSeconds.remainder(60)).toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    Duration remainingTime = _endTime.difference(DateTime.now());
    return Text(
      _formatDuration(remainingTime),
      style: TextStyle(
        fontFamily: 'Lato',
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}
