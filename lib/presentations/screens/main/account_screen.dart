import 'package:dorah/common/constant.dart';
import 'package:dorah/presentations/screens/auth/authentication_screen.dart';
import 'package:dorah/presentations/widgets/components.dart';
import 'package:dorah/styles/pallet.dart';
import 'package:dorah/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});
  static const routeName = '/account-screen';

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: primary60,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          2,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 4,
                            ),
                            child: customText(
                              customTextValue:
                                  index == 0 ? 'John Doe' : '+62 8442 2244 876',
                              customTextStyle: index == 0 ? heading3 : body2,
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
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: customText(
                            customTextValue: 'B+',
                            customTextStyle:
                                heading3.copyWith(color: Colors.white),
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
                scrollDirection: Axis.vertical,
                separatorBuilder: (context, index) =>
                    customVerticalSpace(height: 4),
                shrinkWrap: true,
                itemCount: accountMainCategoryLists.length,
                itemBuilder: (context, index) => customSimpleListMenu(
                  onTapped: () {},
                  listImage: accountMainCategoryLists[index]['icon'],
                  listTitle: accountMainCategoryLists[index]['name'],
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
                scrollDirection: Axis.vertical,
                separatorBuilder: (context, index) =>
                    customVerticalSpace(height: 4),
                shrinkWrap: true,
                itemCount: accountMoreCategoryLists.length,
                itemBuilder: (context, index) => customSimpleListMenu(
                  onTapped: () {},
                  listImage: accountMoreCategoryLists[index]['icon'],
                  listTitle: accountMoreCategoryLists[index]['name'],
                ),
              ),
              customVerticalSpace(height: 20),
              customButton(
                context,
                customButtonOnTap: () => Navigator.pushReplacementNamed(
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
      ),
    );
  }
}
