import 'package:chrip_aid/common/layout/default_layout.dart';
import 'package:chrip_aid/common/styles/colors.dart';
import 'package:chrip_aid/root_tab/viewmodel/root_tab_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RootTab extends ConsumerStatefulWidget {
  static String get routeName => 'home';

  const RootTab({Key? key}) : super(key: key);

  @override
  ConsumerState<RootTab> createState() => _RootTabState();
}

class _RootTabState extends ConsumerState<RootTab>
    with TickerProviderStateMixin {
  late final RootTabViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = ref.read(rootTabViewModelProvider)..getInfo(this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:
            viewModel.tabs[viewModel.rootTabController.index].tab.mainColor,
        selectedItemColor: CustomColor.backGroundSubColor,
        unselectedItemColor: CustomColor.disabledColor.withOpacity(0.5),
        type: BottomNavigationBarType.fixed,
        onTap: (int index) =>
            setState(() => viewModel.rootTabController.animateTo(index)),
        currentIndex: viewModel.rootTabController.index,
        items: viewModel.tabs
            .map(
              (e) => BottomNavigationBarItem(
                icon: Icon(e.icon),
                label: e.label,
              ),
            )
            .toList(),
        showUnselectedLabels: false,
        showSelectedLabels: false,
      ),
      child: TabBarView(
        controller: viewModel.rootTabController,
        physics: const NeverScrollableScrollPhysics(),
        children: viewModel.tabs.map((e) => e.tab).toList(),
      ),
    );
  }
}
