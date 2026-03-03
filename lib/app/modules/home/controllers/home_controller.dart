import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final selectedCategoryIndex = 0.obs;
  final selectedClubTabIndex = 0.obs;
  final selectedNavIndex = 0.obs;

  final checkInDate = Rxn<DateTime>();
  final checkOutDate = Rxn<DateTime>();
  final travelers = 1.obs;
  final rooms = 1.obs;

  @override
  void onInit() {
    super.onInit();
    checkInDate.value = DateTime.now();
    checkOutDate.value = DateTime.now().add(const Duration(days: 2));
    travelers.value = 2;
    rooms.value = 1;
  }

  String get dateRangeText {
    final inDate = checkInDate.value;
    final outDate = checkOutDate.value;
    if (inDate == null || outDate == null) return 'Select dates';
    final months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
    return '${inDate.day} ${months[inDate.month - 1]} - ${outDate.day} ${months[outDate.month - 1]}';
  }

  String get travelersText => '$travelers Traveler${travelers.value > 1 ? 's' : ''} - $rooms room${rooms.value > 1 ? 's' : ''}';

  Future<void> pickDateRange(BuildContext context) async {
    final now = DateTime.now();
    final result = await showDateRangePicker(
      context: context,
      firstDate: now,
      lastDate: now.add(const Duration(days: 365)),
      initialDateRange: DateTimeRange(
        start: checkInDate.value ?? now,
        end: checkOutDate.value ?? now.add(const Duration(days: 2)),
      ),
    );
    if (result != null) {
      checkInDate.value = result.start;
      checkOutDate.value = result.end;
    }
  }

  void showTravelersPicker(BuildContext context) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Travelers', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  Row(
                    children: [
                      IconButton.filled(
                        onPressed: travelers.value > 1 ? () => travelers.value-- : null,
                        icon: const Icon(Icons.remove, size: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text('${travelers.value}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                      ),
                      IconButton.filled(
                        onPressed: () => travelers.value++,
                        icon: const Icon(Icons.add, size: 20),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Rooms', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  Row(
                    children: [
                      IconButton.filled(
                        onPressed: rooms.value > 1 ? () => rooms.value-- : null,
                        icon: const Icon(Icons.remove, size: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text('${rooms.value}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                      ),
                      IconButton.filled(
                        onPressed: () => rooms.value++,
                        icon: const Icon(Icons.add, size: 20),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.back(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4757E4),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Done', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }

  void selectCategory(int index) {
    selectedCategoryIndex.value = index;
  }

  void selectClubTab(int index) {
    selectedClubTabIndex.value = index;
  }

  void selectNavTab(int index) {
    selectedNavIndex.value = index;
  }
}
