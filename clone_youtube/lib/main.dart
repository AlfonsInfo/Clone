import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Screen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white, foregroundColor: Colors.black),
      ),
    );
  }
}

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  static const List<Widget> _tabContent = <Widget>[
    HomePage(),
    Text(
      'indexTab1',
    ),
    Text(
      'indexTab2',
    ),
    Text(
      'indexTab3',
    ),
    Text(
      'indexTab',
    ),
    // Text('IndexHome',style: optionStyle,),
  ];

  void onItemTapped(int index) {
    // print("index $index");
    // print("selected index $_selectedIndex" );
    setState(() {
      _selectedIndex = index;
    });
    // print("selected index aftersetState $_selectedIndex" );
  }

  @override
  Widget build(BuildContext context) {
    var categoriesMuch = [
      categories(context, 'All', active: true),
      categories(context, 'New To You'),
      categories(context, 'Gaming'),
      categories(context, 'Live'),
      categories(context, 'Programmer'),
      categories(context, 'Music'),
      categories(context, 'Recently Uploaded'),
      categories(context, 'Watched'),
    ];

    return Scaffold(
      key: _scaffoldKey,
      //* Appbar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: youtubetitleLogo(),
        actions: [
          appBarIcon(() {}, Icons.cast),
          appBarIcon(() {}, Icons.notifications_outlined),
          appBarIcon(() {}, Icons.search),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => showBottomList(context),
              child: CircleAvatar(
                backgroundColor: Colors.red[500],
                child: const Icon(Icons.account_circle),
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 1 / 20),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey[500],
                        borderRadius: BorderRadius.circular(5)),
                    child: IconButton(
                        onPressed: () {
                          _scaffoldKey.currentState!.openDrawer();
                        },
                        icon: const Icon(Icons.explore_outlined))),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(spacing: 5, children: categoriesMuch),
                ),
              )
            ],
          ),
        ),
      ),
      //*Drawer
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              youtubetitleLogo(),
              ListTile(
                leading: const Icon(Icons.fireplace),
                title: const Text('Trending'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.music_note_outlined),
                title: const Text('Music'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.movie_creation),
                title: const Text('Movies'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.gamepad),
                title: const Text('Gaming'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.newspaper),
                title: const Text('News'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.sports_cricket),
                title: const Text('Sports'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      //*Body
      body: Center(
        child: _tabContent.elementAt(_selectedIndex),
      ),

      //* Bottom Navigasi
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (_) => onItemTapped(_),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Short',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline)),
            BottomNavigationBarItem(
                icon: Icon(Icons.subscriptions_outlined),
                label: 'Subscription'),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_library_sharp), label: 'Library'),
          ]),
    );
  }

  Row youtubetitleLogo() {
    return Row(
      children: const [
        Image(
          image: AssetImage("Assets/yt.png"),
          width: 50,
          height: 50,
          color: null,
          fit: BoxFit.scaleDown,
          alignment: Alignment.center,
        ),
        Padding(padding: EdgeInsets.only(left: 10)),
        Text('Youtube'),
      ],
    );
  }

  GestureDetector categories(BuildContext context, categoryText,
      {bool active = false}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          active = true;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: (active) ? Colors.grey[900] : Colors.grey[500],
            borderRadius: BorderRadius.circular(5)),
        height: MediaQuery.of(context).size.height * 1 / 22,
        child: Text(
          categoryText,
          style: TextStyle(color: (active) ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  IconButton appBarIcon(void Function() function, IconData myIcon) =>
      IconButton(
          onPressed: () => function(),
          icon: Icon(
            myIcon,
            size: 25,
            color: Colors.grey[800],
          ));

  Future<dynamic> showBottomList(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 9 / 10,
          // color: Colors.,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  children: [
                    const CircleAvatar(),
                    const Spacer(
                      flex: 2,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Alfonsus Setiawan'),
                        const Text('@alfonssusetiawan431'),
                        TextButton(
                            onPressed: () {},
                            child: const Text('Manage Your Google Account'))
                      ],
                    ),
                    const Spacer(
                      flex: 20,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

