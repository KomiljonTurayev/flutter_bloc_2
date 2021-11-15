import 'package:bloc/bloc.dart';

enum ImageEvent { getImage }

class BlocImage extends Bloc<ImageEvent, String> {
  BlocImage(String initialState)
      : super(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png');

  @override
  Stream<String> mapEventToState(ImageEvent event) async* {
    // TODO: implement mapEventToState
    yield 'https://protocoderspoint.com/wp-content/uploads/2019/10/protocoderspoint-rectangle-round-.png';
  }
}
