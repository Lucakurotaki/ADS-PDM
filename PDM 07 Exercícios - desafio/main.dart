import 'package:albuns/albumList.dart';
import 'package:flutter/material.dart';
import 'album.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'albumListItem.dart';

void main() {
  runApp(const AlbumApp());
}

class AlbumApp extends StatelessWidget {
  const AlbumApp({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple[200],
        appBar: AppBar(
          title: const Text("Album App"),
          backgroundColor: Colors.purple[800],
        ),
        body: const AlbumPage(),
      ),
    );
  }
}



class AlbumPage extends StatefulWidget {
  const AlbumPage({Key? key}) : super(key: key);

  @override
  _AlbumPageState createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  static const _pageSize = 10;

  final PagingController<int, Album> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await AlbumList.fetchAlbum(pageKey +1, _pageSize);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey +1;
        _pagingController.appendPage(newItems, nextPageKey);
        print(pageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) => 
      PagedListView<int, Album>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Album>(
          itemBuilder: (context, item, index) => AlbumListItem(
            album: item,
          ),
        ),
      );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
