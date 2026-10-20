import 'package:flutter/material.dart';
import 'package:playground/home/home_data.dart';

class PlaygroudHomeScreen extends StatelessWidget {
  const PlaygroudHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Laksh's Playground"),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(0),
        itemCount: HomeData.items.length,
        itemBuilder: (context, idx) {
          final HomeData item = HomeData.items[idx];

          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: _HomePageTile(item: item),
          );
        },
      ),
    );
  }
}

class _HomePageTile extends StatelessWidget {
  final HomeData item;

  const _HomePageTile({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute<Widget>(
          builder: (context) => item.screen,
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12.0,
        ),
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade100,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: Colors.blueGrey.shade500,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  if (item.subTitle != null && item.subTitle!.isNotEmpty) ...[
                    SizedBox(height: 4.0),
                    Text(
                      item.subTitle!,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ],
              ),
            ),
            SizedBox(width: 4.0),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16.0,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
