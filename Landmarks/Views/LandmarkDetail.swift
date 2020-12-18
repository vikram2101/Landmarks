//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Vikram Nayak on 12/17/20.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    @State var isPlaying : Bool = false
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    Button(action: {
                           self.isPlaying.toggle()
                           Sounds.playSounds(soundfile: "aerodactylus.mp3")

                       }, label: {
                        if isPlaying {
                                 Image(systemName: "pause")
                                 .font(Font.system(.largeTitle).bold())
                        }else {
                             Image(systemName: "play.fill")
                              .font(Font.system(.largeTitle).bold())
                        }
                 })
                }
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Divider()

                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarks[0])
    }
}
