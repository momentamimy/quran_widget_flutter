import 'package:quran_widget_flutter/data_source/local/local_data_source/page_local_data_source.dart';
import 'package:quran_widget_flutter/data_source/remote/page_api.dart';
import 'package:quran_widget_flutter/model/apis_response/my_response.dart';
import 'package:quran_widget_flutter/model/page.dart';
import 'package:quran_widget_flutter/network_helper/apis.dart';

class PageRepository {
  final PageLocalDataSource _pageLocalDataSource = PageLocalDataSource();
  final PageApi _pageApi = PageApi();

  Future<List<Page>?> fetchPagesList() async {
    List<Page>? pagesList = await _pageLocalDataSource.fetchPagesList();
    if ((pagesList != null && pagesList.isNotEmpty)) {
      return pagesList;
    } else {
      final MyResponse<Page> response = await _pageApi.fetchPagesList();
      if (response.code == Apis.CODE_SUCCESS) {
        pagesList = response.data as List<Page>;
        _pageLocalDataSource.savePagesList(pagesList);
      }
      return pagesList;
    }
  }

  Future<Page?> fetchPageById(int pageId) async {
    Page? page = await _pageLocalDataSource.fetchPageById(pageId);
    if (page != null) {
      return page;
    } else {
      final MyResponse<Page> response = await _pageApi.fetchPageById(pageId);
      if (response.code == Apis.CODE_SUCCESS) {
        page = response.data as Page?;
      }
      return page;
    }
  }
}
