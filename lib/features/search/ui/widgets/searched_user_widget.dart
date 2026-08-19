import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_chat/core/utils/extensions/num_extensions.dart';
import 'package:easy_chat/features/search/data/models/search_model.dart';
import 'package:flutter/material.dart';

class SearchedUserWidget extends StatelessWidget {
  final SearchModel search;

  const SearchedUserWidget(this.search, {super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: .symmetric(vertical: 12),
      child: Row(
        children: [
          CircleAvatar(radius: 24, backgroundImage: CachedNetworkImageProvider(search.image)),
          12.hGap,
          Expanded(
            child: Text(search.name, style: theme.textTheme.bodyMedium, maxLines: 1, overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}
