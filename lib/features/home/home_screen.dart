import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firstaid/l10n/app_localizations.dart';
import '../../core/database/models/procedure.dart';
import '../../core/providers/providers.dart';
import '../../core/utils/responsive.dart';
import 'detail_screen.dart';

// State provider for the search query string
final searchQueryProvider = StateProvider<String>((ref) => "");

// State provider for the selected procedure in Tablet/Foldable dual-pane mode
final selectedProcedureProvider = StateProvider<Procedure?>((ref) => null);

// FutureProvider to fetch filtered procedures
final proceduresProvider = FutureProvider<List<Procedure>>((ref) async {
  final dbService = ref.watch(isarServiceProvider);
  final query = ref.watch(searchQueryProvider);
  return await dbService.searchProcedures(query);
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final locale = ref.watch(localeProvider);
    final isTablet = Responsive.isTablet(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appName),
        actions: [
          // Language Switcher Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextButton.icon(
              onPressed: () {
                ref.read(localeProvider.notifier).toggleLocale();
              },
              icon: const Icon(Icons.language, color: Colors.white),
              label: Text(
                locale.languageCode == 'en' ? 'SW' : 'EN',
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: isTablet ? _buildDualPane(context, ref) : _buildSinglePane(context, ref),
    );
  }

  Widget _buildSinglePane(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      children: [
        _buildSearchBar(context, ref, l10n),
        Expanded(child: _buildGrid(context, ref, false)),
      ],
    );
  }

  Widget _buildDualPane(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final selectedProc = ref.watch(selectedProcedureProvider);

    return Row(
      children: [
        // Left Side: Search and List
        Expanded(
          flex: 4,
          child: Container(
            decoration: const BoxDecoration(
              border: Border(right: BorderSide(color: Colors.grey, width: 0.5)),
            ),
            child: Column(
              children: [
                _buildSearchBar(context, ref, l10n),
                Expanded(child: _buildGrid(context, ref, true)),
              ],
            ),
          ),
        ),
        // Right Side: Detail Panel
        Expanded(
          flex: 6,
          child: selectedProc == null
              ? const Center(
                  child: Text(
                    "Select a procedure from the list to view instructions.",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                )
              : DetailScreen(procedure: selectedProc, isEmbedded: true),
        ),
      ],
    );
  }

  Widget _buildSearchBar(BuildContext context, WidgetRef ref, AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            onChanged: (val) {
              ref.read(searchQueryProvider.notifier).state = val;
            },
            decoration: InputDecoration(
              hintText: l10n.searchHint,
              border: InputBorder.none,
              icon: const Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGrid(BuildContext context, WidgetRef ref, bool isDualPane) {
    final proceduresAsync = ref.watch(proceduresProvider);
    final locale = ref.watch(localeProvider);
    final isSw = locale.languageCode == 'sw';

    return proceduresAsync.when(
      data: (procedures) {
        if (procedures.isEmpty) {
          return const Center(child: Text("No procedures found."));
        }

        final columns = Responsive.isLargeTablet(context) ? 4 : (Responsive.isTablet(context) ? 3 : 2);

        return GridView.builder(
          padding: const EdgeInsets.all(16.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isDualPane ? 2 : columns,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.1,
          ),
          itemCount: procedures.length,
          itemBuilder: (context, idx) {
            final proc = procedures[idx];
            final title = isSw ? proc.titleSw : proc.titleEn;
            final isCritical = proc.severityLevel == 1;

            return InkWell(
              onTap: () {
                // Log search / view event to telemetry
                ref.read(isarServiceProvider).logEvent("view_procedure", {"id": proc.id, "title": proc.titleEn});

                if (isDualPane) {
                  ref.read(selectedProcedureProvider.notifier).state = proc;
                } else {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(procedure: proc, isEmbedded: false),
                    ),
                  );
                }
              },
              child: Card(
                color: isCritical ? Colors.red[50] : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: isCritical
                      ? const BorderSide(color: Colors.red, width: 1.5)
                      : BorderSide.none,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Render Icon or fallback placeholder
                      Image.asset(
                        'assets/images/${proc.iconName}.png',
                        width: 48,
                        height: 48,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.medical_services, size: 48, color: Colors.red);
                        },
                      ),
                      const SizedBox(height: 12),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: isCritical ? Colors.red[900] : Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text("Error: $err")),
    );
  }
}
