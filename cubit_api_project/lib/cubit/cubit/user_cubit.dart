import 'package:bloc/bloc.dart';
import 'package:cubit_api_project/Model/UserModel.dart';
import 'package:cubit_api_project/Repo/user_repo.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepoData userRepoData;
  UserCubit(this.userRepoData) : super(UserInitial());
  onLoadUserDaata() async {
    try {
      emit(UserLoadingState());
      var data = await userRepoData.getUserData();
      emit(UserLoadedState(data));
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }
}
