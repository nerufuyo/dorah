import 'package:dorah/presentations/widgets/components.dart';
import 'package:dorah/styles/pallet.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Shimmer shimmerCustomAppBar() {
  return Shimmer.fromColors(
    baseColor: primary10,
    highlightColor: primary30,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            2,
            (index) => Container(
              height: 16,
              width: index == 0 ? 80 : 120,
              decoration: BoxDecoration(
                color: primary10,
                borderRadius: BorderRadius.circular(4),
              ),
              margin: const EdgeInsets.symmetric(vertical: 2),
            ),
          ),
        ),
        Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            color: primary10,
            shape: BoxShape.circle,
          ),
        ),
      ],
    ),
  );
}

Shimmer shimmerBanner() {
  return Shimmer.fromColors(
    baseColor: primary10,
    highlightColor: primary30,
    child: Container(
      height: 140,
      decoration: BoxDecoration(
        color: primary10,
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  );
}

Shimmer shimmerGridCategory() {
  return Shimmer.fromColors(
    baseColor: primary10,
    highlightColor: primary30,
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        childAspectRatio: 1.25,
      ),
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, categoryIndex) => Container(
        decoration: BoxDecoration(
          color: primary10,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(16),
      ),
    ),
  );
}

ListView shimmerListView() {
  return ListView.separated(
    separatorBuilder: (context, index) => customVerticalSpace(height: 8),
    shrinkWrap: true,
    itemCount: 5,
    itemBuilder: (context, snapshot) => Shimmer.fromColors(
      baseColor: primary10,
      highlightColor: primary30,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: primary10,
        ),
      ),
    ),
  );
}

GridView shimmerTabBar() {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      childAspectRatio: 2.5,
      crossAxisSpacing: 16,
    ),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shrinkWrap: true,
    itemCount: 3,
    itemBuilder: (context, index) => Shimmer.fromColors(
      baseColor: primary10,
      highlightColor: primary30,
      child: Container(
        decoration: BoxDecoration(
          color: primary10,
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    ),
  );
}

SizedBox shimmerHorizontalListView() {
  return SizedBox(
    height: 180,
    child: ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) => customHorizontalSpace(width: 16),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) => Shimmer.fromColors(
        baseColor: primary10,
        highlightColor: primary30,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 200,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: primary10,
              ),
            ),
            customVerticalSpace(height: 8),
            Container(
              width: 200,
              height: 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: primary10,
              ),
            ),
            customVerticalSpace(height: 8),
            Container(
              width: 100,
              height: 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: primary10,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

GridView customVerticalListView() {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.8,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
    ),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shrinkWrap: true,
    itemCount: 3,
    itemBuilder: (context, index) => Shimmer.fromColors(
        baseColor: primary10,
        highlightColor: primary30,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 200,
              height: 145,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: primary10,
              ),
            ),
            customVerticalSpace(height: 8),
            Container(
              width: 200,
              height: 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: primary10,
              ),
            ),
            customVerticalSpace(height: 8),
            Container(
              width: 100,
              height: 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: primary10,
              ),
            ),
          ],
        )),
  );
}
