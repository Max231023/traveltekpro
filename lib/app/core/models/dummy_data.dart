import 'flash_deal_card_model.dart';
import 'life_exp_card_model.dart';
import 'trending_card_model.dart';

class DummyData {
  DummyData._();

  static const String cardImageUrl =
      'https://media.cntraveler.com/photos/58b463fe07cfb872af460fd6/16:9/w_2580%2Cc_limit/poolside-03-Burj-Al-Arab-Terrace-Infinity-Pool-cr-courtesy.jpg';
  static const String lifeExpImageUrl =
      'https://media.istockphoto.com/id/2167016228/photo/msc-poesia-cruise-ship.jpg?s=612x612&w=0&k=20&c=0HNAsfJUJ1ivtPTZAqdoJwG9cJyazCivwcgx_itCqqg=';
  static const String flashDealImageUrl =
      'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=600';

  static final List<TrendingCardModel> trendingCards = [
    const TrendingCardModel(
      imageUrl: cardImageUrl,
      tag: 'Use Maximum Loyalty Points',
      title: 'Bali Seascape Beach Club-Rental',
      location: 'Candidasa, Indonesia',
      rating: 4.5,
      hasLoyaltyBadge: true,
    ),
    const TrendingCardModel(
      imageUrl: 'https://images.unsplash.com/photo-1582719508461-905c673771fd?w=600',
      tag: 'Member Exclusive',
      title: 'The Ritz-Carlton Bali',
      location: 'Nusa Dua, Indonesia',
      rating: 4.9,
      hasLoyaltyBadge: true,
    ),
    const TrendingCardModel(
      imageUrl: 'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=600',
      tag: 'Limited Time Offer',
      title: 'Anantara Uluwatu Resort',
      location: 'Uluwatu, Bali',
      rating: 4.7,
      hasLoyaltyBadge: false,
    ),
    const TrendingCardModel(
      imageUrl: 'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=600',
      tag: 'Use Maximum Loyalty Points',
      title: 'W Bali Seminyak',
      location: 'Seminyak, Indonesia',
      rating: 4.6,
      hasLoyaltyBadge: true,
    ),
  ];

  static final List<LifeExpCardModel> lifeExpCards = [
    const LifeExpCardModel(
      imageUrl: lifeExpImageUrl,
      title: 'Mediterranean Cruise Experience',
      startDate: 'Starts 2nd Nov 2025',
      duration: '8 Days 7 Nights',
      price: 699,
    ),
    const LifeExpCardModel(
      imageUrl: 'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=600',
      title: 'Caribbean Island Hopping',
      startDate: 'Starts 15th Dec 2025',
      duration: '10 Days 9 Nights',
      price: 1299,
    ),
    const LifeExpCardModel(
      imageUrl: 'https://images.unsplash.com/photo-1567894340315-735d7c361db0?w=600',
      title: 'Alaskan Glacier Expedition',
      startDate: 'Starts 20th Jun 2025',
      duration: '7 Days 6 Nights',
      price: 899,
    ),
  ];

  static final List<FlashDealCardModel> flashDealCards = [
    const FlashDealCardModel(
      imageUrl: flashDealImageUrl,
      dealDates: 'Deals from 07/09/2025 to 07/31/2025',
      title: 'Millennium Plaza Downtown Hotel, Dubai',
      location: 'Dubai, United Arab Emirates',
      rating: 4.5,
    ),
    const FlashDealCardModel(
      imageUrl: 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=600',
      dealDates: 'Deals from 01/10/2025 to 15/10/2025',
      title: 'Burj Al Arab Jumeirah',
      location: 'Dubai, United Arab Emirates',
      rating: 4.9,
    ),
    const FlashDealCardModel(
      imageUrl: 'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?w=600',
      dealDates: 'Deals from 20/11/2025 to 05/12/2025',
      title: 'Atlantis The Palm',
      location: 'Dubai, United Arab Emirates',
      rating: 4.7,
    ),
  ];
}
