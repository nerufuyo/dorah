import 'package:dorah/common/constant.dart';
import 'package:dorah/presentations/widgets/components.dart';
import 'package:dorah/styles/pallet.dart';
import 'package:dorah/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customText(
                        customTextValue: 'Good Morning',
                        customTextStyle: body2,
                      ),
                      customVerticalSpace(height: 4),
                      customText(
                        customTextValue: 'Alucard Parker',
                        customTextStyle: heading4,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_none_outlined,
                      size: 32,
                    ),
                  ),
                ],
              ),
              customVerticalSpace(height: 16),
              SvgPicture.asset('lib/assets/images/imageBanner.svg'),
              customVerticalSpace(height: 24),
              customText(
                customTextValue: 'What Would You Do?',
                customTextStyle: heading2,
              ),
              customVerticalSpace(height: 16),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.25,
                ),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: categoryLists.length,
                itemBuilder: (context, categoryIndex) => InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: primary60),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          categoryLists[categoryIndex]['icon'],
                          height: 50,
                          width: 50,
                        ),
                        customVerticalSpace(height: 8),
                        customText(
                          customTextValue: categoryLists[categoryIndex]['name'],
                          customTextStyle: body2.copyWith(color: primary60),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              customVerticalSpace(height: 24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customText(
                    customTextValue: 'Help Us',
                    customTextStyle: heading2,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: customText(
                        customTextValue: 'View More',
                        customTextStyle: body2.copyWith(color: secondary60)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
