import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'features_state.dart';

class FeaturesCubit extends Cubit<FeaturesState> {
  FeaturesCubit() : super(FeaturesInitial());
}
