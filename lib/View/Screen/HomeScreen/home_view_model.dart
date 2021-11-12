import 'package:kma_app/BusinessLayer/DataAccess/Http/DI/di.dart';
import 'package:kma_app/BusinessLayer/DataAccess/Http/Service/home_service.dart';
import 'package:kma_app/Model/home.dart';
import 'package:rxdart/rxdart.dart';

class HomeViewModel {
  BehaviorSubject<List<SlideNews>> listSlideNewsSubject = BehaviorSubject<List<SlideNews>>();
  HomeService service = getIt<HomeService>();

  Stream<List<SlideNews>> get listSlideNewsStream => listSlideNewsSubject.stream;

  Future getListSlideNews() async {
    List<SlideNews> listData = await service.getSlideNews();
    listSlideNewsSubject.add(listData);
  }
}