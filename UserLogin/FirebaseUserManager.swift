//
//  FirebaseUserManager.swift
//  UserLogin
//
//  Created by Reenad gh on 27/05/1444 AH.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

enum LoadingState {
    case loading, success, failed(error : String), none
}


class ViewModelBase: ObservableObject {
    @Published var loadingState: LoadingState = .none
    
}



class FirebaseUserManager : ViewModelBase {
    
    @Published var user : User = .init()

    let auth  : Auth
    let firestore : Firestore
    
    
    override init () {
        auth = Auth.auth()
        firestore = Firestore.firestore()
        super.init()
    }
    
    
    func logInToAccount(mail : String , password : String ) {
        self.loadingState = .loading
        auth.signIn(withEmail: mail, password: password ){ _ , error in
            if let error = error {
                self.loadingState = .failed(error: error.localizedDescription)
                return
            }
            guard let userid = self.auth.currentUser?.uid else {return}
            self.user.id = userid
            guard let mail  =  self.auth.currentUser?.email else {return}
            self.user.mail = mail
            self.loadingState = .success
            
        }
        
    }
    
}
