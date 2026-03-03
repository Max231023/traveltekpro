import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/models/dummy_data.dart';
import '../../../core/models/flash_deal_card_model.dart';
import '../../../core/models/life_exp_card_model.dart';
import '../../../core/models/trending_card_model.dart';
import '../../../core/theme/app_theme.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  static double horizontalPadding(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return w > 600 ? 24 : 16;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.cardBackground,
        extendBodyBehindAppBar: controller.selectedNavIndex.value == 0,
        appBar: controller.selectedNavIndex.value == 0
            ? buildAppBar()
            : buildSimpleAppBar(),
      body: IndexedStack(
          index: controller.selectedNavIndex.value,
          children: [
            buildHomePage(),
            buildMyTripsPage(),
            buildWishlistPage(),
            buildAccountPage(),
          ],
        ),
      bottomNavigationBar: buildBottomNav(),
      ),
    );
  }

  PreferredSize buildSimpleAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          ['Home', 'My Trips', 'Wishlist', 'Account']
              [controller.selectedNavIndex.value],
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
      ),
    );
  }

  Widget buildHomePage() {
    return SafeArea(
      top: false,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 120),
            buildCategoryRow(),
            buildSearchForm(),
            buildRecentSearch(),
            buildHotTrending(),
            buildLifeExperience(),
            buildFlashDeals(),
            buildPromoBanners(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget buildMyTripsPage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.luggage, size: 64, color: Colors.grey.shade400),
          const SizedBox(height: 16),
          Text(
            'My Trips',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildWishlistPage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/heart.svg',
            width: 64,
            height: 64,
            colorFilter: ColorFilter.mode(
              Colors.grey.shade400,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Wishlist',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAccountPage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/user.svg',
            width: 64,
            height: 64,
            colorFilter: ColorFilter.mode(
              Colors.grey.shade400,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Account',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-0.97, 0.26),
              end: Alignment(0.97, -0.26),
              colors: [AppColors.gradientStart, AppColors.gradientEndAppBar],
            ),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                right: -10,
                bottom: -20,
                child: Opacity(
                  opacity: 0.25,
                  child: Image.asset(
                    'assets/palm_trees.png',
                    height: 90,
                    width: 200,
                    fit: BoxFit.fill,
                    colorBlendMode: BlendMode.modulate,
                    errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCategoryRow() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding(Get.context!)),
      child: Obx(
        () => Row(
          children: [
            Expanded(
              child: categoryChip(0, 'assets/icons/hotel.svg', 'Hotels'),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: categoryChip(1, 'assets/icons/plane.svg', 'Flights'),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: categoryChip(
                2,
                'assets/icons/tourism.svg',
                'Life Experience®',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(child: categoryChip(3, 'assets/icons/taxi.svg', 'Cars')),
            const SizedBox(width: 8),
            Expanded(
              child: categoryChip(4, 'assets/icons/yacht.svg', 'Cruises'),
            ),
          ],
        ),
      ),
    );
  }

  Widget categoryChip(int index, String svgAsset, String label) {
    final isSelected = controller.selectedCategoryIndex.value == index;
    return GestureDetector(
      onTap: () => controller.selectCategory(index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border:
              isSelected
                  ? Border.all(color: Colors.grey.shade500, width: 1)
                  : null,
          boxShadow:
              isSelected
                  ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                  : null,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              svgAsset,
              width: 26,
              height: 26,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: const TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSearchForm() {
    final h = horizontalPadding(Get.context!);
    return Padding(
      padding: EdgeInsets.fromLTRB(h, 20, h, 16),
      child: Column(
        children: [
          searchField(
            Icons.location_on,
            null,
            'Destination',
            'Dubai, United Arab Emirates',
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () => controller.pickDateRange(Get.context!),
            child: Obx(
              () => searchField(
                Icons.calendar_today,
                null,
                'Date',
                controller.dateRangeText,
              ),
            ),
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () => controller.showTravelersPicker(Get.context!),
            child: Obx(
              () => searchField(
                null,
                'assets/icons/user.svg',
                'Travelers',
                controller.travelersText,
              ),
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(12),
            child: Ink(
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: AppConstants.gradientBegin,
                  end: AppConstants.gradientEnd,
                  colors: [
                    AppColors.gradientStart,
                    AppColors.gradientEndSplash,
                  ],
                  stops: AppConstants.gradientStops,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text('Search', style: AppStyles.searchButton),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget searchField(
    IconData? icon,
    String? svgAsset,
    String label,
    String value,
  ) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade500),
      ),
      child: Row(
        children: [
          if (icon != null) Icon(icon, size: 22, color: Colors.black87),
          if (svgAsset != null)
            SvgPicture.asset(
              svgAsset,
              width: 22,
              height: 22,
              colorFilter: const ColorFilter.mode(
                Colors.black87,
                BlendMode.srcIn,
              ),
            ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppStyles.searchFieldLabel),
                const SizedBox(height: 2),
                Text(value, style: AppStyles.searchFieldValue),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRecentSearch() {
    final h = horizontalPadding(Get.context!);
    return Padding(
      padding: EdgeInsets.fromLTRB(h, 8, h, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recent Search',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: recentCard(
                  'HOTELS',
                  AppColors.gradientEndAppBar,
                  'Dubai',
                  '12 Aug - 25 Aug',
                  '1 Room • 2 travellers',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: recentCard(
                  'FLIGHTS',
                  AppColors.gradientEndAppBar,
                  'Dubai.. to Delhi (DEL)',
                  '12 Aug - 25 Aug',
                  '2 travellers',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget recentCard(
    String category,
    Color categoryColor,
    String title,
    String dates,
    String details,
  ) {
    return Container(
      height: 125,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: categoryColor,
            ),
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            dates,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 2),
          Text(
            details,
            style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }

  Widget buildHotTrending() {
    final h = horizontalPadding(Get.context!);
    return Padding(
      padding: EdgeInsets.fromLTRB(h, 0, h, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Hot & Trending',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Text(
            'We bring exclusive offers for The Club members, daily.',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 14),
          Obx(
            () => Row(
              children: [
                clubTab(0, 'The Club Select'),
                const SizedBox(width: 28),
                clubTab(1, 'The Club Hotel'),
              ],
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 265,
            child: RepaintBoundary(
              child: ListView.builder(
                addAutomaticKeepAlives: false,
                scrollDirection: Axis.horizontal,
                itemCount: DummyData.trendingCards.length,
                itemBuilder: (context, i) => trendingCard(DummyData.trendingCards[i]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget clubTab(int index, String label) {
    final isSelected = controller.selectedClubTabIndex.value == index;
    return GestureDetector(
      onTap: () => controller.selectClubTab(index),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isSelected ? AppColors.vibrantBlue : Colors.grey,
            ),
          ),
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 4),
              height: 2,
              width: 90,
              color: AppColors.vibrantBlue,
            ),
        ],
      ),
    );
  }

  Widget trendingCard(TrendingCardModel item) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        border: Border.all(color: Colors.grey.shade300),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: SizedBox(
              height: 120,
              width: double.infinity,
              child: Image.network(
                item.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 44, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.tagPurple,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            item.tag,
                            style: const TextStyle(
                              fontSize: 10,
                              color: AppColors.vibrantBlue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.location,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(Icons.star, size: 16, color: Colors.amber),
                        Text(
                          ' ${item.rating}',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (item.hasLoyaltyBadge)
                Positioned(
                  right: 8,
                  bottom: 8,
                  child: Image.asset(
                    'assets/icons/loyalty_points_stacked.png',
                    width: 40,
                    height: 40,
                    fit: BoxFit.contain,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildLifeExperience() {
    final h = horizontalPadding(Get.context!);
    return Padding(
      padding: EdgeInsets.fromLTRB(h, 0, h, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Life Experience®',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Discover the magic of a Life Experience.',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 280,
            child: RepaintBoundary(
              child: ListView.builder(
                addAutomaticKeepAlives: false,
                scrollDirection: Axis.horizontal,
                itemCount: DummyData.lifeExpCards.length,
                itemBuilder: (context, i) => lifeExpCard(DummyData.lifeExpCards[i]),
              ),
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.gradientEndAppBar,
                side: const BorderSide(
                  color: AppColors.gradientEndAppBar,
                  width: 1,
                ),
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Explore more'),
            ),
          ),
        ],
      ),
    );
  }

  Widget lifeExpCard(LifeExpCardModel item) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 130,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
              image: DecorationImage(
                image: NetworkImage(item.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 14,
                      color: Colors.amber.shade700,
                    ),
                    Text(
                      ' ${item.startDate}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  item.duration,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${item.price}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFlashDeals() {
    final h = horizontalPadding(Get.context!);
    return Padding(
      padding: EdgeInsets.fromLTRB(h, 0, h, 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset('assets/flash_deal_bg.png', fit: BoxFit.cover),
            ),
            Positioned.fill(
              child: Container(color: Colors.black.withOpacity(0.77)),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Flash Deals',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Every day, we bring you 3 world-class unbeatable hotel offers!',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 320,
                    child: RepaintBoundary(
                      child: ListView.builder(
                        addAutomaticKeepAlives: false,
                        scrollDirection: Axis.horizontal,
                        itemCount: DummyData.flashDealCards.length,
                        itemBuilder: (context, i) => flashDealCard(DummyData.flashDealCards[i]),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      DummyData.flashDealCards.length,
                      (i) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        width: i == 0 ? 10 : 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color:
                              i == 0
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.3),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget flashDealCard(FlashDealCardModel item) {
    return Container(
      width: 220,
      margin: const EdgeInsets.only(right: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 2, color: Colors.transparent),
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: SizedBox(
                    height: 120,
                    width: double.infinity,
                    child: Image.network(
                      item.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder:
                          (_, __, ___) => Container(
                            color: Colors.grey.shade700,
                            height: 140,
                          ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      4,
                      (i) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        width: i == 0 ? 8 : 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color:
                              i == 0
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.flashDealOverlay.withOpacity(0.55),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              item.dealDates,
              style: const TextStyle(fontSize: 11, color: Colors.white),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  item.location,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.star, size: 16, color: Colors.amber),
                    Text(
                      ' ${item.rating}',
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(10),
                    child: Ink(
                      width: 90,
                      height: 30,

                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            AppColors.searchGradientStart,
                            AppColors.headerGradientEnd,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'Book now!',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPromoBanners() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding(Get.context!)),
      child: Column(
        children: [visaBanner(), const SizedBox(height: 14), esimBanner()],
      ),
    );
  }

  Widget visaBanner() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AppConstants.gradientBegin,
          end: AppConstants.gradientEnd,
          colors: [
            AppColors.gradientStart.withOpacity(0.08),
            AppColors.gradientEndAppBar.withOpacity(0.08),
          ],
          stops: AppConstants.gradientStops,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/credit_card.svg',
            width: 50,
            height: 50,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Apply for your',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const Text(
                  'Travel visa today',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.gradientEndAppBar,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text('Get Started'),
          ),
        ],
      ),
    );
  }

  Widget esimBanner() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.esimBannerBg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'GET YOUR',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.green.shade800,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  'eSIM',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15,5,25,0),
            child: Image.asset(
              'assets/device/iphone_13_portrait.png',
              width: 70,
              height: 90,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          height: 70,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Obx(() => navItemSvg(
                        'assets/icons/home.svg',
                        'Home',
                        0,
                      )),
                  Obx(() => navItemSvg(
                        'assets/icons/frame.svg',
                        'My Trips',
                        1,
                      )),
                  const SizedBox(width: 60),
                  Obx(() => navItemSvg(
                        'assets/icons/heart.svg',
                        'Wishlist',
                        2,
                      )),
                  Obx(() => navItemSvg(
                        'assets/icons/user.svg',
                        'Account',
                        3,
                      )),
                ],
              ),
              Positioned(top: -20, child: centerFab()),
            ],
          ),
        ),
      ),
    );
  }


  Widget navItemSvg(String svgAsset, String label, int index) {
    final selected = controller.selectedNavIndex.value == index;
    return GestureDetector(
      onTap: () => controller.selectNavTab(index),
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              svgAsset,
              width: 26,
              height: 26,
              colorFilter: ColorFilter.mode(
                selected ? AppColors.gradientEndAppBar : Colors.grey.shade600,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                color: selected
                    ? AppColors.gradientEndAppBar
                    : Colors.grey.shade600,
              ),
            ),
            if (selected)
              Container(
                margin: const EdgeInsets.only(top: 4),
                height: 2,
                width: 24,
                color: AppColors.gradientEndAppBar,
              ),
          ],
        ),
      ),
    );
  }

  Widget centerFab() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryPurple.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Image.asset(
          'assets/icons/primary_button.png',
          width: 60,
          height: 60,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
