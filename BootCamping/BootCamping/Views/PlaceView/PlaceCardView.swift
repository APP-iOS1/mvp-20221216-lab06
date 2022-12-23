//
//  PlaceCardView.swift
//  BootCamping
//
//  Created by Donghoon Bae on 2022/11/14.
//

import SwiftUI

struct PlaceCardView: View {
    
    @Environment(\.colorScheme) var scheme
    var places: Item
    
    var body: some View {
        HStack {
            Image("jeju1")
                .resizable()
                .frame(width: 150, height: 150)
                .padding(.trailing,10)
            VStack(alignment: .leading, spacing: 5) {
                Group {
                    //제목
                    HStack {
                        Text("\(String(Array(places.facltNm).filter { !"(주)".contains($0) }))")
                            .font(.title2)
                            .kerning(-0.5)
                        Spacer()
                        Image(systemName: "bookmark")
                            .font(.body)
                            .foregroundColor(.secondary)
                            
                    }
                    
                    //정보
                    if places.intro == "" {
                        Text("정보 없음")
                            .lineSpacing(7)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                        
                    } else {
                        Text("\(places.lineIntro)")
                            .font(.subheadline)
                            .lineSpacing(7)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                    }
                    
                    Spacer()
                    
                    Text("\(Image(systemName: "star.fill").renderingMode(.original)) 5.0점 (후기 4개)")
                        .font(.footnote)
                    
                    HStack {
                        Text("\(Image(systemName: "mappin.circle.fill")) \(places.addr1)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .lineLimit(1)
                    }
                }
            }
            .padding(.vertical, 10)
            .padding(.trailing, 30)
            .frame(width: 235, height: 150)

        }
        .padding(.vertical, 10)
        
    }
}

struct PlaceCardView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceCardView(places: Item(contentId: "a", facltNm: "a", lineIntro: "a", intro: "a", allar: "a", insrncAt: "a", trsagntNo: "a", bizrno: "a", facltDivNm: "a", mangeDivNm: "a", mgcDiv: "a", manageSttus: "a", hvofBgnde: "a", hvofEnddle: "a", featureNm: "a", induty: "a", lctCl: "a", doNm: "a", sigunguNm: "a", zipcode: "a", addr1: "a", addr2: "a", mapX: "a", mapY: "a", direction: "a", tel: "a", homepage: "a", resveUrl: "a", resveCl: "a", manageNmpr: "a", gnrlSiteCo: "a", autoSiteCo: "a", glampSiteCo: "a", caravSiteCo: "a", indvdlCaravSiteCo: "a", sitedStnc: "a", siteMg1Width: "a", siteMg2Width: "a", siteMg3Width: "a", siteMg1Vrticl: "a", siteMg2Vrticl: "a", siteMg3Vrticl: "a", siteMg1Co: "a", siteMg2Co: "a", siteMg3Co: "a", siteBottomCl1: "a", siteBottomCl2: "a", siteBottomCl3: "a", siteBottomCl4: "a", siteBottomCl5: "a", tooltip: "a", glampInnerFclty: "a", caravInnerFclty: "a", prmisnDe: "a", operPdCl: "a", operDeCl: "a", trlerAcmpnyAt: "a", caravAcmpnyAt: "a", toiletCo: "a", swrmCo: "a", wtrplCo: "a", brazierCl: "a", sbrsCl: "a", sbrsEtc: "a", posblFcltyCl: "a", posblFcltyEtc: "a", clturEventAt: "a", clturEvent: "a", exprnProgrmAt: "a", exprnProgrm: "a", extshrCo: "a", frprvtWrppCo: "a", frprvtSandCo: "a", fireSensorCo: "a", themaEnvrnCl: "a", eqpmnLendCl: "a", animalCmgCl: "a", tourEraCl: "a", firstImageUrl: "a", createdtime: "a", modifiedtime: "a"))
    }
}
