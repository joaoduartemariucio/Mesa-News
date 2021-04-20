//
//  PreferencesHelper.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 18/04/21.
//

import Foundation
import Security

class PreferencesHelper {
    
    static let instance = PreferencesHelper()
    
    func save(key: String, value: Any){
        let shared = UserDefaults.standard
        shared.setValue(value, forKey: key)
        shared.synchronize()
    }
    
    func getBool(key: String) -> Bool {
        let shared = UserDefaults.standard
        return shared.bool(forKey: key)
    }
    
    func getString(key: String) -> String {
        let shared = UserDefaults.standard
        return shared.string(forKey: key) ?? ""
    }
    
    func saveCodable<T:Codable>(key: String, value: T){
        guard let encode = EncoderHelper.instance.encode(to: value) else { return }
        let shared = UserDefaults.standard
        shared.setValue(encode, forKey: key)
        shared.synchronize()
    }
    
    func getDataArray(key: String) -> [Data] {
        let shared = UserDefaults.standard
        guard let arrayData = shared.array(forKey: key) as? [Data] else {
            return [Data]()
        }
        return arrayData
    }
    
    func getCodable<T: Codable>(key: String)-> T? {
        let shared = UserDefaults.standard
        guard let data = shared.data(forKey: key) else { return nil }
        return DecoderHelper.instance.decode(data: data)
    }
    
    func getInt64(key: String)-> Int64 {
        let shared = UserDefaults.standard
        let homeId = shared.integer(forKey: key)
        return Int64(homeId)
    }
    
    func removeValue(key: String){
        let shared = UserDefaults.standard
        shared.removeObject(forKey: key)
    }
    
    func clear(){
        UserDefaults.standard.removeObject(forKey: Constants.App.Keys.noticias_favoritadas)
    }
}
