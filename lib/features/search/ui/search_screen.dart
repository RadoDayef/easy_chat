import 'package:easy_chat/core/utils/extensions/num_extensions.dart';
import 'package:easy_chat/features/search/data/models/search_model.dart';
import 'package:easy_chat/features/search/logic/search_cubit.dart';
import 'package:easy_chat/features/search/ui/widgets/search_bar_widget.dart';
import 'package:easy_chat/features/search/ui/widgets/searched_user_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: 24),
      child: Column(
        children: [
          SearchBarWidget(controller: context.read<SearchCubit>().controller),
          Expanded(
            child: ListView.separated(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final SearchModel search = users[index];
                return SearchedUserWidget(search);
              },
              separatorBuilder: (context, index) {
                return 12.vGap;
              },
            ),
          ),
        ],
      ),
    );
  }
}

List<SearchModel> users = [
  SearchModel(
    name: "Laila Ahmed",
    image: "https://www.fluentu.com/blog/wp-content/uploads/site//4/african-american-young-mom-with-curly-hair-in-stylish-outfit-feeling-grateful-and-happy-receiving-surprise-gift-from-kid-holding-palms-on-heart-smiling.jpg",
  ),
  SearchModel(
    name: "Mohamed Ali",
    image: "https://img.magnific.com/free-photo/young-handsome-man-wearing-casual-tshirt-blue-background-happy-face-smiling-with-crossed-arms-looking-camera-positive-person_839833-12963.jpg?semt=ais_hybrid&w=740&q=80",
  ),
];
