import 'package:flutter/material.dart';
import 'package:helping_hands/Features/PostReport/presentation/widgets/post_button.dart';
import 'package:helping_hands/Features/PostReport/presentation/widgets/post_report_body.dart';
import 'package:helping_hands/generated/l10n.dart';

class PostReport extends StatelessWidget {
  const PostReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).PostReport),
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
        actions: const [PostButton()],
      ),
      body: PostReportBody(),
    );
  }
}
