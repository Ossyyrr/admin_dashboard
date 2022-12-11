import 'package:admin_dashboard/provider/side_menu_provider.dart';
import 'package:admin_dashboard/ui/view/no_page_found_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class NoPageFoundHandlers {
  static Handler noPageFound = Handler(
    handlerFunc: (context, params) {
      Provider.of<SideMenuProvider>(context!, listen: false).currentPage = '/404';
      return const NoPageFoundView();
    },
  );
}
