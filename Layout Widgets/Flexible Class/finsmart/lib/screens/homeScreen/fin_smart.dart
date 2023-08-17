import 'package:finsmart/screens/homeScreen/components/header/promotion_card_list.dart';
import 'package:flutter/material.dart';
import 'components/footer/footer.dart';
import 'components/header/custom_card_list.dart';
import 'components/header/custom_search_bar.dart';
import 'components/header/wallet_card_list.dart';
import 'components/header/welcome_card.dart';
import 'custom_appbar.dart';

class FinSmartView extends StatefulWidget {
  const FinSmartView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FinSmartViewState createState() => _FinSmartViewState();
}

class _FinSmartViewState extends State<FinSmartView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          const CustomSearchBar(),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  CustomCardList(),
                  WelcomeCard(
                    name: 'Atakan',
                    onPressed: () {
                      // Kampanyaları Gör düğmesine tıklandığında yapılacak işlemler
                    },
                  ),
                  const WalletCardList(),
                  PromotionCardList(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
