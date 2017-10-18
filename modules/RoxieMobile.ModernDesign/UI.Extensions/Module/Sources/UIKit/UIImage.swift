// ----------------------------------------------------------------------------
//
//  UIImage.swift
//
//  @author     Vasily Ivanov <IvanovVF@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import UIKit

// ----------------------------------------------------------------------------

extension UIImage
{
// MARK: - Methods
    
    public static func resizeImage(_ originalImage: UIImage, size: CGSize) -> UIImage?
    {
        // Create drawing context
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        originalImage.draw(in: CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height))
        
        // Capture resultant image
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        // Done
        return image
    }
    
    public func resizedImageWithSize(_ size: CGSize) -> UIImage? {
        return UIImage.resizeImage(self, size: size)
    }
    
    public static func resizeImage(_ image: UIImage, scale: Float) -> UIImage? {
        return image.resizedImageWithSize(Inner.scaledSize(image.size, scale: scale))
    }
    
    public func resizedImageWithScale(_ scale: Float) -> UIImage? {
        return UIImage.resizeImage(self, scale: scale)
    }

// MARK: - Constants
    
    fileprivate struct Inner
    {
        fileprivate static func scaledSize(_ size: CGSize, scale: Float) -> CGSize {
            return CGSize(width: size.width * CGFloat(scale), height: size.height * CGFloat(scale))
        }
    }

}

// ----------------------------------------------------------------------------
