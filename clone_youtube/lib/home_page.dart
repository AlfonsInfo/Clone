import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        youtubeContent("https://picsum.photos/id/237/500/250",'Funny Dog','Happy puppy'),
        youtubeContent("https://picsum.photos/id/233/500/250",'Rail Works', 'Mechanical'),
        youtubeContent("https://picsum.photos/id/231/500/250", 'Bukit Cinta', 'mantap jiwa'),
        youtubeContent("https://picsum.photos/id/230/500/250" , 'yoyoyoyo', 'wkwkwowo'),
        youtubeContent("https://picsum.photos/id/200/500/250" , 'yoyoyoyo', 'wkwkwowo'),
        youtubeContent("https://picsum.photos/id/100/500/250" , 'yoyoyoyo', 'wkwkwowo'),
      ],
    );
  }

  SizedBox youtubeContent(String link, contentTitle, channelName) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 1/3,
        child: Column(
          children: [
            Center(child: Image.network(link)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){},
                child: Row(
                  children:   [
                    const CircleAvatar(),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text( contentTitle, style: const TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Text( channelName),
                        ],
                      ),
                    ),
                    Expanded(child: Container()),
                    IconButton(icon: const Icon(Icons.more_vert), onPressed: (){},)
                  ],
                ),
              ),
            )
          ],
        ),
      );
  }
}
