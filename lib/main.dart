import 'package:flutter/material.dart';
import 'lista.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sismos App',
      home: const Inicio(),
      initialRoute: '/',
      routes: {
        '/lista': (context) => ListaHome(),
        '/mapa': (context) => const Inicio(),
      },
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({Key? key});

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> with TickerProviderStateMixin {
  late final TabController _tabController;
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      if (_tabController.index == 1) {
        Navigator.pushNamed(context, '/lista');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sismos'),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              icon: const Icon(Icons.question_mark_rounded),
              onPressed: () {},
            ),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.orange,
          indicatorColor: Colors.orange,
          tabs: const <Widget>[
            Tab(
              text: "MAPA",
            ),
            Tab(
              child: Text("LISTA"),
            ),
          ],
        ),
      ),
      body: <Widget>[
        /// Home page
        Padding(
          padding: const EdgeInsets.all(8.0), // Agregar padding
          child: Card(
            shadowColor: Colors.transparent,
            margin: const EdgeInsets.all(8.0),
            child: SizedBox.expand(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/map.png',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
        ),

        /// Notifications page
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: ListTile(
              tileColor: Colors.grey,
              leading: Icon(Icons.notifications_active),
              title: Text('Sismo # 1: Paso Canoas'),
              textColor: Colors.red,
              subtitle: Text(
                'Sismo de 7.5 en el sur de Costa Rica',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              // Agregar icono de emergencia
              trailing: Icon(Icons.warning_amber),
              iconColor: Colors.red,
            ),
          ),
        ),

        /// Messages page
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            reverse: true,
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      'Hello',
                      style: theme.textTheme.bodyLarge!
                          .copyWith(color: theme.colorScheme.onPrimary),
                    ),
                  ),
                );
              }
              return Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'Hi!',
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: theme.colorScheme.onPrimary),
                  ),
                ),
              );
            },
          ),
        ),
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.orange,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.emergency_share),
            icon: Icon(Icons.home_outlined),
            label: 'Sismos',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.person)),
            label: ' Lo sentiste?',
          ),
          NavigationDestination(
            icon: Badge(
              child: Icon(Icons.more_horiz),
            ),
            label: 'Mas',
          ),
        ],
      ),
    );
  }
}
