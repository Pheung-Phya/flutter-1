import 'package:firebase_auth1/common/widgets/appbar/app_bar.dart';
import 'package:firebase_auth1/common/widgets/buttons/basic_app_button.dart';
import 'package:firebase_auth1/core/config/theme/app_colors.dart';
import 'package:firebase_auth1/presentation/splash/bloc/age_selection_cubit.dart';
import 'package:firebase_auth1/presentation/splash/bloc/gender_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderAndAgeSelection extends StatelessWidget {
  const GenderAndAgeSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(),
      body: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => GenderSelectionCubit()),
            BlocProvider(create: (context) => AgeSelectionCubit())
          ],
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _tellUs(),
                    const SizedBox(
                      height: 30,
                    ),
                    _genders(context),
                    const SizedBox(
                      height: 30,
                    ),
                    _howOld(),
                    const SizedBox(
                      height: 30,
                    ),
                    _age(context),
                  ],
                ),
              ),
              Spacer(),
              _finishButton(),
            ],
          )),
    );
  }

  Widget _tellUs() {
    return const Text(
      'Tell us about yourself',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
    );
  }

  Widget _genders(BuildContext context) {
    return BlocBuilder<GenderSelectionCubit, int>(builder: (context, state) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          genderTile(context, 1, 'Men'),
          const SizedBox(
            width: 20,
          ),
          genderTile(context, 2, 'Women'),
        ],
      );
    });
  }

  Expanded genderTile(BuildContext context, int genderIndex, String gender) {
    return Expanded(
        flex: 1,
        child: GestureDetector(
          onTap: () {
            context.read<GenderSelectionCubit>().selecteGender(genderIndex);
          },
          child: Container(
            height: 60,
            decoration: BoxDecoration(
                color: context.read<GenderSelectionCubit>().selectedIndex ==
                        genderIndex
                    ? AppColors.primary
                    : AppColors.secondbackground,
                borderRadius: BorderRadius.circular(30)),
            child: Center(
              child: Text(
                gender,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ));
  }

  _howOld() {
    return const Text(
      'How old are you?',
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    );
  }

  _age(BuildContext context) {
    return BlocBuilder<AgeSelectionCubit, String>(builder: (context, state) {
      return Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            color: AppColors.secondbackground,
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(state), const Icon(Icons.keyboard_arrow_down)],
        ),
      );
    });
  }

  _finishButton() {
    return Container(
      height: 100,
      color: AppColors.secondbackground,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: BasicAppButton(onPressed: () {}, Title: 'Finish'),
      ),
    );
  }
}
