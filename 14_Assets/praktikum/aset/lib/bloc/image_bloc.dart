import 'package:flutter_bloc/flutter_bloc.dart';

enum ImageEvent {
  selectImage,
}

class ImageState {
  final int selectedIndex;
  ImageState(this.selectedIndex);
}

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc() : super(ImageState(0)) {
    on<ImageEvent>((event, emit) {
      if (event == ImageEvent.selectImage) {
        emit(ImageState(state.selectedIndex + 1));
      }
    });
  }

  // ... Metode lainnya ...

  @override
  Stream<ImageState> mapEventToState(ImageEvent event) async* {}
}
