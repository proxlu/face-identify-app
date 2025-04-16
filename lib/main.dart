import 'package:biopassid_face_sdk/biopassid_face_sdk.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Face Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void takeFace() async {
    final config = FaceConfig(licenseKey: 'YOUR_KEY_HERE');
    // If you want to use Liveness, uncomment this line
    // config.liveness.enabled = true;
    final controller = FaceController();
    await controller.takeFace(
      config: config,
      onFaceCapture: (faceImage, faceAttributes /* Only available on Liveness */) {
        print('onFaceCapture: ${faceImage.image.first}');
        // Only available on Liveness
        print('onFaceCapture: $faceAttributes');
      },
      // Only available on Liveness
      onFaceDetected: (faceAttributes) {
        print('onFaceDetected: $faceAttributes');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Face Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: takeFace,
          child: const Text('Capture Face'),
        ),
      ),
    );
  }
}