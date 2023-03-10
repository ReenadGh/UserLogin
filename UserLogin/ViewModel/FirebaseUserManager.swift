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
<<<<<<< HEAD
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
=======





class FirebaseLogInManager : ObservableObject {
    
    @Published var mail : String = ""
    @Published var phone : String = ""
    @Published var password : String = ""
    @Published var verificationID : String?
    @Published var smsCode : String = ""

    let auth  : Auth
    @Published var loadingState : LoadingState = .none
    
    init () {
        auth = Auth.auth()
    }

    
    func logInToAccountByMail() {
>>>>>>> mvvm-enhancing
        self.loadingState = .loading
        auth.signIn(withEmail: mail, password: password ){ _ , error in
            if let error = error {
                print (error.localizedDescription)
                self.loadingState = .failed(error: error.localizedDescription)
                return
            }
            self.loadingState = .success
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
<<<<<<< HEAD
                self.fetchUser()
=======
>>>>>>> mvvm-enhancing
                self.loadingState = .none

            }
            
        }
        
    }
<<<<<<< HEAD
    func logInToAccount(phoneNumber : String , verificationID : @escaping (_ verificationID : String?)-> Void ) {
        
        self.loadingState = .loading
        PhoneAuthProvider.provider()
          .verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationid, error in
=======
    
    func logInToAccount() {
        self.loadingState = .loading
      
        if ( mail.isEmpty || password.isEmpty ) && phone.isEmpty  {
            loadingState = .failed(error: "please fill mail or password filed ")
        }else if ( ( mail.isEmpty && password.isEmpty )  && phone != "" ) {
            
            logInToAccountByPhone()
        }else {
            logInToAccountByMail()
        }
        
    }

    private func logInToAccountByPhone() {
        
        self.loadingState = .loading
        PhoneAuthProvider.provider()
          .verifyPhoneNumber("+966\(phone)", uiDelegate: nil) { verificationid, error in
>>>>>>> mvvm-enhancing
              if let error = error {
                  self.loadingState = .failed(error: error.localizedDescription)
                  print(error.localizedDescription)
                return
              }
<<<<<<< HEAD
              verificationID(verificationid)
=======
              self.verificationID = verificationid
              
>>>>>>> mvvm-enhancing
          }
        
    }
    
    
<<<<<<< HEAD
    func verifyToken(smsCode : String , verificationID : String? ){
=======
    
     func verifyToken(){
>>>>>>> mvvm-enhancing
        self.loadingState = .loading

        guard let verificationID = verificationID else {
            self.loadingState = .failed(error: "try again later !")
            return
        }
<<<<<<< HEAD
=======
         
         if smsCode != "" {
      
>>>>>>> mvvm-enhancing
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID , verificationCode: smsCode)
        
        auth.signIn(with: credential){ result , error in
            if let error = error {
                self.loadingState = .failed(error: error.localizedDescription)
                return
            }
            self.loadingState = .success
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
<<<<<<< HEAD
                self.fetchUser()
=======
>>>>>>> mvvm-enhancing
                self.loadingState = .none

            }

            
        }
<<<<<<< HEAD
=======
         }
>>>>>>> mvvm-enhancing
        
        

    }
<<<<<<< HEAD
=======


    
    
    
}



enum LoadingState {
    case loading, success, failed(error : String), none
}


class FirebaseUserManager : ObservableObject {
    
    @Published var user : User = .init()
    @Published var loadingState: LoadingState = .none
    
    let firestore : Firestore
    let auth  : Auth

      init () {
        auth = Auth.auth()
        firestore = Firestore.firestore()
         self.fetchUser()

    }
    
    func fetchUser() {

        auth.addStateDidChangeListener { auth, user in
    
            guard let userId = user?.uid else {return}
            self.firestore.collection("users").document(userId).getDocument { documentSnapshot, error in
                if let error = error {
                    print("DEBUG : log in fetching user  : \(error.localizedDescription)")
                    return
                }
                
                guard let user = try? documentSnapshot?.data(as: User.self) else {return}
                self.user = user
            }
            
        }

   

        
        
    }
    
    
>>>>>>> mvvm-enhancing
    
    

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
