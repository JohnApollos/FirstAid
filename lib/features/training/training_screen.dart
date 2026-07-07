import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firstaid/l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/database/models/quiz_question.dart';
import '../../core/providers/providers.dart';

// State provider to manage local high scores
final highScoreProvider = StateProvider<int>((ref) => 0);

class TrainingScreen extends ConsumerStatefulWidget {
  const TrainingScreen({super.key});

  @override
  ConsumerState<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends ConsumerState<TrainingScreen> with SingleTickerProviderStateMixin {
  // Metronome state variables
  bool _isMetronomeActive = false;
  bool _flashColorState = false;

  // Quiz state variables
  List<QuizQuestion> _quizQuestions = [];
  int _currentQuestionIdx = 0;
  int _score = 0;
  int? _selectedOptionIdx;
  bool _quizAnswered = false;
  bool _quizLoading = true;

  // CPR Pace Tester state variables
  final List<int> _tapTimestamps = [];
  double _currentBpm = 0.0;
  String _paceFeedback = "START TAPPING";
  Color _paceColor = Colors.grey;
  int _totalTaps = 0;
  int _perfectTaps = 0;
  int _perfectStreak = 0;
  int _maxStreak = 0;

  @override
  void initState() {
    super.initState();
    _loadHighScore();
    _loadQuizQuestions();
    _setupMetronomeListener();
  }

  void _setupMetronomeListener() {
    final metronome = ref.read(metronomeServiceProvider);
    metronome.onTick = (state) {
      if (mounted) {
        setState(() {
          _flashColorState = state;
        });
      }
    };
  }

  Future<void> _loadHighScore() async {
    final prefs = await SharedPreferences.getInstance();
    final score = prefs.getInt('high_score') ?? 0;
    ref.read(highScoreProvider.notifier).state = score;
  }

  Future<void> _updateHighScore(int score) async {
    final currentHigh = ref.read(highScoreProvider);
    if (score > currentHigh) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('high_score', score);
      ref.read(highScoreProvider.notifier).state = score;
    }
  }

  Future<void> _loadQuizQuestions() async {
    final db = ref.read(isarServiceProvider);
    final questions = await db.getAllQuizQuestions();
    
    // Shuffle and pick 5 questions for game session
    final random = Random();
    final shuffledList = List<QuizQuestion>.from(questions)..shuffle(random);
    final selectedQuestions = shuffledList.take(5).toList();

    if (mounted) {
      setState(() {
        _quizQuestions = selectedQuestions;
        _quizLoading = false;
        _currentQuestionIdx = 0;
        _score = 0;
        _selectedOptionIdx = null;
        _quizAnswered = false;
      });
    }
  }

  void _checkQuizAnswer() {
    if (_selectedOptionIdx == null) return;
    
    setState(() {
      _quizAnswered = true;
    });

    final currentQuestion = _quizQuestions[_currentQuestionIdx];
    final isCorrect = _selectedOptionIdx == currentQuestion.correctOptionIndex;

    if (isCorrect) {
      _score++;
    }

    // Log telemetry event
    ref.read(isarServiceProvider).logEvent("quiz_answer", {
      "question_id": currentQuestion.id,
      "answered_correctly": isCorrect,
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIdx < _quizQuestions.length - 1) {
      setState(() {
        _currentQuestionIdx++;
        _selectedOptionIdx = null;
        _quizAnswered = false;
      });
    } else {
      // Finished Quiz
      _updateHighScore(_score);
      _showQuizResultsDialog();
    }
  }

  void _showQuizResultsDialog() {
    final l10n = AppLocalizations.of(context)!;
    String feedbackText = "";
    if (_score == _quizQuestions.length) {
      feedbackText = l10n.quizFeedbackPrepared;
    } else if (_score >= 3) {
      feedbackText = l10n.quizFeedbackReview;
    } else {
      feedbackText = l10n.quizFeedbackStudy;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(l10n.quizTab),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "You scored $_score of ${_quizQuestions.length}!",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Text(
                feedbackText,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _loadQuizQuestions();
              },
              child: Text(l10n.restartQuiz),
            ),
          ],
        );
      },
    );
  }

  // --- CPR Pace Tester Logic ---

  void _onPaceTap() {
    final now = DateTime.now().millisecondsSinceEpoch;
    HapticFeedback.lightImpact(); // Haptic pulse feedback on tap

    setState(() {
      _totalTaps++;
      _tapTimestamps.add(now);
      if (_tapTimestamps.length > 10) {
        _tapTimestamps.removeAt(0); // Window limit
      }

      if (_tapTimestamps.length >= 2) {
        double totalInterval = 0;
        for (int i = 1; i < _tapTimestamps.length; i++) {
          totalInterval += (_tapTimestamps[i] - _tapTimestamps[i - 1]);
        }
        final avgInterval = totalInterval / (_tapTimestamps.length - 1);
        _currentBpm = 60000 / avgInterval;

        if (_currentBpm < 100) {
          _paceFeedback = "TOO SLOW (${_currentBpm.toStringAsFixed(0)} BPM)";
          _paceColor = Colors.amber.shade700;
          _perfectStreak = 0;
        } else if (_currentBpm > 120) {
          _paceFeedback = "TOO FAST (${_currentBpm.toStringAsFixed(0)} BPM)";
          _paceColor = Colors.red.shade700;
          _perfectStreak = 0;
        } else {
          _paceFeedback = "PERFECT CPR PACE (${_currentBpm.toStringAsFixed(0)} BPM)";
          _paceColor = Colors.green.shade700;
          _perfectTaps++;
          _perfectStreak++;
          if (_perfectStreak > _maxStreak) {
            _maxStreak = _perfectStreak;
          }
        }
      } else {
        _paceFeedback = "KEEP TAPPING...";
        _paceColor = Colors.blue;
      }
    });
  }

  void _resetPaceTester() {
    setState(() {
      _tapTimestamps.clear();
      _currentBpm = 0.0;
      _paceFeedback = "START TAPPING";
      _paceColor = Colors.grey;
      _totalTaps = 0;
      _perfectTaps = 0;
      _perfectStreak = 0;
      _maxStreak = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final highScore = ref.watch(highScoreProvider);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("FirstAid+ Training"),
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.red[100],
            tabs: const [
              Tab(icon: Icon(Icons.timer), text: "Metronome"),
              Tab(icon: Icon(Icons.touch_app), text: "Pace Tester"),
              Tab(icon: Icon(Icons.school), text: "Quiz"),
            ],
          ),
        ),
        body: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 800), // Max tablet width boundary
            child: TabBarView(
              children: [
                _buildMetronomeTab(l10n),
                _buildPaceTesterTab(),
                _buildQuizTab(l10n, highScore),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMetronomeTab(AppLocalizations l10n) {
    final metronome = ref.read(metronomeServiceProvider);
    final metronomeColor = _flashColorState ? const Color(0xFF00E5FF) : const Color(0xFF212121);
    
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.cprMetronome,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const Text(
            "resuscitation guide compression rate: 100-120 compressions per minute. Press start and follow the rhythmic visual clicks to perform chest compressions.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 48),

          // Compression Flasher Container
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: metronomeColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey[400]!, width: 2),
            ),
            child: Center(
              child: Text(
                _flashColorState ? "PRESS" : "WAIT",
                style: TextStyle(
                  color: _flashColorState ? Colors.black : Colors.white54,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 48),

          // Metronome control trigger
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: _isMetronomeActive ? Colors.grey[800] : Colors.red[700],
              padding: const EdgeInsets.symmetric(vertical: 20),
            ),
            onPressed: () {
              setState(() {
                _isMetronomeActive = !_isMetronomeActive;
              });
              
              if (_isMetronomeActive) {
                ref.read(isarServiceProvider).logEvent("metronome_start", {});
                metronome.start();
              } else {
                ref.read(isarServiceProvider).logEvent("metronome_stop", {});
                metronome.stop();
              }
            },
            child: Text(
              _isMetronomeActive ? l10n.stopMetronome : l10n.startMetronome,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaceTesterTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "CPR Compression Pace Tester",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Tap the pad below repeatedly matching the correct tempo. We will measure your cadence in real-time. Target: 100-120 BPM.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 24),

          // Feedback Banner
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: _paceColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: _paceColor, width: 1.5),
            ),
            child: Text(
              _paceFeedback,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: _paceColor),
            ),
          ),
          const SizedBox(height: 24),

          // Interactive Tap Target
          GestureDetector(
            onTap: _onPaceTap,
            child: Container(
              height: 220,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.grey.shade800, Colors.grey.shade900],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: _paceColor.withOpacity(0.4),
                    blurRadius: 16,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.touch_app, size: 64, color: Colors.white70),
                    SizedBox(height: 8),
                    Text(
                      "TAP HERE",
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 2),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),

          // Statistics display
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatColumn("Total Taps", "$_totalTaps"),
                      _buildStatColumn("Perfect Taps", "$_perfectTaps"),
                    ],
                  ),
                  const Divider(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatColumn("Current Streak", "$_perfectStreak"),
                      _buildStatColumn("Best Streak", "$_maxStreak"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Reset button
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.red[700],
              side: BorderSide(color: Colors.red[700]!),
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            onPressed: _resetPaceTester,
            icon: const Icon(Icons.refresh),
            label: const Text("RESET SESSION", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String label, String value) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.black54, fontSize: 13)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildQuizTab(AppLocalizations l10n, int highScore) {
    if (_quizLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_quizQuestions.isEmpty) {
      return const Center(child: Text("Database questions loading failed."));
    }

    final locale = ref.watch(localeProvider);
    final langCode = locale.languageCode;
    final question = _quizQuestions[_currentQuestionIdx];
    final questionText = question.question?.get(langCode) ?? '';
    final options = question.getOptions(langCode);
    final explanation = question.explanation?.get(langCode) ?? '';

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // High Score & Progress Label
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.highScore(highScore),
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey),
              ),
              Text(
                l10n.questionCount(_currentQuestionIdx + 1, _quizQuestions.length),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Question Card
          Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                questionText,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Options Checklist List
          ...List.generate(options.length, (idx) {
            final optionText = options[idx];
            if (optionText.isEmpty) return const SizedBox.shrink();

            Color? optionColor;
            if (_quizAnswered) {
              if (idx == question.correctOptionIndex) {
                optionColor = Colors.green[100]; // Highlight correct option
              } else if (_selectedOptionIdx == idx) {
                optionColor = Colors.red[100]; // Highlight selected wrong option
              }
            } else if (_selectedOptionIdx == idx) {
              optionColor = Colors.grey[300]; // Highlight selected option
            }

            return Card(
              color: optionColor ?? Colors.white,
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                title: Text(optionText),
                leading: CircleAvatar(
                  radius: 12,
                  child: Text(String.fromCharCode(65 + idx)), // A, B, C, D
                ),
                onTap: _quizAnswered
                    ? null
                    : () {
                        setState(() {
                          _selectedOptionIdx = idx;
                        });
                      },
              ),
            );
          }),
          const SizedBox(height: 24),

          // Explanation Banner (if answered)
          if (_quizAnswered)
            Card(
              color: Colors.blue[50],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Explanation:",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                    const SizedBox(height: 8),
                    Text(explanation),
                  ],
                ),
              ),
            ),
          const SizedBox(height: 24),

          // Actions Buttons (Check / Next)
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: _quizAnswered ? Colors.green[700] : Colors.red[700],
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: _selectedOptionIdx == null
                ? null
                : (_quizAnswered ? _nextQuestion : _checkQuizAnswer),
            child: Text(
              _quizAnswered
                  ? (_currentQuestionIdx == _quizQuestions.length - 1
                      ? l10n.finishButton
                      : l10n.nextButton)
                  : l10n.confirmButton,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
