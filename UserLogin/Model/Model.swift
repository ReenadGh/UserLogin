//
//  Model.swift
//  UserLogin
//
//  Created by Reenad gh on 27/05/1444 AH.
//

import Foundation


struct User  : Codable {
    
    var id = UUID().uuidString
    var name : String = ""
    var mail : String = ""
    
    
}
