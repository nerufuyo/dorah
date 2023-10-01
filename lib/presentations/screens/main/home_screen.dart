import 'package:cached_network_image/cached_network_image.dart';
import 'package:dorah/common/constant.dart';
import 'package:dorah/data/model/request_model.dart';
import 'package:dorah/data/repository/repository.dart';
import 'package:dorah/data/utils/format.dart';
import 'package:dorah/data/utils/greetings.dart';
import 'package:dorah/presentations/widgets/components.dart';
import 'package:dorah/styles/pallet.dart';
import 'package:dorah/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';

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
              _buildHeader(),
              customVerticalSpace(height: 16),
              SvgPicture.asset('lib/assets/images/imageBanner.svg'),
              customVerticalSpace(height: 16),
              customText(
                customTextValue: 'What Would You Do?',
                customTextStyle: heading2,
              ),
              customVerticalSpace(height: 16),
              _buildCategory(),
              customVerticalSpace(height: 16),
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
              customVerticalSpace(height: 16),
              _buildRequest(),
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder<List<Requests>> _buildRequest() {
    return FutureBuilder(
      future: Repository().getRequests(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;
          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            separatorBuilder: (context, index) =>
                customVerticalSpace(height: 16),
            shrinkWrap: true,
            itemCount: data!.length > 5 ? 5 : data.length,
            itemBuilder: (context, cardIndex) => InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: text40, width: .5),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: CachedNetworkImage(
                                errorListener: (value) =>
                                    const Icon(Icons.error, color: Colors.red),
                                placeholder: (context, url) => Image.asset(
                                    'lib/assets/images/profile.jpg'),
                                imageUrl: data[cardIndex].image,
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            customHorizontalSpace(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                customText(
                                    customTextValue: data[cardIndex].name,
                                    customTextStyle: heading5),
                                customVerticalSpace(height: 4),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(
                                    2,
                                    (index) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2),
                                      child: Row(
                                        children: [
                                          Icon(
                                            index == 0
                                                ? Iconsax.location5
                                                : Iconsax.clock5,
                                            size: 12,
                                            color: text40,
                                          ),
                                          customHorizontalSpace(width: 4),
                                          customText(
                                            customTextValue: index == 0
                                                ? data[cardIndex].location
                                                : formatDate(
                                                    data[cardIndex].createDate),
                                            customTextStyle: body3,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: primary60,
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(8),
                          child: customText(
                            customTextValue: data[cardIndex].bloodRhesus,
                            customTextStyle:
                                heading5.copyWith(color: secondary10),
                          ),
                        ),
                      ],
                    ),
                    customVerticalSpace(height: 24),
                    customButton(
                      context,
                      customButtonOnTap: () {},
                      customButtonTextValue: 'Donate Now',
                      customButtonRadius: BorderRadius.circular(8),
                      customButtonPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return customText(
            customTextValue: 'Error: ${snapshot.error}',
            customTextStyle: body2,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  GridView _buildCategory() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        childAspectRatio: 1.25,
      ),
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
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
    );
  }

  Row _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customText(
              customTextValue: getGreeting(),
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
          icon: SvgPicture.asset('lib/assets/icons/bell_outlined.svg'),
        ),
      ],
    );
  }
}
