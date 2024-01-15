import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsive News Feed',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NewsFeedScreen(),
    );
  }
}

class NewsFeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Feed'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return (orientation == Orientation.portrait)
              ? _buildNewsFeedPortrait()
              : _buildNewsFeedLandscape();
        },
      ),
    );
  }

  Widget _buildNewsFeedPortrait() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: _buildThumbnail(),
            title: Text('News Article $index'),
            subtitle: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
          ),
        );
      },
    );
  }

  Widget _buildNewsFeedLandscape() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: _buildThumbnail(),
            title: Text('News Article $index'),
            subtitle: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
          ),
        );
      },
    );
  }

  Widget _buildThumbnail() {
    return Container(
      width: 50,
      height: 50,
      color: Colors.grey,
    );
  }
}
