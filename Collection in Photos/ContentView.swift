//
//  ContentView.swift
//  Collection in Photos
//
//  Created by Boris R on 17/04/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var photos: [PhotoDate] = [
        PhotoDate(titlePhoto: "Erik Killmonger", nameImage: "Killmonger", descriptionImagem: "Wakandano, atualmente mercenário e líder tribal. É formado com doutorado em engenharia pelo Instituto de Tecnologia de Massachusetts - MIT e pós-graduação em economia política."),
        PhotoDate(titlePhoto: "Mabel" , nameImage: "Mabel", descriptionImagem:
                    "Atualmente no fundamental, uma garotinha cheia de energia, que gosta muito de romances adolescentes. Em sua vida, vivenciou diversas aventuras misteriosas, obscuras e perigosas, porém sem nenhum romance até o momento."),
        PhotoDate(titlePhoto: "Virgil Hawkins", nameImage: "Super Choque", descriptionImagem: "Aluno normal do ensino médio no colégio Dakota Union, sofreu um acidente envolvendo um gás que fez com que o garoto adquirisse poderes de eletricidade. Decidiu ajudar a sua cidade e comunidade com seus novos poderes com a ajudante de seu melhor amigo Gear."),
        PhotoDate(titlePhoto: "Woody", nameImage: "Woody", descriptionImagem: "Cowboy, menos corajoso do que aparenta ser, porém esforça-se ao máximo quando seus amigos estão em perigo. Gosta de alegrar a vida de crianças contando histórias e sendo um bom amigo."),
        PhotoDate(titlePhoto: "Monkey D. Luffy", nameImage: "Luffy", descriptionImagem: "Capitão da tripulação pirata nomeada Os Chapéus de Palha. Tem como objetivo tornar-se o Rei dos Piratas, porque assim terá o que mais almeja, a verdadeira liberdade.")
    ]
    @State var selectPhoto: Int = 0
    @State private var ShowingFullPhoto = false
    
    var body: some View {
        ScrollView{
            VStack{
                Text ("Personagens")
                    .font(.largeTitle)
                    .foregroundColor(.accentColor)
                    .padding()
                HStack (alignment: .top){
                    Image(photos[selectPhoto].nameImage)
                        .resizable() // redimenciona a imagem
                        .scaledToFit()  // preencher
                        .frame(maxWidth: .infinity, maxHeight: 6000)
                        .clipped()
                    VStack{
                        ForEach((0..<photos.count), id: \.self ){ i in
                            if i != selectPhoto {
                                Image(photos[i].nameImage)
                                    .resizable() // redimenciona a imagem
                                    .scaledToFit()
                                    .frame(width: 100,height: 100)
                                    .onTapGesture {
                                        selectPhoto = i
                                    }
                                
                            }
                        }
                    }
                }
                .padding()
                Text (photos[selectPhoto].titlePhoto)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.trailing)
                    .foregroundColor(.accentColor)
                
                Text(photos[selectPhoto].descriptionImagem)
                    .font(.callout)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Button ("Mosta a Foto"){
                    ShowingFullPhoto = true
                }
            }
        }
        .sheet(isPresented: $ShowingFullPhoto){
            FullPhoto(photo: $photos[selectPhoto],isPresented: $ShowingFullPhoto)
        }
    }
    
    struct PhotoDate {
             var titlePhoto: String
             var nameImage: String
             var descriptionImagem: String
         }
    
    struct FullPhoto: View {
        @Binding var photo: PhotoDate
        @Binding var isPresented: Bool
        
        
        var body: some View{
            ScrollView{
                VStack{
                    HStack{
                        Spacer()
                        Button ("Voltar") {
                            isPresented = false
                        }
                    }
                    .padding(20)
                    Image(photo.nameImage)
                        .resizable() // redimensiona
                        .scaledToFit()// preencher
     //                 .frame(minWidth: .infinity)
                    Spacer()
                }
                .padding()
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
