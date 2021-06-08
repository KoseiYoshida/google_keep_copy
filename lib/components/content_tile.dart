import 'package:flutter/material.dart';
import 'package:goggle_keep_copy/models/unique_content.dart';

class ContentTile extends StatelessWidget {
  const ContentTile({required this.uniqueContent});

  // TODO(Kosei): ここではUniqueIDまでいらないはず？Contentのみを渡す。
  final UniqueContent uniqueContent;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                children: uniqueContent.content.images.map((imageProvider) {
                  return Expanded(
                    child: Image(image: imageProvider),
                  );
                }).toList(),
              ),
            ),
            Text(
              uniqueContent.content.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              uniqueContent.content.text,
            ),
          ],
        ),
      ),
    );
  }
}
