//
//  NotificationName+Util.swift
//  SCG
//
//  Created by KOSURU UDAY SAIKUMAR on 22/05/23.
//

import Foundation

public extension Notification.Name {
//    static let wisdomList = Notification.Name("RefreshWisdomListPage")
    static let reachabilityChanged = Notification.Name("reachabilityChanged")
    
    @available(*, unavailable, renamed: "Notification.Name.reachabilityChanged")
    static let ReachabilityChangedNotification = NSNotification.Name("ReachabilityChangedNotification")
}
