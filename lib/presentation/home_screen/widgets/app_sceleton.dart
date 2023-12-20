import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MySkeletonLoadingWidget extends StatelessWidget {
  const MySkeletonLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.cyan[100]!,
      child: ListView.builder(
        itemCount: 5, // You can adjust the item count as needed
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              radius: 30,
            ),
            title: Container(
              height: 16,
              width: 100,
              color: Colors.white,
            ),
            subtitle: Container(
              height: 12,
              width: 150,
              color: Colors.white,
            ),
          );
        },
      ),
    );
  }
}
