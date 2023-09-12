import 'package:draggable_float_widget/draggable_float_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/utils/config/app_config.dart';

class OverlayAlive {
  static OverlayEntry? overlayEntry;

  static bool isShow = false;

  static dispose() {}

  static void insertOverlay(BuildContext context,
      {Function? onTap, Function? onShowResume}) {
    close();
    overlayEntry = OverlayEntry(builder: (context) {
      return DraggableFloatWidget(
        height: 40,
        width: 40,
        config: const DraggableFloatWidgetBaseConfig(
            initPositionYInTop: false,
            initPositionYMarginBorder: 0,
            borderTopContainTopBar: true,
            appBarHeight: 0),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              AppConfig.instance.alice.showInspector();
            },
            child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 16,
                  ),
                )),
          ),
        ),
      );
    });

    return Overlay.of(context).insert(overlayEntry!);
  }

  static close() {
    if (OverlayAlive.overlayEntry == null) {
      return;
    }
    dispose();
    overlayEntry!.remove();
    OverlayAlive.overlayEntry = null;
  }

  static showLive() {}
}
