//
//  ProfileView.swift
//  Marigold
//
//  Created by Kevin Barnes on 8/13/23.
//

import RealmSwift
import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject private var app: RealmSwift.App
    
    @ObservedRealmObject var user: User
    
    @State private var isEditing: Bool = false
    @State private var failedToSignOut: Bool = false
    @State private var confirmDeleteAccount: Bool = false
    @State private var failedToDeleteAccount: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if isEditing {
                    EditView(user: user)
                } else {
                    NormalView(user: user)
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(
                        action: {
                            withAnimation(.easeInOut) {
                                isEditing.toggle()
                            }
                        },
                        label: {
                            Image(systemName: "square.and.pencil")
                        }
                    )
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu(
                        content: {
                            Button(
                                action: {
                                    confirmDeleteAccount = true
                                },
                                label: {
                                    Label("Delete Account", systemImage: "person.crop.circle.fill.badge.xmark")
                                }
                            )
                            
                            Button(
                                role: .destructive,
                                action: {
                                    Task {
                                        do {
                                            try await app.currentUser?.logOut()
                                        } catch {
                                            failedToSignOut = true
                                        }
                                    }
                                },
                                label: {
                                    Label("Sign Out", systemImage: "arrow.backward.square")
                                }
                            )
                        },
                        label: {
                            Image(systemName: "gear")
                        }
                    )
                }
            }
            .confirmationDialog(
                "Delete Account?",
                isPresented: self.$confirmDeleteAccount,
                actions: {
                    Button("Keep Account", role: .cancel) { }
                    
                    Button("Delete Account", role: .destructive) {
                        Task {
                            do {
                                try await app.currentUser?.delete()
                            } catch {
                                failedToDeleteAccount = true
                            }
                        }
                    }
                },
                message: {
                    Text("Are you sure you want to delete your account? This action cannot be undone.")
                }
            )
            .alert(
                "Failed To Sign Out",
                isPresented: $failedToSignOut,
                actions: { },
                message: {
                    Text("Please try again.")
                }
            )
            .alert(
                "Failed To Delete Account",
                isPresented: $failedToDeleteAccount,
                actions: { },
                message: {
                    Text("Please try again.")
                }
            )
        }
    }
}

#Preview {
    ProfileView(user: User.kevinBarnes)
        .environmentObject(
            App(
                id: "marigold-ysffq",
                configuration: AppConfiguration(
                    baseURL: "https://realm.mongodb.com",
                    transport: nil,
                    localAppName: nil,
                    localAppVersion: nil
                )
            )
        )
}

struct NormalView: View {
    
    @ObservedRealmObject var user: User
    
    var body: some View {
        VStack {
            AsyncImage(
                url: URL(string: user.profileImageUrl)!,
                content: { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200, alignment: .center)
                        .clipShape(Circle())
                },
                placeholder: {
                    ProgressView()
                }
            )
            
            Text("\(user.firstName) \(user.lastName)")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text(user.email)
                .fontWeight(.light)
        }
        .padding()
    }
}

struct EditView: View {
    
    @ObservedRealmObject var user: User
    
    var body: some View {
        VStack {
            AsyncImage(
                url: URL(string: user.profileImageUrl)!,
                content: { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200, alignment: .center)
                        .clipShape(Circle())
                },
                placeholder: {
                    ProgressView()
                }
            )
            
            HStack {
                Text("First Name: ")
                
                TextField("First Name", text: $user.firstName)
                    .textFieldStyle(.roundedBorder)
            }
            
//            Text(user.email)
//                .fontWeight(.light)
        }
        .padding()
    }
}
