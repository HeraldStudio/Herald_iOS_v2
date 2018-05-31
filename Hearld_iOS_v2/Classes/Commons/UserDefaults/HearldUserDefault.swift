//
//  HearldUserDefault.swift
//  Hearld_iOS_v2
//
//  Created by Nathan on 23/10/2017.
//  Copyright © 2017 Nathan. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

let screenRect = UIScreen.main.bounds

/* 登录状态Variable */
let isLoginVariable = Variable<Bool>(false)

let isRemindLesson = Variable<Bool>(false)
let isRemindExperiment = Variable<Bool>(false)
let isRemindTest = Variable<Bool>(false)

class HearldUserDefault{
    
    /* Keys */
    static let uuidKey = "uuid"
    static let isLoginKey = "isLogin"
    
    static let remainPEDays = "remainPE"
    
    static let isRemindLessonKey = "remindLesson"
    static let isRemindExperimentKey = "remindExperiment"
    static let isRemindTestKey = "remindTest"
    
    static let defaults = UserDefaults.standard
    
    public static var isLogin: Bool? {
        set{
            set(isLoginKey,newValue)
            if let value = newValue{
                isLoginVariable.value = value
            }
        }
        get{
            return get(isLoginKey) ?? nil
        }
    }
    
    public static var uuid: String? {
        set{
            set(uuidKey,newValue)
        }
        get{
            return get(uuidKey) ?? nil
        }
    }
    
    public static var peDays : Int? {
        set {
            set(remainPEDays, newValue)
        }
        get {
            return get(remainPEDays) ?? nil
        }
    }
    
    /* 清除UserDefault */
    public func cleanAllUserDefault(){
        HearldUserDefault.defaults.removeObject(forKey: HearldUserDefault.uuidKey)
        HearldUserDefault.defaults.removeObject(forKey: HearldUserDefault.isLoginKey)
        HearldUserDefault.defaults.removeObject(forKey: HearldUserDefault.isRemindLessonKey)
        HearldUserDefault.defaults.removeObject(forKey: HearldUserDefault.isRemindExperimentKey)
        HearldUserDefault.defaults.removeObject(forKey: HearldUserDefault.isRemindTestKey)
    }
    
    class func set<T>(_ key: String, _ value : T) {
        HearldUserDefault.defaults.set(value, forKey: key)
    }
    
    class func get<T>(_ key: String) -> T? {
        if let value = HearldUserDefault.defaults.object(forKey: key){
            return value as? T
        }
        return nil
    }
    
}
