//
//  MKPointAnnotation-ObservableObject.swift
//  BucketList
//
//  Created by Felix Lin on 8/2/20.
//  Copyright © 2020 Felix Lin. All rights reserved.
//

import MapKit

extension MKPointAnnotation:ObservableObject {
    public var wrappedTitle: String {
        get {
            self.title ?? "Unknown value"
        }
        
        set {
            title = newValue
        }
    }
    
    public var wrappedSubtitle: String {
        get {
            self.subtitle ?? "Unknown value"
        }
        
        set {
            subtitle = newValue
        }
    }
}
