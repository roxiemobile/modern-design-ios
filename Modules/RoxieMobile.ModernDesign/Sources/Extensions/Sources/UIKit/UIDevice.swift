// ----------------------------------------------------------------------------
//
//  UIDevice.swift
//
//  @author     Denis Kolyasev <KolyasevDA@ekassir.com>
//  @copyright  Copyright (c) 2015, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import UIKit

// ----------------------------------------------------------------------------

extension UIDevice
{
// MARK: - Methods

    public static func systemVersionEqualTo(_ version: String) -> Bool {
        return UIDevice.current.systemVersion.compare(version, options: .numeric) == .orderedSame
    }

    public static func systemVersionGreaterThan(_ version: String) -> Bool {
        return UIDevice.current.systemVersion.compare(version, options: .numeric) == .orderedDescending
    }

    public static func systemVersionGreaterThanOrEqualTo(_ version: String) -> Bool {
        return UIDevice.current.systemVersion.compare(version, options: .numeric) != .orderedAscending
    }

    public static func systemVersionLessThan(_ version: String) -> Bool {
        return UIDevice.current.systemVersion.compare(version, options: .numeric) == .orderedAscending
    }

    public static func systemVersionLessThanOrEqualTo(_ version: String) -> Bool {
        return UIDevice.current.systemVersion.compare(version, options: .numeric) != .orderedDescending
    }

// MARK: - Private Methods

    fileprivate func mdc_orientation() -> UIDeviceOrientation
    {
        let orientation = UIDevice.current.orientation
        switch (orientation)
        {
            case .unknown:
                return .portrait

            default:
                return orientation
        }
    }

    fileprivate func mdc_machine() -> String
    {
        var systemInfo = utsname()
        uname(&systemInfo)

        let machine = systemInfo.machine
        //let mirror = reflect(machine)
        let mirror = Mirror(reflecting: machine)
        
        let identifier = mirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }

        // Done
        return identifier
    }

// MARK: - Inner Types

    public struct Model
    {
        public static let isIdiomPhone = {
            return (UIDevice.current.userInterfaceIdiom == .phone)
        }()

        public static let isIdiomPhoneWidescreen = {
            return UIDevice.Model.isIdiomPhone && (UIScreen.main.bounds.size.height >= 568.0)
        }()

        public static let isIdiomPad = {
            return (UIDevice.current.userInterfaceIdiom == .pad)
        }()

        public static let isRetinaDisplay = {
            return UIScreen.main.responds(to: #selector(UIScreen.displayLink(withTarget:selector:))) && (UIScreen.main.scale >= 2.0)
        }()

        public static let machine = {
            return UIDevice.current.mdc_machine()
        }()
    }

    public struct State
    {
        public static var isLandscape: Bool {
            return UIDevice.current.mdc_orientation().isLandscape
        }

        public static var isPortrait: Bool {
            return UIDevice.current.mdc_orientation().isPortrait
        }

        public static var isFlat: Bool {
            return UIDevice.current.mdc_orientation().isFlat
        }

        public static var isValidInterfaceOrientation: Bool {
            return UIDevice.current.mdc_orientation().isValidInterfaceOrientation
        }
    }

    public struct SystemVersion
    {
        public static let Major = {
            return (Inner.SystemVersion.count >= 1) ? Inner.SystemVersion[0] : 0
        }()

        public static let Minor = {
            return (Inner.SystemVersion.count >= 2) ? Inner.SystemVersion[1] : 0
        }()

        public static let Patch = {
            return (Inner.SystemVersion.count >= 3) ? Inner.SystemVersion[2] : 0
        }()
    }

// MARK: - Constants

    fileprivate struct Inner {
        static var SystemVersion = UIDevice.current.systemVersion.split { $0 == "." }.map { String($0) }.map { Int($0) ?? 0 }
    }
}

// ----------------------------------------------------------------------------
