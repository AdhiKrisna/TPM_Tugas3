import 'package:flutter/material.dart';
import 'dart:async';

class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({super.key});

  @override
  State<StopwatchScreen> createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  late Stopwatch _stopwatch;
  late Timer _timer;

  String _formattedTime = "00:00:00";

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (_stopwatch.isRunning) {
        setState(() {
          _formattedTime = _formatTime(_stopwatch.elapsed);
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }

  void _startStopwatch() {
    setState(() {
      _stopwatch.start();
    });
  }

  void _stopStopwatch() {
    setState(() {
      _stopwatch.stop();
    });
  }

  void _resetStopwatch() {
    setState(() {
      _stopwatch.reset();
      _formattedTime = "00:00:00";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stopwatch'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _formattedTime,
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _startStopwatch,
                    child: const Text('Start'),
                  ),
                  ElevatedButton(
                    onPressed: _stopStopwatch,
                    child: const Text('Stop'),
                  ),
                  ElevatedButton(
                    onPressed: _resetStopwatch,
                    child: const Text('Reset'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
