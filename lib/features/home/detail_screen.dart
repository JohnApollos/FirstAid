import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../core/database/models/procedure.dart';
import '../../core/providers/providers.dart';

class DetailScreen extends ConsumerStatefulWidget {
  final Procedure procedure;
  final bool isEmbedded;

  const DetailScreen({
    super.key,
    required this.procedure,
    required this.isEmbedded,
  });

  @override
  ConsumerState<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  final FlutterTts _flutterTts = FlutterTts();
  bool _isSpeaking = false;

  @override
  void initState() {
    super.initState();
    _initTts();
  }

  void _initTts() {
    _flutterTts.setStartHandler(() {
      setState(() => _isSpeaking = true);
    });

    _flutterTts.setCompletionHandler(() {
      setState(() {
        _isSpeaking = false;
      });
    });

    _flutterTts.setErrorHandler((msg) {
      setState(() {
        _isSpeaking = false;
      });
    });
  }

  @override
  void dispose() {
    _flutterTts.stop();
    super.dispose();
  }

  Future<void> _toggleSpeech(String langCode) async {
    if (_isSpeaking) {
      await _flutterTts.stop();
      setState(() {
        _isSpeaking = false;
      });
    } else {
      // Set correct voice language locale
      String ttsLang = 'en-US';
      if (langCode == 'sw') {
        ttsLang = 'sw-KE';
      } else if (langCode == 'so') {
        ttsLang = 'so-SO';
      }
      await _flutterTts.setLanguage(ttsLang);
      await _flutterTts.setSpeechRate(0.45); // Slower speech rate for crisis comprehension

      // Concatenate and read instructions
      final buffer = StringBuffer();
      final steps = widget.procedure.steps ?? [];
      for (final step in steps) {
        final text = step.instruction?.get(langCode) ?? '';
        buffer.write("Step ${step.stepOrder}. $text. ");
      }

      setState(() => _isSpeaking = true);
      await _flutterTts.speak(buffer.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final locale = ref.watch(localeProvider);
    final langCode = locale.languageCode;
    final title = widget.procedure.title?.get(langCode) ?? '';
    final steps = widget.procedure.steps ?? [];

    final body = Stack(
      children: [
        ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: steps.length,
          itemBuilder: (context, idx) {
            final step = steps[idx];
            final instruction = step.instruction?.get(langCode) ?? '';

            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Step Number and Title Bar
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 16,
                          child: Text(
                            "${step.stepOrder}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          "Step Instruction",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Image asset container
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/${step.imageResource}.jpg',
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          // Try PNG loading if JPG fails
                          return Image.asset(
                            'assets/images/${step.imageResource}.png',
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                height: 100,
                                color: Colors.grey[200],
                                child: const Center(
                                  child: Icon(
                                    Icons.image_not_supported,
                                    size: 40,
                                    color: Colors.grey,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Instruction text
                    Text(
                      instruction,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.5,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        // Speech Action Button overlay
        Positioned(
          bottom: 24,
          right: 24,
          child: FloatingActionButton.extended(
            backgroundColor: Colors.red[700],
            foregroundColor: Colors.white,
            onPressed: () => _toggleSpeech(langCode),
            icon: Icon(
              _isSpeaking ? Icons.volume_off : Icons.volume_up,
            ),
            label: Text(
              _isSpeaking 
                ? (langCode == 'so' ? "Dami Codka" : (langCode == 'sw' ? "Zima Sauti" : "Stop Voice")) 
                : (langCode == 'so' ? "Dhageyso Hagaha" : (langCode == 'sw' ? "Sikiliza Maelezo" : "Listen to Guide")),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );

    if (widget.isEmbedded) {
      return Scaffold(
        appBar: AppBar(
          title: Text(title),
          automaticallyImplyLeading: false,
        ),
        body: body,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
    );
  }
}
