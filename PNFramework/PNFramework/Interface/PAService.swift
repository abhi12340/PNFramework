//
//  PAService.swift
//  PNFramework
//
//  Created by Abhishek Kumar on 23/07/20.
//  Copyright © 2020 Abhishek. All rights reserved.
//

import Foundation
import UserNotifications
import UIKit

enum Permission {
    case granted
    case denied
}

public class PAService {
    
    //MARK:- public sharedInstance variable
    
    public static let sharedInstance = PAService()
    
    //MARK:- private variables
    
    private(set) var status : Permission?
    private(set) var deviceToken : String?
    private(set) var notificationInfo : [String : Any]?
    
    //MARK:- Initializer
    private init() {
        setPermission()
    }
    
    //MARK:- public methods
    
    public func setNotification(info data : [String : Any]) {
        notificationInfo = data
    }
    
    public func getNotificationInfo() -> [String : Any]? {
        return notificationInfo
    }
    
    public func getPermission() -> Bool {
        guard let notificationStatus = status , case .granted = notificationStatus else {
            return false
        }
        return true
    }
    
    public func subscribe() {
        if getPermission() {
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }
    
    public func getSubscriptionToken() -> String? {
        guard let token = deviceToken else {
            return nil
        }
        return token
    }
    
    public func setSubscriptionToken(token : String?) {
        deviceToken = token
    }
    
    public func getSubscriptionStatus() -> Bool {
        return UIApplication.shared.isRegisteredForRemoteNotifications
    }
    
    //MARK:- private method
    
    private func setPermission() {
        UNUserNotificationCenter.current()
        .requestAuthorization(options: [.alert, .sound, .badge]) {
          [weak self] (granted, error) in
            self?.status = granted ? .granted : .denied
        }
    }
}

