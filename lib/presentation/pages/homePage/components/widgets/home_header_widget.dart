import 'package:flutter/material.dart';
import 'package:movieapp/core/constants/app_colors.dart';
import 'package:movieapp/presentation/components/widgets/custom_image_network_widget.dart';

/// Home page header with logo, search, and user avatar
class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundDark.withValues(alpha: 0.95),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.movie,
                  color: AppColors.textColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'ReelDiary',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 24,
                  color: AppColors.textMuted,
                ),
                color: AppColors.textMuted,
              ),
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.surfaceDark,
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryColor.withValues(alpha: 0.2),
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: const ClipOval(
                  child: CustomImageNetworkWidget(
                    photoUrl:
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuAyJpSMIioQW9hfxq4VyX9dhgeTf4YXcsNzGmNs7_u3t5jCiyYwNIUlpk8_L0X4X9jWRjKFv-kKkj3mDXtU64F5FKl5E4FEVqvalICxxR0LO9aj1ttDN5Eh-kCLIciDBxbWFacDZj0FrV4VxUxK_aGOgPR7m2iQqPvvjm_KJn8m_6AZBVfIzHkv3AVFNvM4CdQLGSeSHV9AaX5vZEfUC5_ej8JfgyA0foR-zZHUg3ApUJ3SCmV7TcVwLSB1DVr1hHZG5lQboWN_9rA',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
