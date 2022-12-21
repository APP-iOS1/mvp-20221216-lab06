//
//  PlaceListView.swift
//  BootCamping
//
//  Created by Deokhun KIM on 2022/12/21.


import SwiftUI

struct PlaceListView: View {
    @State private var selectedPicker: PlaceTapInfo = .all
    @Namespace private var animation
    
    @Environment(\.colorScheme) var scheme
    @EnvironmentObject var placeStore: PlaceStore
    var fecthData: FetchData = FetchData()
    
    @State var page: Int = 1
    @State private var isLoading: Bool = false
    
    var body: some View {
            VStack{
                animate()
                PlaceTapView(placeTap: selectedPicker)
                
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
                .navigationBarBackButtonHidden(true)
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


    @State private var isSheeting: Bool = false
    @ViewBuilder
    
    private func animate() -> some View {
        VStack {
            HStack {
                ForEach(PlaceTapInfo.allCases, id: \.self) { item in
                    VStack {
                        Button {
                            if item == PlaceTapInfo.all {
                                selectedPicker = item
                                placeStore.selectedCategory = "all"
                            }
                            else if item == PlaceTapInfo.camping {
                                selectedPicker = item
                                placeStore.selectedCategory = "일반야영장"
                            }
                            else if item == PlaceTapInfo.glamping {
                                selectedPicker = item
                                placeStore.selectedCategory = "글램핑"
                            }
                            else if item == PlaceTapInfo.carbak {
                                selectedPicker = item
                                placeStore.selectedCategory = "자동차야영장"
                            }
                            else if item == PlaceTapInfo.caravan {
                                selectedPicker = item
                                placeStore.selectedCategory = "카라반"
                            }
                            
                        } label: {
                            Text(item.rawValue)
                                .font(.callout)
                                .kerning(-1)
                                .frame(maxWidth:100, maxHeight: 15)
                                .foregroundColor(selectedPicker == item ? .black : .gray)
                        }
                        
                        if selectedPicker == item {
                            Capsule()
                                .foregroundColor(.black)
                                .frame(height: 2)
                                .matchedGeometryEffect(id: "info", in: animation)
                        }
                        
                    }
                    .frame(width: 55)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            self.selectedPicker = item
                        }
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
        }
    }
}

enum PlaceTapInfo : String, CaseIterable {
    case all = "전체보기"
    case camping = "캠핑"
    case glamping = "글램핑"
    case carbak = "차박"
    case caravan = "카라반"
}


struct PlaceTapView : View {
    var placeTap : PlaceTapInfo
    @EnvironmentObject var placeStore: PlaceStore
    
    var body: some View {
        VStack {
            switch placeTap {
            case .all:
                EmptyView()
            case .camping:
                EmptyView()
            case .glamping:
                EmptyView()
            case .carbak:
                EmptyView()
            case .caravan:
                EmptyView()
            }
        }
    }
}

//struct PlaceListView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlaceListView()
//    }
//}
