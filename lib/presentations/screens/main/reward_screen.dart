import 'package:cached_network_image/cached_network_image.dart';
import 'package:dorah/common/constant.dart';
import 'package:dorah/data/model/reward_model.dart';
import 'package:dorah/data/repository/repository.dart';
import 'package:dorah/presentations/widgets/components.dart';
import 'package:dorah/styles/pallet.dart';
import 'package:dorah/styles/typography.dart';
import 'package:flutter/material.dart';

class RewardScreen extends StatefulWidget {
  const RewardScreen({super.key});
  static const routeName = '/reward-screen';

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  int currentPoint = 271;
  int totalPoint = 500;

  @override
  void initState() {
    tabController = TabController(
      length: rewardCategoryLists.length,
      vsync: this,
      initialIndex: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customSimpleAppBar(
        appBarTitle: 'Rewards',
        isInfoShow: true,
        ontapped: () {},
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTabBar(),
              customVerticalSpace(height: 16),
              _buildPointCard(context),
              customVerticalSpace(height: 8),
              _buildTabBarView(),
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder<List<Rewards>> _buildTabBarView() {
    return FutureBuilder(
      future: Repository().getRewards(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;
          return Expanded(
            child: TabBarView(
              controller: tabController,
              children: List.generate(
                3,
                (index) {
                  final category = rewardCategoryLists[index];
                  final filteredRewards = data!
                      .where((rewards) => rewards.category == category)
                      .toList();

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: customText(
                          customTextValue: 'Recommended For You',
                          customTextStyle: heading2,
                        ),
                      ),
                      _buildHorizontalReward(filteredRewards),
                      customVerticalSpace(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: customText(
                          customTextValue: 'Favorite Rewards',
                          customTextStyle: heading2,
                        ),
                      ),
                      Flexible(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.8,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          itemCount: filteredRewards.length - 5,
                          itemBuilder: (BuildContext context, int index) {
                            final actualIndex = index + 5;

                            if (actualIndex < filteredRewards.length) {
                              final item = filteredRewards[actualIndex];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: CachedNetworkImage(
                                      width: 200,
                                      height: 145,
                                      fit: BoxFit.cover,
                                      imageUrl: item.imageUrl,
                                      placeholder: (context, url) =>
                                          const Center(
                                        child: CircularProgressIndicator(
                                            color: primary60),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  ),
                                  customVerticalSpace(height: 8),
                                  customText(
                                    customTextValue: item.title,
                                    customTextStyle: body2,
                                    customMaxLines: 2,
                                    customTextOverflow: TextOverflow.ellipsis,
                                  ),
                                  customVerticalSpace(height: 8),
                                  customText(
                                    customTextValue: '${item.points} Points',
                                    customTextStyle: heading5.copyWith(
                                      color: item.points > 400
                                          ? primary60
                                          : text60,
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: customText(
              customTextValue: 'Error: ${snapshot.error}',
              customTextStyle: body2,
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: primary60,
            ),
          );
        }
      },
    );
  }

  SizedBox _buildHorizontalReward(List<Rewards> filteredRewards) {
    return SizedBox(
      height: 180,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => customHorizontalSpace(width: 16),
        shrinkWrap: true,
        itemCount: filteredRewards.length > 5 ? 5 : filteredRewards.length,
        itemBuilder: (context, index) {
          final rewards = filteredRewards[index];
          return Container(
            width: 200,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    width: 200,
                    height: 120,
                    fit: BoxFit.cover,
                    imageUrl: rewards.imageUrl,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(color: primary60),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                customVerticalSpace(height: 8),
                customText(
                  customTextValue: rewards.title,
                  customTextStyle: body2,
                  customMaxLines: 2,
                  customTextOverflow: TextOverflow.ellipsis,
                ),
                customVerticalSpace(height: 8),
                customText(
                  customTextValue: '${rewards.points} Points',
                  customTextStyle: heading5.copyWith(
                    color: rewards.points > 400 ? primary60 : text60,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Container _buildPointCard(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const RadialGradient(
          center: Alignment.topRight,
          colors: [primary30, primary40, primary60, primary60],
          radius: 1.25,
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          customText(
            customTextValue: 'Your Points',
            customTextStyle: body2.copyWith(color: text0),
          ),
          customVerticalSpace(height: 8),
          customText(
            customTextValue: '$currentPoint Points',
            customTextStyle: heading2.copyWith(color: text0),
          ),
          customVerticalSpace(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: customText(
              customTextValue: '$totalPoint',
              customTextStyle: heading5.copyWith(color: text0),
            ),
          ),
          LinearProgressIndicator(
            value: currentPoint / totalPoint,
            backgroundColor: text20,
            borderRadius: BorderRadius.circular(8),
            color: text0,
          ),
          customVerticalSpace(height: 8),
          RichText(
            text: TextSpan(
              text: 'Collect ',
              style: body2.copyWith(color: text0),
              children: [
                TextSpan(
                  text: '${totalPoint - currentPoint} points',
                  style: body2.copyWith(
                    color: text0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ' to become a ',
                  style: body2.copyWith(color: text0),
                ),
                TextSpan(
                  text: 'Super Hero',
                  style: body2.copyWith(
                    color: text0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding _buildTabBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TabBar(
        controller: tabController,
        splashBorderRadius: BorderRadius.circular(24),
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: primary60,
        ),
        labelPadding: const EdgeInsets.symmetric(horizontal: 8),
        indicatorPadding: const EdgeInsets.symmetric(horizontal: 8),
        labelColor: Colors.white,
        unselectedLabelColor: primary60,
        tabs: List.generate(
          rewardCategoryLists.length,
          (index) => Tab(
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: primary60),
              ),
              child: Center(
                child: customText(
                  customTextValue: rewardCategoryLists[index],
                  customTextStyle: heading5,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
