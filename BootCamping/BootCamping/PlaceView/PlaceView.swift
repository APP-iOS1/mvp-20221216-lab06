//
//  PlaceView.swift
//  BootCamping
//
//  Created by Donghoon Bae on 2022/11/14.
//

import SwiftUI

struct PlaceView: View {
    
    @EnvironmentObject var placeStore: PlaceStore
    var fecthData: FetchData = FetchData()
    
    @State var page: Int = 1
    @State private var isLoading: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Button { placeStore.selectedCategory = "all" } label: {
                    Text("#전체보기").padding(7).font(.subheadline)
                }
                .cornerRadius(10)
                
                Button { placeStore.selectedCategory = "일반야영장" } label: {
                    Text("#캠핑").padding(7).font(.subheadline)
                }
                .cornerRadius(10)
                
                Button { placeStore.selectedCategory = "자동차야영장" } label: {
                    Text("#차박").padding(7).font(.subheadline)
                }
                .cornerRadius(10)
                
                Button { placeStore.selectedCategory = "카라반" } label: {
                    Text("#카라반").padding(7).font(.subheadline)
                }
                
                .cornerRadius(10)
                
                Button { placeStore.selectedCategory = "글램핑" } label: {
                    Text("#글램핑").padding(7).font(.subheadline)
                }
                .cornerRadius(10)
            }
            .padding(.vertical)
            
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(Array(placeStore.returnPlaces().enumerated()), id: \.offset) { (index, place) in
                        NavigationLink(destination: PlaceDetailView(places: place)) {
                            PlaceCardView(places: place)
                        }
                        .onAppear {
                            if index == placeStore.returnPlaces().count - 1 {
                                Task {
                                    page += 1
                                    isLoading = true
                                    placeStore.places.append(contentsOf: try await fecthData.fetchData(page: page))
                                    isLoading = false
                                }
                            }
                        }
                    }
                }
                if isLoading == true {
                    ProgressView().frame(height: 100)
                }
            }
            
            .onAppear {
                Task {
                    isLoading = true
                    placeStore.places.append(contentsOf: try await fecthData.fetchData(page: page))
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("플레이스")
                        .font(.title).bold()
                        .accessibilityAddTraits(.isHeader)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //TODO: 북마크 구현
                    } label: {
                        Text("북마크")
                    }
                }
            }
        }
    }
}

struct PlaceView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PlaceView()
                .environmentObject(PlaceStore())
        }
    }
}
