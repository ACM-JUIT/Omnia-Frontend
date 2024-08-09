import 'rive_model.dart';

class Menu {
  final String title;
  final RiveModel rive;
  final int index;

  Menu({
    required this.index,
    required this.title,
    required this.rive,
  });
}

List<Menu> bottomNavItems = [
  Menu(
    title: "Home",
    rive: RiveModel(
      src: "assets/RiveAssets/icons.riv",
      artboard: "HOME",
      stateMachineName: "HOME_interactivity",
    ),
    index: 0,
  ),
  Menu(
    title: "Community",
    rive: RiveModel(
      src: "assets/RiveAssets/icons.riv",
      artboard: "AUDIO",
      stateMachineName: "AUDIO_Interactivity",
    ),
    index: 1,
  ),
  Menu(
    title: "Search",
    rive: RiveModel(
      src: "assets/RiveAssets/icons.riv",
      artboard: "SEARCH",
      stateMachineName: "SEARCH_Interactivity",
    ),
    index: 2,
  ),
  Menu(
    title: "Profile",
    rive: RiveModel(
      src: "assets/RiveAssets/icons.riv",
      artboard: "USER",
      stateMachineName: "USER_Interactivity",
    ),
    index: 3,
  ),
];
