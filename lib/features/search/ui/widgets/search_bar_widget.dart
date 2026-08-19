import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return TextField(
      controller: controller,
      style: theme.textTheme.bodyLarge,
      cursorColor: theme.primaryColor,
      decoration: InputDecoration(
        hintText: "Search by name",
        hintStyle: theme.textTheme.headlineMedium,
        prefixIcon: Icon(Icons.search, color: theme.primaryColor),
        contentPadding: .symmetric(horizontal: 16, vertical: 16),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: theme.primaryColor, width: 2),
        ),
      ),
    );
  }
}
