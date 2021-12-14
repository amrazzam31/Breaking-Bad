import 'package:breaking_bad/constants/my_colors.dart';
import 'package:breaking_bad/constants/strings.dart';
import 'package:breaking_bad/data/models/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CharactersItem extends StatelessWidget {
  final Character character;
  const CharactersItem({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8.w, 8.h, 8.w, 8.h),
      padding: EdgeInsetsDirectional.all(4.h),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, characterDetailsScreen,
              arguments: character);
        },
        child: Hero(
          tag: character.charId!,
          child: GridTile(
            child: Container(
              color: MyColors.myGrey,
              child: character.img!.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: 'assets/images/loading.gif',
                      image: character.img!,
                    )
                  : Image.asset(
                      'assets/images/error.gif',
                    ),
            ),
            footer: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 10.h,
              ),
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              child: Text(
                '${character.name}',
                style: TextStyle(
                  color: MyColors.myWhite,
                  fontSize: 16.sp,
                  height: 1.3.h,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
