import 'dart:ui';
import 'package:shimmer/shimmer.dart';
import 'package:cryptoeed/coin_data.dart';
import 'package:cryptoeed/component/bubble.dart';
import 'package:cryptoeed/component/crypto_card.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'dart:developer' as developer;

void main() {
  runApp(Cryptoeed());
}

class Cryptoeed extends StatefulWidget {
  @override
  State<Cryptoeed> createState() => _CryptoeedState();
}

class _CryptoeedState extends State<Cryptoeed> {
  String cryptoName = '';
  String cryptoSymbol = '';
  int cryptoValue = 0;
  bool shimmer = true;
  CoinData coinData = CoinData();

  @override
  void initState() {
    updateValues(0);
    super.initState();
  }

  void updateValues(int index) async {
    cryptoValue = 0;
    shimmer = true;
    developer.log(name: 'At Index', '$index');
    cryptoValue = await coinData.getCryptoValue(index);
    cryptoName = coinData.getCryptoName(index);
    cryptoSymbol = coinData.getCryptoSymbol(index);
    shimmer = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: Colors.blueGrey,
        child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Bubble(
                height: 200,
                width: 200,
                leftMargin: 170,
              ),
              Bubble(
                height: 100,
                width: 100,
                rightMargin: 230,
              ),
            ],
          ),
          Center(
            child: Swiper(
              itemCount: CoinData().totalAvailableCrypto(),
              onIndexChanged: (value) => updateValues(value),
              itemHeight: 200,
              itemWidth: MediaQuery.of(context).size.width * 0.90,
              itemBuilder: (context, index) => CryptoCard(
                cryptoName: cryptoName,
                cryptoSymbol: cryptoSymbol,
                cryptoValue: cryptoValue,
                shimmer: shimmer,
              ),
              layout: SwiperLayout.CUSTOM,
              customLayoutOption:
                  CustomLayoutOption(startIndex: -1, stateCount: 3)
                    ..addRotate([-0.40, 0.0, 0.40])
                    ..addTranslate([
                      Offset(-370.0, -40.0),
                      Offset(0.0, 0.0),
                      Offset(370.0, -40.0)
                    ]),
            ),
          ),
        ]),
      ),
    )));
  }
}
