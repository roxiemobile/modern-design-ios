// ----------------------------------------------------------------------------
//
//  UIViewController.swift
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import UIKit
import SwiftCommonsLang

// ----------------------------------------------------------------------------

extension UIViewController {

// MARK: - Construction

    public convenience init(nibName nibNameOrNil: String?) {
        self.init(nibName: nibNameOrNil, bundle: nil)
    }

// MARK: - Methods

    public class func mdc_controller() -> Self {
        // Load a .NIB whose name is the same as view controller's class
        return mdc_controller(nibName: defaultResourceName(self), bundle: nil)
    }

    public class func mdc_controller(nibName nibNameOrNil: String?) -> Self {
        // Initialize view controller with the .NIB file
        return mdc_controller(nibName: nibNameOrNil, bundle: nil)
    }

    public class func mdc_controller(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) -> Self {
        // Bugfix for iOS Simulator
        let nibName = nibNameOrNil ?? defaultResourceName(self)

        // Initialize view controller with the .NIB file
        let controller = self.init(nibName: nibName, bundle: nibBundleOrNil) as UIViewController
        return Roxie.forceCast(controller, to: self)
    }

    public class func mdc_controller(storyboardName storyboardNameOrNil: String?) -> Self? {
        // Initialize view controller with the .Storyboard file
        return mdc_controller(storyboardName: storyboardNameOrNil, bundle: nil)
    }

    public class func mdc_controller(
        storyboardName storyboardNameOrNil: String?,
        bundle storyboardBundleOrNil: Bundle?
    ) -> Self? {

        // Bugfix for iOS Simulator
        let storyboardName = storyboardNameOrNil ?? defaultResourceName(self)

        // Initialize view controller with the .Storyboard file
        let controller = UIStoryboard(name: storyboardName, bundle: storyboardBundleOrNil)
            .instantiateInitialViewController()

        return Roxie.conditionalCast(controller, to: self)
    }

// MARK: -

// FIXME: uncomment!
//
//    // Loads a view from .NIB file
//    - (UIView *)loadViewOfClass:(Class)clazz fromNibNamed:(NSString *)nibNameOrNil
//    {
//        // Initialize view with the .NIB file
//        UIView *view = [self loadViewOfClass:clazz fromNibNamed:nibNameOrNil
//                bundle:[NSBundle mainBundle]];
//        return  view;
//    }

// FIXME: uncomment!
//
//    - (UIView *)loadViewOfClass:(Class)clazz fromNibNamed:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundle
//    {
//        if (clazz == nil)
//            return nil;
//
//        // Bugfix for iOS Simulator
//        if (nibNameOrNil == nil) {
//            nibNameOrNil =  NSStringFromClass(clazz);
//        }
//
//        // Initialize view with the .NIB file
//        UIView *view = [UIView loadViewOfClass:clazz fromNibNamed:nibNameOrNil
//                withOwner:self withOptions:nil bundle:nibBundle];
//        return  view;
//    }

// MARK: -

// FIXME: uncomment!
//
//    // Returns first found view controller
//    - (UIViewController *)firstViewController
//    {
//        id nextResponder = [self nextResponder];
//        if ([nextResponder isKindOfClass:UIViewController.class]) {
//            return nextResponder;
//        }
//        else
//        if ([nextResponder isKindOfClass:UIView.class]) {
//            return [nextResponder firstViewController];
//        }
//        else {
//            return nil;
//        }
//    }

// MARK: - Private Methods

    private class func defaultResourceName(_ object: AnyObject) -> String {
        return Roxie.typeName(of: object)
    }

// MARK: - Constants

    private struct Inner {
        static let TransitionAnimationDuration: CGFloat = 0.3
    }
}
