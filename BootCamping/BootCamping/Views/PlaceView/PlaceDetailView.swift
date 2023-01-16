//
//  PlaceDetailView.swift
//  BootCamping
//
//  Created by Donghoon Bae on 2022/11/14.
//

import SwiftUI
import CoreLocation
import MapKit
import SDWebImageSwiftUI

struct AnnotatedItem: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

struct PlaceDetailView: View {
    
    var places: Item
    @State var isSeleted: Bool = false
    
    @State private var isFavorite: Bool = false
    @State var annotatedItem: [AnnotatedItem] = []
    @State var region: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.5, longitude: 126.9),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    
    var body: some View {
        
        let filterName: String = String(Array(places.facltNm).filter { !"(주)".contains($0) })
        let encodedStr = filterName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        let images = ["jeju1", "jeju2", "jeju3"]
        
        ZStack {
            ScrollView {
                TabView {
//                    ForEach(images, id: \.self) { item in
//                        Image(item).resizable()
                        
                    WebImage(url: URL(string: places.firstImageUrl))
                            .resizable()
                        
//                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .frame(width: 400,height: 300)
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    Group {
                        Text("#\(places.induty)")
                            .font(.subheadline)
                        
                        Text("\(filterName)")
                            .font(.title)
                            .kerning(-0.5)
                            .padding(.vertical, 3)
                        
                        Text("\(Image(systemName: "star.fill")) 5.0점 (후기 4개)")
                            .font(.footnote)
                        
                        
                        HStack {
                            Text("\(places.addr1)")
                                .font(.footnote)
                                .foregroundColor(.gray)
                            Spacer()
                            Button {
                                isSeleted.toggle()
                            } label: {
                                Text("\(Image(systemName: "map.fill")) 경로 확인")
                                    .font(.footnote)
                            }.sheet(isPresented: $isSeleted, onDismiss: didDismiss) {
                                SafariView(url: URL(string: "https://m.map.naver.com/search2/search.naver?query=\(encodedStr!)") ?? URL(string: "https://m.map.naver.com")!)
                            }
                        }
                        .padding(.bottom, 20)
                        
                        Text("\(places.intro)").lineSpacing(7).font(.subheadline)
                        
                    }
                    Spacer()
                    Divider()
                    Spacer()
                    Group {
                        Text("편의시설 및 서비스").font(.callout).bold()
                        Image("facilities")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    Spacer()
                    Divider()
                    Group {
                        Text("위치 보기")
                            .font(.callout)
                            .bold()
                        NavigationLink {
                            FullMapView(annotatedItem: annotatedItem, region: region, places: places)
                        } label: {
                            Map(coordinateRegion: $region, interactionModes: [], annotationItems: annotatedItem) { item in
                                MapMarker(coordinate: item.coordinate, tint: .blue)
                            }
                            .frame(width: 330, height: 250)
                            .cornerRadius(10)
                            .padding(.horizontal, 20)
                        }
                        Text("클릭해서 확대")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    Divider()
                    Group {
                        Text("리뷰 모아보기").font(.callout).bold()
                        Spacer()
                        HStack {
                            Spacer()
                            VStack(alignment: . center) {
                                Text("현재 작성된 리뷰가 없어요.")
                                Text("첫 리뷰의 주인공이 되어보시는건 어떨까요?\n")
                            }.foregroundColor(.secondary).font(.subheadline)
                            Spacer()
                        }
                    }
                }.padding(.horizontal, 25)
            }.ignoresSafeArea(.all, edges: .top)
                .onAppear {
                    region.center = CLLocationCoordinate2D(latitude: Double(places.mapY)!, longitude: Double(places.mapX)!)
                    annotatedItem.append(AnnotatedItem(name: places.facltNm, coordinate: CLLocationCoordinate2D(latitude: Double(places.mapY)!, longitude: Double(places.mapX)!)))
                }
            
            ZStack {
                Link(destination: (URL(string: "\(places.resveUrl)") ?? URL(string: "https://m.map.naver.com/search2/search.naver?query=\(encodedStr!)"))!) {
                    Text("예약\n하기")
                        .foregroundColor(.white)
                        .padding()
                        .clipShape(Circle())
                }
            }.offset(x: 140, y: 280)
            
        }
        .navigationBarItems(trailing: Button {
            isFavorite.toggle()
        } label: {
            Image(systemName: isFavorite ? "bookmark.fill" : "bookmark").foregroundColor(isFavorite ? .yellow : .white).opacity(0.8)
        }
        )
        
    }
    func didDismiss() {
        
    }
    
}

//struct PlaceDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlaceDetailView(places: PlaceStore().places.first!)
//    }
//}
