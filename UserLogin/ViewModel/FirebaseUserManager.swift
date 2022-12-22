//
//  FirebaseUserManager.swift
//  UserLogin
//
//  Created by Reenad gh on 27/05/1444 AH.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift
enum LoadingState {
    case loading, failed(error : String), none
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
        self.fetchUser()

    }
    
    func fetchUser() {
        
        guard let userId = auth.currentUser?.uid else {return}

        firestore.collection("users").document(userId).getDocument { documentSnapshot, error in
            if let error = error {
                print("DEBUG : log in fetching user  : \(error.localizedDescription)")
                return
            }
            
            guard let user = try? documentSnapshot?.data(as: User.self) else {return}
            self.user = user
        }

        
        
    }
    func logInToAccount(mail : String , password : String ) {
        self.loadingState = .loading
        auth.signIn(withEmail: mail, password: password ){ _ , error in
            if let error = error {
                print (error.localizedDescription)
                self.loadingState = .failed(error: error.localizedDescription)
                return
            }
            self.loadingState = .none
            self.fetchUser()
            
        }
        
    }
    func isUserLoggedin()-> Bool {
        self.user.id != ""
    }
    func signOutFromAccout () {
        do{
            try auth.signOut()
            user = .init()
        }catch {
            print(error)
        }
    }
    
    
    
}
