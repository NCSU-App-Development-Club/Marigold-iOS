//
//  SignUpView.swift
//  Marigold
//
//  Created by Kevin Barnes on 8/4/23.
//

import RealmSwift
import SwiftUI

struct SignUpView: View {
    
    @EnvironmentObject private var app: RealmSwift.App
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    @State private var creatingAccount: Bool = false
    @State private var failedToCreateAccount: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                TextField("Email", text: $email)
                    .textInputAutocapitalization(.never)
                
                SecureField("Password", text: $password)
                    .textContentType(nil)
                
                SecureField("Confirm Password", text: $confirmPassword)
                    .textContentType(nil)
                
                Button(
                    action: {
                        createAccount()
                    },
                    label: {
                        Group {
                            if creatingAccount {
                                ProgressView()
                            } else {
                                Text("Create Account")
                                    .fontWeight(.bold)
                            }
                        }
                        .font(.title2)
                        .frame(maxWidth: .infinity)
                    }
                )
                .disabled(email.isEmpty || password.isEmpty || password != confirmPassword)
                .buttonStyle(.borderedProminent)
                .alert("Failed to create account. Please try again.", isPresented: $failedToCreateAccount, actions: {})
            }
            .textFieldStyle(.roundedBorder)
            .padding()
        }
        .navigationTitle(Text("Sign Up", comment: "Title at the top of the sign up view."))
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func createAccount() {
        if creatingAccount {
            return
        }
        
        creatingAccount = true
        
        Task {
            do {
                try await app.emailPasswordAuth.registerUser(email: email, password: password)
                creatingAccount = false
            } catch {
                creatingAccount = false
                failedToCreateAccount = true
            }
        }
    }
}

#Preview {
    NavigationStack {
        SignUpView()
    }
}
