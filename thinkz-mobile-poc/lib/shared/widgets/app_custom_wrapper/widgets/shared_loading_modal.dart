import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thinkz/shared/providers/loading_provider.dart';

class SharedLoadingModal extends StatelessWidget {
  const SharedLoadingModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoadingProvider provider = Provider.of<LoadingProvider>(context, listen: true);
    if (provider.isLoading == false) return const SizedBox();
    return Container(
      color: Colors.white.withOpacity(0.7),
      child: const Center(
        child: SizedBox(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(
            color: Colors.red,
            strokeWidth: 4.5,
          ),
        ),
      ),
    );
  }
}
