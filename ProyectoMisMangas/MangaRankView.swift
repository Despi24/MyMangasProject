//
//  MangaRank.swift
//  ProyectoMisMangas
//
//  Created by Alex Peinado Llopis on 21/12/23.
//

import SwiftUI

enum VoteRankViewSize: CGFloat {
    case small = 40
    case large = 100
}

struct MangaRankView: View {
    let manga: Manga
    var circleSize: VoteRankViewSize = .small
    @State var progress: Bool = false
    
    var body: some View {
        Circle()
            .trim(from: 0, to: progress ? (manga.score / 10) : 0)
            .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round))
            .rotation(.degrees(-90))
            .foregroundStyle(manga.scoreColor)
            .background {
                Text("\(manga.formattedScore)")
                    .font(circleSize == .small ? .caption : .title)
                    .bold()
                    .foregroundStyle(manga.scoreColor)
            }
            .background {
                Circle()
                    .stroke(lineWidth: 5)
                    .fill(Color.gray)
            }
            .background {
                Circle()
                    .fill(.white)
            }
            .frame(width: circleSize.rawValue, height: circleSize.rawValue)
            .offset(x: 8, y: 8)
            .onAppear {
                progress = true
            }
    }
}


#Preview {
    MangaRankView(manga: .testManga)
}
