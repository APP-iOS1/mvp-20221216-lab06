//
//  LicenseView.swift
//  BootCamping
//
//  Created by 차소민 on 2022/12/21.
//

import SwiftUI

struct LicenseView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                Text("1Password App Extension")
                    .bold()
                HStack{
                    Spacer()
                        .frame(width: 20)
                    VStack(alignment: .leading){
                        Text("https://github.com/AgileBits/onepassword-app-extension")
                        Text("Copyright 2014 AgileBits Inc.")
                        Text("MIT License")
                    }
                }
                .padding(.bottom)
                
                
                Text("abseil-cpp")
                    .bold()
                HStack{
                    Spacer()
                        .frame(width: 20)
                    VStack(alignment: .leading){
                        Text("https://github.com/abseil/abseil-cpp")
                        Text("Copyright 2017 The Abseil Authors.")
                        Text("Apache License 2.0")
                    }
                }
                .padding(.bottom)

                
                Text("ActiveRecord without CoreData")
                    .bold()
                HStack{
                    Spacer()
                        .frame(width: 20)
                    VStack(alignment: .leading){
                        Text("https://github.com/AlexDenisov/iActiveRecord/")
                        Text("Copyright 2012 Alexey Denisov")
                        Text("MIT License")
                    }
                }
                .padding(.bottom)
                
                Text("AFNetworking")
                    .bold()
                HStack{
                    Spacer()
                        .frame(width: 20)
                    VStack(alignment: .leading){
                        Text("https://github.com/AFNetworking/AFNetworking")
                        Text("Copyright 2011–2016 Alamofire Software Foundation (http://alamofire.org/)")
                        Text("MIT License")
                    }
                }
                .padding(.bottom)
                
                Group{
                    Text("Alamofire")
                        .bold()
                    HStack{
                        Spacer()
                            .frame(width: 20)
                        VStack(alignment: .leading){
                            Text("https://github.com/Alamofire/Alamofire")
                            Text("Copyright 2014-2018 Alamofire Software Foundation (http://alamofire.org/)")
                            Text("MIT License")
                        }
                    }
                    .padding(.bottom)
                    
                    Text("AloeStackView")
                        .bold()
                    HStack{
                        Spacer()
                            .frame(width: 20)
                        VStack(alignment: .leading){
                            Text("https://github.com/airbnb/AloeStackView")
                            Text("Copyright 2018 Airbnb, Inc.")
                            Text("Apache License 2.0")
                        }
                    }
                    .padding(.bottom)
                    
                    Text("Apple Swift")
                        .bold()
                    HStack{
                        Spacer()
                            .frame(width: 20)
                        VStack(alignment: .leading){
                            Text("http://github.com/apple/swift/")
                            Text("Copyright 2014-2017 Apple Inc. and the Swift project authors")
                            Text("Apache License 2.0")
                        }
                    }
                    .padding(.bottom)
                    
                }

            }
        }
        /*
         
        
         APNGKit
         https://github.com/onevcat/APNGKit
         Copyright 2015 Wei Wang
         MIT License
         
         Appcelerator Titanium Mobile
         https://github.com/appcelerator/titanium_mobile/
         Copyright 2008-2017 Appcelerator, Inc.
         Apache License 2.0
         
         Apple Frameworks
         https://developer.apple.com/documentation
         Copyright 2018 Apple Inc.
         Apple MIT License
         
         Apple iOS Developer - Sample Code
         https://developer.apple.com/library/archive/navigation/#section=Resource%20Types&topic=Sample%20Code
         Copyright 2016 Apple Inc
         Apple MIT License
         
         
         
         Atomic
         https://github.com/Adlai-Holler/Atomic
         Copyright 2015 Adlai Holler
         MIT License
         */
    }
}

struct LicenseView_Previews: PreviewProvider {
    static var previews: some View {
        LicenseView()
    }
}
