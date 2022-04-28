import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'photo.dart';
import 'photoList.dart';
import 'photoListItem.dart';


class PhotoScreen extends StatelessWidget{
  final PhotoScreenArgs args;
  const PhotoScreen({Key? key, required this.args}): super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.purple[200],
      appBar: AppBar(
        title: Text(args.albumTitle),
        backgroundColor: Colors.purple[800],
      ),
      body: PhotoPage(args: args),
    );
  }
}

class PhotoPage extends StatefulWidget{
  final PhotoScreenArgs args;
  
  PhotoPage({Key? key, required this.args}) : super(key: key);

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  static const _pageSize = 10;

  final PagingController<int, Photo> _pagingController =
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
      final newItems = await PhotoList.fetchPhoto(pageKey +1, _pageSize, widget.args.albumId);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey +1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) => 
      PagedListView<int, Photo>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Photo>(
          itemBuilder: (context, item, index) => PhotoListItem(
            photo: item,
          ),
        ),
      );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}

class PhotoScreenArgs {
  final String albumTitle;
  final int albumId;

  PhotoScreenArgs(this.albumTitle, this.albumId);
}

