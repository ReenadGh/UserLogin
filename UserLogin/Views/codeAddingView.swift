//
//  codeAddingView.swift
//  UserLogin
//
//  Created by Reenad gh on 30/05/1444 AH.
//

import SwiftUI

struct codeAddingView: View {
    
<<<<<<< HEAD
    @State var code : String = ""
    @State var verificationID : String 
    @EnvironmentObject var firebaseUserManger : FirebaseUserManager
=======
    @EnvironmentObject var  vm  : FirebaseLogInManager
>>>>>>> mvvm-enhancing

    var body: some View {
        VStack {
            Spacer()
            Text("enter code from sms")
<<<<<<< HEAD
            codeTextFiled(code: $code)
            Button {
                firebaseUserManger.verifyToken(smsCode: code, verificationID: verificationID)
=======
            codeTextFiled()
            Button {
                vm.verifyToken()
>>>>>>> mvvm-enhancing
                
            } label: {
                Text("log in")
            }
            Spacer()

        }
        .background(Color.white)
    }
}

struct codeAddingView_Previews: PreviewProvider {
    static var previews: some View {
<<<<<<< HEAD
        codeAddingView( verificationID: "")
=======
        codeAddingView()
>>>>>>> mvvm-enhancing
            .environmentObject(FirebaseUserManager())
    }
}

struct codeTextFiled: View {
<<<<<<< HEAD
    @Binding var code : String

    var body: some View {
        HStack {
            TextField("enter code" , text: $code)
=======
    @EnvironmentObject var  vm  : FirebaseLogInManager

    var body: some View {
        HStack {
            TextField("enter code" , text: $vm.smsCode)
>>>>>>> mvvm-enhancing
                .padding()
            
        }
        .foregroundColor(.gray)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(20)
        .padding(.horizontal , 50)
    }
}
