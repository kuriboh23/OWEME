import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart'
    show PhosphorIcons;
import 'package:oweme/core/theme.dart';
import 'package:oweme/features/AddGroup/widgets/memeber.dart';

class SearchMember extends StatefulWidget {
  const SearchMember({
    super.key,
    this.initialSelected = const [],
    this.allCandidates,
    this.title = 'Search Member',
  });

  // Members preselected from the AddGroup screen
  final List<String> initialSelected;

  // Optional: provide the full list of candidates; falls back to a sample list
  final List<String>? allCandidates;

  final String title;

  @override
  State<SearchMember> createState() => _SearchMemberState();
}

class _SearchMemberState extends State<SearchMember> {
  late final List<String> _allMembers;
  final Set<String> _selected = <String>{};
  final TextEditingController _searchCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _allMembers =
        (widget.allCandidates ??
              <String>[
                // Sample data — pass your real list via allCandidates
                'Hamza', 'Alae', 'Alaaedin', 'Yakuza', 'Yassmine',
                'member 1', 'member 2', 'member 3',
                'Alice', 'Bob', 'Charlie',
              ])
          ..sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));

    // Preselect the ones passed from parent (only ones present in _allMembers)
    _selected.addAll(widget.initialSelected.where(_allMembers.contains));

    _searchCtrl.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  void _toggle(String name) {
    setState(() {
      if (_selected.contains(name)) {
        _selected.remove(name);
      } else {
        _selected.add(name);
      }
    });
  }

  void _confirm() {
    Navigator.pop(context, _selected.toList());
  }

  List<String> get _filteredCandidates {
    final q = _searchCtrl.text.trim().toLowerCase();
    return _allMembers
        .where((name) => !_selected.contains(name))
        .where((name) => q.isEmpty || name.toLowerCase().contains(q))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final candidates = _filteredCandidates;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: _selected.isEmpty ? null : _confirm,
            child: Text(
              _selected.isEmpty ? 'Done' : 'Add (${_selected.length})',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: _selected.isEmpty
                    ? Theme.of(context).disabledColor
                    : context.inversePrimary,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Search bar
            TextField(
              controller: _searchCtrl,
              decoration: InputDecoration(
                hintText: 'Search by name',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Selected members (horizontal)
            SizedBox(
              height: 70,
              child: _selected.isEmpty
                  ? Center(
                      child: Text(
                        'No members selected',
                        style: TextStyle(color: Theme.of(context).hintColor),
                      ),
                    )
                  : ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: _selected.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final name = _selected.elementAt(index);
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => _toggle(name), // tap to remove
                              child: const CircleAvatar(
                                radius: 24,
                                child: Icon(PhosphorIcons.user_circle_bold),
                              ),
                            ),
                            SizedBox(
                              width: 72,
                              child: Text(
                                name,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
            ),
            const SizedBox(height: 8),

            // Available candidates
            Expanded(
              child: candidates.isEmpty
                  ? const Center(child: Text('No results'))
                  : ListView.builder(
                      itemCount: candidates.length,
                      itemBuilder: (context, index) {
                        final name = candidates[index];
                        return Memeber(
                          key: ValueKey(name),
                          name: name,
                          icon: Icons.add_circle_outline_rounded,
                          onPressed: () => _toggle(name),
                        );
                      },
                    ),
            ),

            const SizedBox(height: 12),
            // Bottom confirm
            SafeArea(
              top: false,
              child: ElevatedButton.icon(
                onPressed: _selected.isEmpty ? null : _confirm,
                icon: const Icon(Icons.check),
                label: Text(
                  _selected.isEmpty ? 'Done' : 'Add ${_selected.length}',
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
