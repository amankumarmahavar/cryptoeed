import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CryptoCard extends StatelessWidget {
  const CryptoCard(
      {required this.cryptoName,
      required this.cryptoSymbol,
      required this.cryptoValue,
      required this.shimmer});
  final String cryptoName;
  final String cryptoSymbol;
  final String currencySymbol = 'INR';
  final int cryptoValue;
  final bool shimmer;
  final Color baseColor = Colors.white;
  final Color highlightColor = Colors.blueGrey;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width * 0.90,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.20),
            )
          ],
          border: Border.all(color: Colors.white.withOpacity(0.1), width: 1.0),
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.5),
              Colors.white.withOpacity(0.2)
            ],
          ),
          borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Shimmer.fromColors(
          enabled: shimmer,
          highlightColor: highlightColor,
          baseColor: baseColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              SizedBox(
                child: Text(
                  cryptoName,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      letterSpacing: 2),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Current $cryptoName value',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.4),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  '1 $cryptoSymbol = $cryptoValue $currencySymbol',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
