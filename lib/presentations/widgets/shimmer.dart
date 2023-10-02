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
