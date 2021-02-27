//
//  ContentView.swift
//  Stimuglove App by Cipnia
//
//  Created by Michelle Chang on 2/20/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
      LoginView()
                
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
            ContentView()
        }
    }
}

struct LoginView : View {
    
    @StateObject var model = ModelData()
    var body: some View {
        
        VStack {
            VStack {
                Text("stimuglove")
                    .font(.system(size: 50, weight: .semibold, design: .rounded))
                    .foregroundColor(Color(#colorLiteral(red: 0.06, green: 0.16, blue: 0.56, alpha: 1)))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .offset(y:250)

                Text("therapy at your fingertips")
                    .font(.custom("Nunito-SemiBold", size: 18))
                    .fontWeight(.semibold)
                    .foregroundColor(Color(#colorLiteral(red: 0.25, green: 0.44, blue: 0.93, alpha: 1))).tracking(1.05)
                    .offset(y: 245)
            }
            
            Image("cover pic")
                //.resizable()
                    //.aspectRatio(contentMode: .fit)
                .scaleEffect(0.78)
                .offset(y:-160)
                .shadow(radius: 10)
            
            VStack(spacing:-5) {
                
                CustomTextField (image: "mail", placeHolder: "Email", txt: $model.email)
                 
                CustomTextField (image: "lock", placeHolder: "Password", txt: $model.password)
                
            }
            Spacer(minLength: 0)
            
        }
        
    }
    
}
            

struct CustomTextField : View {
    
        var image: String
        var placeHolder : String
        @Binding var txt : String
    
        var body : some View {
           
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center))  {
                
                //the icons for email and password
                Image(systemName: image)
                    .font(.system(size:25))
                    .foregroundColor(Color("bottom"))
                    .frame (width: 60, height: 60)
                    .background(Color.white.opacity(0.2))
                    .clipShape(Circle())
                
                //the surround oval where text is inputted
                ZStack{
                    if placeHolder == "Password" {
                        SecureField(placeHolder, text: $txt)
                    }
                    else{
                        TextField(placeHolder, text: $txt)
                    }
                }
                    .padding(.horizontal)
                    .padding(.leading)
                .frame(width:250, height: 50)
                    .background(Color.blue.opacity(0.15))
                    .clipShape(Capsule())
                    .offset(y: -120)
            }
            .padding(.horizontal)
        }
    }
        
        
    

//MVVM Model
class ModelData : ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
}



        
