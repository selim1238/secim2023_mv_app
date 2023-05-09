import 'package:flutter/material.dart';

class DeputyCardStyler {
  LinearGradient getPartyGradient(String party) {
    switch (party) {
      case "AKP":
        return LinearGradient(
            colors: [
              Colors.orange.withOpacity(0.9),
              Colors.orange.withOpacity(0.7),
              Colors.transparent
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.2, 0.4, 1.0]);
      case "CHP":
        return LinearGradient(
            colors: [
              Color(0xFFF90000).withOpacity(0.9),
              Color(0xFFF90000).withOpacity(0.7),
              Colors.transparent
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.2, 0.4, 1.0]);
      case "MHP":
        return LinearGradient(
            colors: [
              Color(0xFFFE6D6D).withOpacity(0.9),
              Color(0xFFFE6D6D).withOpacity(0.7),
              Colors.transparent
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.2, 0.4, 1.0]);
      case "IYI":
        return LinearGradient(
            colors: [
              Color(0xFF32B5FF).withOpacity(0.9),
              Color(0xFF32B5FF).withOpacity(0.7),
              Colors.transparent
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.2, 0.4, 1.0]);
      case "MEMLEKET":
        return LinearGradient(
            colors: [
              Color(0xFF0D48A1).withOpacity(0.9),
              Color(0xFF0D48A1).withOpacity(0.7),
              Colors.transparent
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.2, 0.4, 1.0]);
      case "TIP":
        return LinearGradient(
            colors: [
              Color(0xFFFF002E).withOpacity(0.9),
              Color(0xFFFF002E).withOpacity(0.7),
              Colors.transparent
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.2, 0.4, 1.0]);
      case "YSP":
        return LinearGradient(
            colors: [
              Color(0xFF0FB04F).withOpacity(0.9),
              Color(0xFF0FB04F).withOpacity(0.7),
              Colors.transparent
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.2, 0.4, 1.0]);
      default:
        return LinearGradient(
            colors: [
              Color(0xFF32B5FF).withOpacity(0.9),
              Color(0xFF32B5FF).withOpacity(0.7),
              Colors.transparent
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.2, 0.4, 1.0]);
    }
  }
}
