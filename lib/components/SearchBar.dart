import 'package:flutter/material.dart';
import 'package:expirations/design_system/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MySearchBar extends StatefulWidget {
  final Function(String) onUserSelected;

  const MySearchBar({super.key, required this.onUserSelected});

  @override
  State<MySearchBar> createState() {
    return _SearchBarState();
  }
}

class _SearchBarState extends State<MySearchBar> {
  bool isActive = false;
  bool isSelected = false;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  void _selectUser() {
    setState(() {
      isSelected = true;
    });
    widget.onUserSelected(_controller.text);
    _focusNode.unfocus(); // Unfocus the TextField
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      focusNode: _focusNode,
      controller: _controller,
      onSubmitted: (_) => _selectUser(),
      onChanged: (String text) {
        setState(() {
          isActive = text.isNotEmpty;
        });
      },
      onClear: () {
        setState(() {
          isActive = false;
        });
        _controller.clear();
        _focusNode.unfocus(); // Unfocus the TextField
      },
      isSelected: isSelected,
      isActive: isActive,
    );
  }
}

class SearchBar extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController controller;
  final ValueChanged<String> onSubmitted;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;
  final bool isSelected;
  final bool isActive;

  const SearchBar({
    super.key,
    required this.focusNode,
    required this.controller,
    required this.onSubmitted,
    required this.onChanged,
    required this.onClear,
    required this.isSelected,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(1000)),
        boxShadow: [
          BoxShadow(color: Color(0x1a000000), offset: Offset(0, 0), blurRadius: 4)
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              focusNode: focusNode,
              controller: controller,
              onSubmitted: onSubmitted,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: 'Write an username',
                hintStyle: TextStyle(color: grey500, fontSize: 20),
              ),
            ),
          ),
          IconButton(
            icon: SvgPicture.asset('assets/icons/search.svg', width: 24, height: 24),
            onPressed: () => onSubmitted(controller.text),
          ),
        ],
      ),
    );
  }
}
