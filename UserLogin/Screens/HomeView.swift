//
//  HomeView.swift
//  UserLogin
//
//  Created by Reenad gh on 28/05/1444 AH.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var firebaseUserManger : FirebaseUserManager

    var body: some View {
        VStack {
            Text(firebaseUserManger.user.mail)
            Text(firebaseUserManger.user.id)

        }

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(FirebaseUserManager())

    }
}
