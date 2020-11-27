#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "HyperionCore.h"
#import "HyperionWindowManager.h"
#import "HYPListenerContainer.h"
#import "HYPPluginContainerView.h"
#import "HYPPluginExtensionImp.h"
#import "HYPConfigurationConstants.h"
#import "HYPInAppOverlayContainer.h"
#import "HYPOverlayDebuggingViewController.h"
#import "HYPOverlayDebuggingWindow.h"
#import "HYPActivationGestureOptions.h"
#import "HyperionManager.h"
#import "HYPOverlayContainer.h"
#import "HYPOverlayViewProvider.h"
#import "HYPPlugin.h"
#import "HYPPluginExtension.h"
#import "HYPPluginHelper.h"
#import "HYPPluginMenuItem.h"
#import "HYPPluginModule.h"
#import "HYPOverlayPluginModule.h"
#import "HYPSnapshotInteractionView.h"
#import "HYPSnapshotPluginModule.h"
#import "HYPPopoverViewController.h"
#import "HYPSnapshotContainer.h"
#import "HYPSnapshotDebuggingWindow.h"
#import "HYPSnapshotViewController.h"
#import "HYPViewSelectionDelegate.h"
#import "HYPViewSelectionTableViewController.h"
#import "PluginListViewController.h"
#import "UIApplication+Swizzling.h"
#import "UIWindow+Swizzling.h"

FOUNDATION_EXPORT double HyperionCoreVersionNumber;
FOUNDATION_EXPORT const unsigned char HyperionCoreVersionString[];

