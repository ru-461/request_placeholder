import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

// ロガー
final logger = Logger();

class Base extends StatefulWidget {
  const Base({Key? key, required this.child}) : super(key: key);

  // ウィジェット
  final Widget child;

  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int _selectedIndex = 0;
  String _pageTitle = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageTitle),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(16, 185, 129, 1),
        leading: IconButton(
            onPressed: () => {context.push('/home')},
            icon: const Icon(Icons.home)),
        actions: [
          IconButton(
              onPressed: () => {context.push('/settings')},
              icon: const Icon(Icons.settings))
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.article), label: 'Posts'),
          NavigationDestination(icon: Icon(Icons.forum), label: 'Comments'),
          NavigationDestination(icon: Icon(Icons.collections), label: 'Albums'),
          NavigationDestination(
              icon: Icon(Icons.photo_camera), label: 'Photos'),
          NavigationDestination(icon: Icon(Icons.task), label: 'Todos'),
          NavigationDestination(icon: Icon(Icons.people), label: 'Users'),
        ],
        onDestinationSelected: (index) {
          switch (index) {
            case 0:
              _selectedIndex = index;
              _pageTitle = 'Posts';
              context.go('/posts');
              break;
            case 1:
              _selectedIndex = index;
              _pageTitle = 'Comments';
              context.go('/comments');
              break;
            case 2:
              _selectedIndex = index;
              _pageTitle = 'Albums';
              context.go('/albums');
              break;
            case 3:
              _selectedIndex = index;
              _pageTitle = 'Photos';
              context.go('/photos');
              break;
            case 4:
              _selectedIndex = index;
              _pageTitle = 'Todos';
              context.go('/todos');
              break;
            case 5:
              _selectedIndex = index;
              _pageTitle = 'Users';
              context.go('/users');
              break;
            default:
              _selectedIndex = index;
              _pageTitle = 'Home';
              context.go('/');
          }
          setState(() {});
        },
      ),
      body: widget.child,
    );
  }
}
