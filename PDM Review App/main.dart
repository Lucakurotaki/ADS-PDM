import 'package:flutter/material.dart';
import 'package:routes/capitalsList.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'capital.dart';
import 'capitalsListItem.dart';


void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple[200],
        appBar: AppBar(
          title: const Text("Weather App"),
          backgroundColor: Colors.purple[800],
        ),
        body: const CapitalPage(),
      ),
    );
  }
}


class CapitalPage extends StatefulWidget {
  const CapitalPage({Key? key}) : super(key: key);

  @override
  State<CapitalPage> createState() => _CapitalPageState();
}

class _CapitalPageState extends State<CapitalPage> {

  static const _pageLimit = 12;
  final PagingController<int, Capital> _pagingController = PagingController(firstPageKey: 0);
  
  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async{
    try{
      final newItems = await CapitalsList.readJson(pageKey, _pageLimit);
      final isLastPage = newItems.length < _pageLimit;

      if (isLastPage){
        _pagingController.appendLastPage(newItems);
      }else{
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    }catch (error) {
      _pagingController.error = error;
    }
  }


  @override
  Widget build(BuildContext context) =>
    PagedListView<int, Capital>(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<Capital>(
        itemBuilder: (context, item, index) => CapitalsListItem(
          cityName: item.cityName,
          favorite: item.favorite,
        )
      ),
    );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}