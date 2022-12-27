//
//  LogInView.swift
//  UserLogin
//
//  Created by Reenad gh on 28/05/1444 AH.
//

import SwiftUI

struct LogInView: View {
<<<<<<< HEAD
    @State var mail : String = ""
    @State var phone : String = ""
    @State var password : String = ""
    @State var verificationID : String?

    @EnvironmentObject var firebaseUserManger : FirebaseUserManager

=======

    @StateObject var  vm  : FirebaseLogInManager = FirebaseLogInManager()
>>>>>>> mvvm-enhancing
    var body: some View {
        
        
        VStack  (alignment: .center , spacing: 20){
            
            Text("Log In")
                .font(.largeTitle)
<<<<<<< HEAD
            MailTextFiledView(mail: $mail)
            PasswordTextFiledView(password: $password)
            
            Text("Or by phone number")
            PhoneTextFiledView(phone: $phone)
            
            Button {
                if phone == ""{
                firebaseUserManger.logInToAccount(mail: mail, password: password)
                }
                else {
                    firebaseUserManger.logInToAccount(phoneNumber: "+966\(phone)") { verificationID in
                        self.verificationID = verificationID
                 
                    }
                }
=======
            MailTextFiledView()
            PasswordTextFiledView()
            Text("Or by phone number")
             PhoneTextFiledView()
            
            Button {
                vm.logInToAccount()
>>>>>>> mvvm-enhancing
            } label: {
                Text("Log In")
                    .padding()
                    .padding(.horizontal, 40)
                    .foregroundColor(.pink)
                    .background(Color.pink.opacity(0.2))
                    .cornerRadius(12)
            }
            
            
<<<<<<< HEAD
            LogInStateView(loadingState: $firebaseUserManger.loadingState)
=======
            LogInStateView(loadingState: $vm.loadingState)
>>>>>>> mvvm-enhancing
            
 
        }
        
        .overlay(
            ZStack {
    
<<<<<<< HEAD
       if let verificationID = verificationID {
        codeAddingView(verificationID: verificationID)
=======
                if let verificationID = vm.verificationID {
                    codeAddingView()
>>>>>>> mvvm-enhancing
                    
                }
            }
            
        )
<<<<<<< HEAD
=======
        
        .environmentObject(vm)
>>>>>>> mvvm-enhancing
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
<<<<<<< HEAD
            .environmentObject(FirebaseUserManager())
        
=======
            .environmentObject(FirebaseLogInManager())
            .environmentObject(FirebaseUserManager())

>>>>>>> mvvm-enhancing
        
        LogInStateView(loadingState: .constant(.loading))
            .padding()
            .previewLayout(.sizeThatFits)
        
        
<<<<<<< HEAD
        MailTextFiledView(mail: .constant("test@test.com"))
=======
        MailTextFiledView()
>>>>>>> mvvm-enhancing
            .padding()
            .previewLayout(.sizeThatFits)
        
    }
}

struct MailTextFiledView: View {
<<<<<<< HEAD
    @Binding var mail : String

    var body: some View {
        HStack {
            TextField("enter mail" , text: $mail)
=======
    @EnvironmentObject var  vm  : FirebaseLogInManager

    var body: some View {
        HStack {
            TextField("enter mail" , text: $vm.mail)
>>>>>>> mvvm-enhancing
                .padding()
            
        }
        .foregroundColor(.gray)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(20)
        .padding(.horizontal , 50)
    }
}

struct PhoneTextFiledView: View {
<<<<<<< HEAD
    @Binding var phone : String
=======
    
    @EnvironmentObject var  vm  : FirebaseLogInManager
>>>>>>> mvvm-enhancing

    var body: some View {
        HStack (spacing : 0){
            Text("+966")
                .foregroundColor(.black).bold()
<<<<<<< HEAD
            TextField("phone" , text: $phone)
=======
            TextField("phone" , text: $vm.phone)
>>>>>>> mvvm-enhancing
                .keyboardType(.numberPad)
                .padding()
        }
        .padding(.horizontal , 10)

        .foregroundColor(.gray)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(20)
        .padding(.horizontal , 50)
    }
}

struct PasswordTextFiledView: View {
<<<<<<< HEAD
    @Binding var password : String

    var body: some View {
        HStack {
            SecureField("enter password" , text: $password)
=======
    @EnvironmentObject var  vm  : FirebaseLogInManager

    var body: some View {
        HStack {
            SecureField("enter password" , text: $vm.password)
>>>>>>> mvvm-enhancing
                .padding()
            
        }
        .foregroundColor(.gray)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(20)
        .padding(.horizontal , 50)
    }
}


struct LogInStateView: View {
    @Binding var loadingState : LoadingState

    var body: some View {
        switch loadingState {
        case .loading :
            ProgressView()
                .scaleEffect(1.5)
        case .failed(error: let error):
            Text(error)
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.orange)
        case .none:
            Text("")
                
        case .success:
            Image(systemName: "checkmark.diamond.fill")
                .imageScale(.large)
                .foregroundColor(.green)
        }
    }
}
