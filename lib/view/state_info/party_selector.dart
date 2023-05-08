import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/init/provider/state_provider.dart';

class PartySelector extends StatefulWidget {
  const PartySelector({super.key});

  @override
  State<PartySelector> createState() => _PartySelectorState();
}

class _PartySelectorState extends State<PartySelector> {
  @override
  Widget build(BuildContext context) {
    return Consumer<StateProvider>(
      builder: (context, provider, child) {
        return Container();
      },
    );
  }
}
