// import 'package:flutter/material.dart';

// import '../../../shared/services/audio/recording_service.dart';
// import '../../../shared/services/audio/sound_playing_service.dart';

// class AudioRecorderWidgetExample extends StatefulWidget {
//   const AudioRecorderWidgetExample({Key? key}) : super(key: key);

//   @override
//   State<AudioRecorderWidgetExample> createState() => _AudioRecorderWidgetState();
// }

// class _AudioRecorderWidgetState extends State<AudioRecorderWidgetExample> {
//   final recorder = SoundRecorder();
//   final player = SoundPlayer();
//   bool isRecording = false;
//   bool isAudioPlaying = false;

//   onRecordingButtonPressed() async {
//     if (!isRecording) {
//       recorder.record();
//       setState(() {
//         isRecording = true;
//       });
//     } else {
//       recorder.stop();
//       setState(() {
//         isRecording = false;
//       });
//     }
//   }

//   onPlayButtonPressed() {
//     setState(() {
//       isAudioPlaying = true;
//     });
//     player.togglePlaying(whenFinished: () {
//       setState(() {
//         isAudioPlaying = false;
//       });
//     });
//   }

//   @override
//   void initState() {
//     recorder.init();
//     player.init();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     recorder.dispose();
//     player.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const Text("Microphone Usage Example:"),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 onPressed: onRecordingButtonPressed,
//                 child: isRecording ? const Text("pause") : const Text("record"),
//               ),
//               const SizedBox(width: 20),
//               ElevatedButton(
//                 onPressed: onPlayButtonPressed,
//                 child: isAudioPlaying ? const Text("stop") : const Text("play"),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
