import 'package:apppp/feature/home/data/models/offer_config_model.dart';
import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  final OfferConfigModel offer;
  const OfferCard({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.72,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(offer.imageUrl, fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    Container(color: const Color(0xFF2A1A0A))),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                ),
              ),
            ),
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color(0xFFE07B2A),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(offer.badge,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w700,
                    )),
              ),
            ),
            Positioned(
              bottom: 14,
              right: 14,
              left: 14,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(offer.title,
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Cairo',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      )),
                  const SizedBox(height: 3),
                  Text(offer.subtitle,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontFamily: 'Cairo',
                        fontSize: 12,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}