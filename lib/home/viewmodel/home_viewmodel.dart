import 'package:bloc/bloc.dart';
import 'package:bloc_example/home/model/home_model.dart';
import 'package:bloc_example/home/service/home_service.dart';

class HomeCubit extends Cubit<HomeState> {
  final IHomeService homeService;
  HomeModel? model;
  bool isLoading = false;
  HomeCubit({required this.homeService}) : super(HomeLoading()) {
    _init();
  }

  Future<void> _init() async {
    await fetchHomeData();
    emit(HomeCompleted(model: model));
  }

  Future<void> fetchHomeData() async {
    changeLoading();
    model = await homeService.fetchHomeDatas();
    changeLoading();
  }

  void changeLoading() {
    isLoading = !isLoading;
  }
}

abstract class HomeState {}

class HomeLoading extends HomeState {}

class HomeCompleted extends HomeState {
  HomeModel? model;
  HomeCompleted({this.model});
}
