//
//  LogInView.swift
//  UserLogin
//
//  Created by Reenad gh on 28/05/1444 AH.
//

import SwiftUI

struct LogInView: View {
    @State var mail : String = ""
    @State var password : String = ""
    @State var errorMessage : String = ""

    var body: some View {
        VStack  (alignment: .center){
            Text("Log In")
                .font(.largeTitle)
            MailTextFiledView(mail: $mail)
            PasswordTextFiledView(password: $password)            
            Button {
                
            } label: {
                Text("Log In")
                    .padding()
                    .padding(.horizontal, 40)
                    .foregroundColor(.pink)
                    .background(Color.pink.opacity(0.2))
                    .cornerRadius(12)
            }
            
            Text(errorMessage)
                .foregroundColor(.red)

        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}

struct MailTextFiledView: View {
    @Binding var mail : String

    var body: some View {
        HStack {
            TextField("enter mail" , text: $mail)
                .padding()
            
        }
        .foregroundColor(.gray)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(20)
        .padding(.horizontal , 50)
    }
}

struct PasswordTextFiledView: View {
    @Binding var password : String

    var body: some View {
        HStack {
            SecureField("enter password" , text: $password)
                .padding()
            
        }
        .foregroundColor(.gray)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(20)
        .padding(.horizontal , 50)
    }
}
