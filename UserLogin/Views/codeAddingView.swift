//
//  codeAddingView.swift
//  UserLogin
//
//  Created by Reenad gh on 30/05/1444 AH.
//

import SwiftUI

struct codeAddingView: View {
    
    @State var code : String = ""
    @State var verificationID : String 
    @EnvironmentObject var firebaseUserManger : FirebaseUserManager

    var body: some View {
        VStack {
            Spacer()
            Text("enter code from sms")
            codeTextFiled(code: $code)
            Button {
                firebaseUserManger.verifyToken(smsCode: code, verificationID: verificationID)
                
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
        codeAddingView( verificationID: "")
            .environmentObject(FirebaseUserManager())
    }
}

struct codeTextFiled: View {
    @Binding var code : String

    var body: some View {
        HStack {
            TextField("enter code" , text: $code)
                .padding()
            
        }
        .foregroundColor(.gray)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(20)
        .padding(.horizontal , 50)
    }
}
