import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RecentLoansLoading extends StatelessWidget {
  const RecentLoansLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 6),
          _buildLoansList(),
          const SizedBox(height: 6),
          _buildLoansList(),
          const SizedBox(height: 6),
          _buildLoansList(),
        ],
      ),
    );
  }

  Widget _buildLoansList() {
    return Container(
      height: 230,
      margin: const EdgeInsets.only(bottom: 24.0, left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 20,
                width: 200,
                color: Colors.white,
              ),
              const Spacer(),
              Container(
                height: 20,
                width: 50,
                color: Colors.white,
                margin: const EdgeInsets.only(right: 16),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (ctx, idx) => const SizedBox(width: 12),
              itemBuilder: (ctx, idx) {
                return Card(
                  elevation: 6.0,
                  color: Colors.white,
                  child: Container(
                    height: 80,
                    width: 280,
                    color: Colors.white,
                    child: Container(
                      width: 120,
                      height: 20,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
