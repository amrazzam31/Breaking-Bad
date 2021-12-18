import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:breaking_bad/business_logic/characters_cubit.dart';
import 'package:breaking_bad/constants/my_colors.dart';
import 'package:breaking_bad/data/models/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'characters_screen.dart';

class CharacterDetailsScreen extends StatelessWidget {
  const CharacterDetailsScreen({required this.character, Key? key})
      : super(key: key);
  final Character character;

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600.h,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        //   centerTitle: true,
        title: Text(
          character.nickname!,
          style: const TextStyle(
            color: MyColors.myWhite,
          ),
        ),
        background: Hero(
          tag: character.charId!,
          child: Image.network(
            character.img!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget checkIfQuotesAreLoaded(CharactersState state) {
    if (state is CharacterQuotesLoaded) {
      return displayRandomQuoteOrEmptySpace(state);
    } else {
      return const ShowLoadingIndicator();
    }
  }

  Widget displayRandomQuoteOrEmptySpace(state) {
    var quotes = (state).quotes;
    if (quotes.length != 0) {
      int randomQuoteIndex = Random().nextInt(quotes.length - 1);
      return Center(
        child: DefaultTextStyle(
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            color: MyColors.myWhite,
            shadows: [
              Shadow(
                blurRadius: 7,
                color: MyColors.myYellow,
                offset: Offset(0, 0),
              )
            ],
          ),
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              FlickerAnimatedText(quotes[randomQuoteIndex].quote),
            ],
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharactersCubit>(context).getCharacterQuotes(character.name! );

    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.fromLTRB(14.w, 14.h, 14.h, 0),
                  padding: EdgeInsets.all(8.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CharacterInfo(
                        title: 'Actor/Actress: ',
                        value: character.name!,
                      ),
                      BuildDivider(
                        endIndent: 247.w,
                      ),
                      CharacterInfo(
                        title: 'Job: ',
                        value: character.occupation!.join(' | '),
                      ),
                      BuildDivider(
                        endIndent: 310.w,
                      ),
                      CharacterInfo(
                        title: 'Status: ',
                        value: character.status!,
                      ),
                      BuildDivider(
                        endIndent: 295.w,
                      ),
                      CharacterInfo(
                        title: 'Appeared in: ',
                        value: character.category!,
                      ),
                      BuildDivider(
                        endIndent: 260.w,
                      ),
                      CharacterInfo(
                        title: 'Seasons: ',
                        value: character.appearance!.join(' | '),
                      ),
                      BuildDivider(
                        endIndent: 280.w,
                      ),
                      character.betterCallSaulAppearance!.isEmpty
                          ? const SizedBox.shrink()
                          : CharacterInfo(
                              title: 'Better Call Saul Seasons: ',
                              value: character.betterCallSaulAppearance!
                                  .join(' / '),
                            ),
                      character.betterCallSaulAppearance!.isEmpty
                          ? const SizedBox.shrink()
                          : BuildDivider(
                              endIndent: 180.w,
                            ),
                      SizedBox(
                        height: 20.h,
                      ),
                      BlocBuilder<CharactersCubit, CharactersState>(
                          builder: (context, state) {
                        return checkIfQuotesAreLoaded(state);
                      }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 400.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CharacterInfo extends StatelessWidget {
  const CharacterInfo({required this.title, required this.value, Key? key})
      : super(key: key);
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: MyColors.myWhite,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}

class BuildDivider extends StatelessWidget {
  const BuildDivider({required this.endIndent, Key? key}) : super(key: key);
  final double endIndent;
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: MyColors.myYellow,
      height: 30.h,
      endIndent: endIndent,
      thickness: 2.h,
    );
  }
}
