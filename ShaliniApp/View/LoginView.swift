//
//  LoginView.swift
//  Period_Final
//
//  Created by Shalu Garikapaty on 5/11/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//

import SwiftUI
import Firebase
//import GoogleSignIn

let newUserCollectionRef = Firestore.firestore().collection("user")



struct LoginView: View {
    let db = Firestore.firestore()
    
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    

    
    @ObservedObject private var users =
     FirebaseCollection<User>(collectionRef: newUserCollectionRef)
    
    var alert: Alert {
        Alert(title: Text("Result"), message: Text("Invalid User"), dismissButton: .default(Text("Dismiss")))
    }
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: .init(colors: [Color("Color"),Color("Color1"),Color("Color2")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            
            VStack{
                
                if status {
                    
                    Home()
                }
                else{
                    
                    Login()
                }
                
            }.animation(.spring())
                .onAppear {
                    
                    NotificationCenter.default.addObserver(forName: NSNotification.Name("statusChange"), object: nil, queue: .main) { (_) in
                        
                        let status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                        self.status = status
                    }
            }
            
            
        }
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

//MARK:- login

struct Login : View {
    
    @State var user = ""
    @State var pass = ""
    @State var msg = ""
    @State var alert = false
   // @Binding var show = false
    var body : some View{
        
        
        VStack{
            
            Image("login")
                .clipShape(Circle())
            
            Text("Sign In").fontWeight(.heavy).font(.largeTitle).padding([.top,.bottom], 20)
            
            VStack(alignment: .leading){
                
                VStack(alignment: .leading){
                    
                    Text("Username").font(.headline).fontWeight(.heavy).foregroundColor(Color.init(.label).opacity(0.75))
                    
                    HStack{
                        
                        TextField("Enter Your Username", text: $user)
                        
                        if user != ""{
                            
                            Image(systemName:"checkmark").foregroundColor(Color.init(.label))
                        }
                        
                    }
                    
                    Divider()
                    
                }.padding(.bottom, 15)
                
                VStack(alignment: .leading){
                    
                    Text("Password").font(.headline).fontWeight(.heavy).foregroundColor(Color.init(.label).opacity(0.75))
                    
                    SecureField("Enter Your Password", text: $pass)
                    
                    Divider()
                }
                
            }.padding(.horizontal, 6)
            //MARK:- logIn button
            Button(action: {
                
                signInWithEmail(email: self.user, password: self.pass) { (verified, status) in
                    
                    if !verified{
                        
                        self.msg = status
                        self.alert.toggle()
                    }
                    else{
                        
                        UserDefaults.standard.set(true, forKey: "status")
                        NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                    }
                }
                
            }) {
                
                Text("Sign In").foregroundColor(.black).frame(width: UIScreen.main.bounds.width - 120).padding()
                
                
            }.background(Color.blue)
                .clipShape(Capsule())
                .padding(.top, 45)
            
            bottomView()
            
        }.padding()
            .alert(isPresented: $alert) {
                
                Alert(title: Text("Error"), message: Text(self.msg), dismissButton: .default(Text("Ok")))
        }
    }
}
//MARK:- bottom signup button
struct bottomView : View{
    
    @State var show = false
    
    var body : some View{
            
            VStack{
                Text("(or)").foregroundColor(Color.white.opacity(0.5)).padding(.top,30)
                
                //   GoogleSignView().frame(width: 150, height: 55)
                
                HStack(spacing: 8){
                    
                    Text("Don't Have An Account ?").foregroundColor(Color.black.opacity(0.5)).fontWeight(.heavy)
                    
                    
                    Button(action: {
                        
                        self.show.toggle()
                        
                    }) {
                        
                        Text("Sign Up")
                        
                    }
                    .foregroundColor(.blue)
                    
                }.padding(.top, CGFloat(25))
                    .background(Color.pink.opacity(0.16))
                
                
            }
            .sheet(isPresented: $show) {
                Signup(show: self.$show)
            }
        }
   }
//MARK:-signup
struct Signup : View {

    @State var user = ""
    @State var pass = ""
    @State var alert = false
    @State var msg = ""
    @Binding var show : Bool

    var body : some View{


        VStack{
            Image("img") // img is the img name

            Text("Sign Up").fontWeight(.heavy).font(.largeTitle).padding([.top,.bottom], 20)

            VStack(alignment: .leading){

                VStack(alignment: .leading){

                    Text("Username").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))

                    HStack{

                        TextField("Enter Your Username", text: $user)

                        if user != ""{

                            Image("check").foregroundColor(Color.init(.label))
                        }

                    }

                    Divider()

                }.padding(.bottom, 15)

                VStack(alignment: .leading){

                    Text("Password").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))

                    SecureField("Enter Your Password", text: $pass)

                    Divider()
                }

            }
////            //MARK:- signup button
            Button(action: {

                signIupWithEmail(email: self.user, password: self.pass) { (verified, status) in

                    if !verified{

                        self.msg = status
                        self.alert.toggle()

                    }
                    else{

                        UserDefaults.standard.set(true, forKey: "status")

                        self.show.toggle()

                        NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                    }
                }

            }) {

                Text("Sign Up").foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 120).padding()


            }.disabled(user.isEmpty || pass.isEmpty)
            .background(Color.pink)
                .clipShape(Capsule())
                .padding(.top, 45)

        }.padding()
            .background(Color.pink.opacity(0.10))
            .alert(isPresented: $alert) {

                Alert(title: Text("Error"), message: Text(self.msg), dismissButton: .default(Text("Ok")))
        }
    }
}
//MARK:- HOME
struct Home : View {

    var body : some View{

        VStack(alignment: .leading){
            NavigationView {
                Form {
                    Section{
                
                Text("Flow")
                    .font(.title)
                    }
                    
                    Section{
                Text("Period Tracker logs your dates and calculates the start date of the period.Just enter the number of days your period lasts and know when your next period arrives")
                .lineLimit(nil)
                .allowsTightening(true)
                .font(.system(size: 15))
                foregroundColor(Color.pink.opacity(0.10))
                padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                  
                    }

                    Section{
//                        VStack(alignment: .leading){
                    Image(systemName: "lightbulb")
                    .clipShape(Rectangle())
                    
                    Text("This app tracker is not always accurate.The developer ios not responsible for unexpected frequency.")
                    .lineLimit(4)
                    .allowsTightening(true)
                    }
              //  }
                    .navigationBarItems(trailing:
                        HStack {
                            //EditButton()
                        Button(action: {


                            try! Auth.auth().signOut()
                            //       GIDSignIn.sharedInstance()?.signOut()
                            UserDefaults.standard.set(false, forKey: "status")
                            NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)

                        }){              Text("Logout")
                          }
                        
                    }    )
                    .foregroundColor(.black).frame(width: UIScreen.main.bounds.width - 120)
                    .padding()
               .background(Color.pink.opacity(0.10))
                    .clipShape(Capsule())
                    .padding(.top, 45)
                .scaledToFit()
                
                    }
                }
            }
        }
        
    }

//MARK:-GoogleSignIn
/***
 struct GoogleSignView : UIViewRepresentable {

 func makeUIView(context: UIViewRepresentableContext<GoogleSignView>) -> GIDSignInButton {

 let button = GIDSignInButton()
 button.colorScheme = .dark
 GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.last?.rootViewController
 return button

 }

 func updateUIView(_ uiView: GIDSignInButton, context: UIViewRepresentableContext<GoogleSignView>) {


 }
 }
 ***/
//MARK:- signIn func
func signInWithEmail(email: String,password : String,completion: @escaping (Bool,String)->Void){


    Auth.auth().signIn(withEmail: email, password: password) {

        (res, err) in

        if err != nil{

            completion(false,(err?.localizedDescription)!)
            return
        }

        completion(true,(res?.user.email)!)
    }
}
//MARK:- signUp func
func signIupWithEmail(email: String,password : String,completion: @escaping (Bool,String)->Void){
   //
//    let uid = Auth.auth().currentUser?.uid
//    let email = Auth.auth().currentUser?.email
    Auth.auth().createUser(withEmail:email, password: password) { (res, err) in
       let dictionary = ["username": email ]
        let values = [uid:dictionary]

        db.collection("users").addDocument(data: values as! [String : Any]) { err in

            if err != nil{

                completion(false,(err?.localizedDescription)!)
                return
            }

            completion(true,(res?.user.email)!)
        }
    }
}


