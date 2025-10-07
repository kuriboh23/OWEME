import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:oweme/core/theme.dart';
import 'package:oweme/features/AddGroup/screens/search_member.dart';
import 'package:oweme/features/AddGroup/widgets/memeber.dart';

class AddGroupScreen extends StatefulWidget {
  const AddGroupScreen({super.key});

  @override
  State<AddGroupScreen> createState() => _AddGroupScreenState();
}

class _AddGroupScreenState extends State<AddGroupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final List<String> _members = [
    'Hamza',
    'Alae',
    'Alaaedin',
    'Yakuza',
    'Yassmine',
  ];

  bool _isCreating = false;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _openSearchMembers() async {
    // Expecting SearchMember to return a List<String> of selected member names.
    final List<String>? picked = await Navigator.of(context).push<List<String>>(
      MaterialPageRoute(builder: (context) => const SearchMember()),
    );

    if (picked == null || picked.isEmpty) return;

    setState(() {
      for (final name in picked) {
        if (!_members.contains(name)) {
          _members.add(name);
        }
      }
    });
  }

  void _removeMember(String name) {
    setState(() => _members.remove(name));
  }

  Future<void> _createGroup() async {
    final name = _nameController.text.trim();

    if (name.isEmpty) {
      _showSnack('Please enter a group name.');
      return;
    }
    if (_members.isEmpty) {
      _showSnack('Please add at least one member.');
      return;
    }

    setState(() => _isCreating = true);

    try {
      // TODO: Replace with your repository/service call.
      await Future.delayed(const Duration(milliseconds: 800));

      _showSnack(
        'Group "$name" created with ${_members.length} member${_members.length == 1 ? '' : 's'}',
      );
    } catch (e) {
      _showSnack('Failed to create group. Please try again.');
    } finally {
      if (mounted) setState(() => _isCreating = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Add Group',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: context.inversePrimary,
                  ),
                ),
              ),
              const SizedBox(height: 42),
              Text(
                'Group Name',
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ).copyWith(color: context.inversePrimary),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _nameController,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => _createGroup(),
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(
                      color: context.inversePrimary.withAlpha(60),
                    ),
                  ),
                  fillColor: context.primary,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Trip, etc.',
                ),
                style: TextStyle(color: context.inversePrimary),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Members',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: context.inversePrimary,
                    ),
                  ),
                  IconButton(
                    onPressed: _openSearchMembers,
                    icon: Icon(
                      PhosphorIcons.plus_circle_bold,
                      color: context.inversePrimary,
                      size: 28,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: _members.isEmpty
                    ? Center(
                        child: Text(
                          'No members added yet.',
                          style: TextStyle(
                            color: context.inversePrimary.withOpacity(0.7),
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: _members.length,
                        itemBuilder: (context, index) => Memeber(
                          name: _members[index],
                          onPressed: () => _removeMember(_members[index]),
                          icon: Icons.remove_circle_outline_rounded,
                        ),
                      ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _isCreating ? null : _createGroup,
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.inversePrimary,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: _isCreating
                    ? SizedBox(
                        height: 22,
                        width: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.4,
                          color: context.inversePrimary,
                        ),
                      )
                    : Text(
                        'Create Group',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: context.primaryBackground,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
