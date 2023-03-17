//
//  ImageView.swift
//  QurbaTask
//
//  Created by Mahmoud Mostafa on 16/03/2023.
//

import SwiftUI

/*
 This struct is used to display the post image when the user clicks on the image in the feed
 */
struct ImageView: View {
    @ObservedObject var viewModel = HomePageViewModel()

    var body: some View {

        ZStack {
            Color.black
                .ignoresSafeArea()
            
            TabView(selection: $viewModel.selectedImageID){
                Image(viewModel.selectedImageID)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .overlay(
                Button(action:{
                    withAnimation(.default){
                        viewModel.showImageViewer.toggle()
                    }
                }, label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.white.opacity(0.35))
                        .clipShape(Circle())
                })
                .padding(10)
                ,alignment: .topTrailing
                )
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
