import 'package:dorah/common/constant.dart';
import 'package:dorah/data/repository/repository.dart';
import 'package:dorah/presentations/screens/auth/authentication_screen.dart';
import 'package:dorah/presentations/widgets/components.dart';
import 'package:dorah/presentations/widgets/shimmer.dart';
import 'package:dorah/styles/pallet.dart';
import 'package:dorah/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key, required this.userId});
  static const routeName = '/account-screen';
  final String userId;

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isShimmer = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 1), () => setState(() => isShimmer = false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customSimpleAppBar(appBarTitle: 'Account'),
      body: FutureBuilder(
        future: Repository().getUserById(id: widget.userId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: isShimmer
                    ? _buildShimmer()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(60),
                                    child: Image.asset(
                                      snapshot.data!.image,
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: List.generate(
                                      2,
                                      (index) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 4,
                                        ),
                                        child: customText(
                                          customTextValue: index == 0
                                              ? snapshot.data!.name
                                              : snapshot.data!.phone,
                                          customTextStyle:
                                              index == 0 ? heading3 : body2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Stack(
                                children: [
                                  SvgPicture.asset(
                                    'lib/assets/icons/blood_filled.svg',
                                    width: 52,
                                    height: 52,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    heightFactor: 2.5,
                                    // Add Condition
                                    widthFactor: 1.5,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      child: customText(
                                        customTextValue:
                                            snapshot.data!.bloodType,
                                        customTextStyle: heading3.copyWith(
                                            color: Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          customVerticalSpace(height: 20),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: customText(
                              customTextValue: 'Account',
                              customTextStyle: heading2,
                            ),
                          ),
                          ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            separatorBuilder: (context, index) =>
                                customVerticalSpace(height: 4),
                            shrinkWrap: true,
                            itemCount: accountMainCategoryLists.length,
                            itemBuilder: (context, index) =>
                                customSimpleListMenu(
                              onTapped: () {},
                              listImage: accountMainCategoryLists[index]
                                  ['icon'],
                              listTitle: accountMainCategoryLists[index]
                                  ['name'],
                            ),
                          ),
                          customVerticalSpace(height: 20),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: customText(
                              customTextValue: 'More',
                              customTextStyle: heading2,
                            ),
                          ),
                          ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            separatorBuilder: (context, index) =>
                                customVerticalSpace(height: 4),
                            shrinkWrap: true,
                            itemCount: accountMoreCategoryLists.length,
                            itemBuilder: (context, index) =>
                                customSimpleListMenu(
                              onTapped: () {},
                              listImage: accountMoreCategoryLists[index]
                                  ['icon'],
                              listTitle: accountMoreCategoryLists[index]
                                  ['name'],
                            ),
                          ),
                          customVerticalSpace(height: 20),
                          customButton(
                            context,
                            customButtonOnTap: () =>
                                Navigator.pushReplacementNamed(
                              context,
                              AuthenticationScreen.routeName,
                            ),
                            customButtonTextValue: 'Log Out',
                            customButtonBorderColor: primary60,
                            customButtonTextColor: primary60,
                            customButtonColor: Colors.white,
                          ),
                        ],
                      ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  SingleChildScrollView _buildShimmer() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          shimmerHeaderWithBloodType(),
          customVerticalSpace(height: 16),
          customText(
            customTextValue: 'Account',
            customTextStyle: heading2,
          ),
          customVerticalSpace(height: 16),
          shimmerListView(),
          customVerticalSpace(height: 16),
          customText(
            customTextValue: 'More',
            customTextStyle: heading2,
          ),
          customVerticalSpace(height: 16),
          shimmerListView(),
        ],
      ),
    );
  }
}
