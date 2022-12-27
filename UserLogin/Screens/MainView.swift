//
//  MainView.swift
//  UserLogin
//
//  Created by Reenad gh on 28/05/1444 AH.
//

import SwiftUI

struct MainView: View {
    @State var isSplashViewActive : Bool = true
    @State var isUserLoggedIn : Bool = true
    @EnvironmentObject var firebaseUserManger : FirebaseUserManager
    var body: some View {
        
        if (isSplashViewActive){
<<<<<<< HEAD
            
=======
>>>>>>> mvvm-enhancing
            SplashView(isActive: $isSplashViewActive)
        }else if firebaseUserManger.isUserLoggedin() {
            
            HomeView()
        }else {
<<<<<<< HEAD
            
=======
>>>>>>> mvvm-enhancing
            LogInView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(FirebaseUserManager())
    }
}
