import SwiftUI
import PlaygroundSupport
import AVKit

struct ContentView1: View {
    
    /// BALLOON ELEMENTS
    @State private var balloon = false
    @State private var ambassador = false
    @State private var scale = 1.4
    @State private var paper = false

    /// KING
    @State private var king = false
    @State private var speech = false
    @State private var kingSpeak = false
    
    @State private var kingHand = false
    @State private var speechHand = false
    @State private var kingHandSpeak = false
    
    /// MONKEY
    @State private var monkey = false
    
    /// EXIT
    @State private var exit = true

    /// TEXT ELEMENTS
    @State private var dialogue = false
    @State private var text = false
    @State private var textElement = 0
    
    let textArray = ["Meanwhile, a powerful king heard about a macaque able to use an unknown and wonderful technology.", "So he started to looking for this macaque and he found him not very far from the city walls, at the edges of the jungle.", "The king promised the macaque to give him the title of ambassador. He would have given him riches, glory and everything he could possibly wanted. BUT ...", "The macaque would have had a special role. He wasn't supposed to have relationships with the neighbors, but he was supposed to teach the king how to use the Mac.", "The macaque without hesitation accepted the king's proposal and together they walked towards the city walls."]
    
    /// AUDIO
    @State var audioBackground: AVAudioPlayer!
    @State var audioText: AVAudioPlayer!

    /// TAP
    @State private var blockTap = false


    var body: some View {
        
            ZStack{
                /// BACKGROUND WITH BACKGROUND SOUND
                Image(uiImage: UIImage(named: "Background")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit )
                    .frame(width: 600)
                    .onAppear{DispatchQueue.main.asyncAfter(deadline: .now()){
                        withAnimation{
                            let soundBackground = Bundle.main.path(forResource: "Sound_background", ofType: "mp3")
                            self.audioBackground = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundBackground!))
                            self.audioBackground.play()
                            self.audioBackground.numberOfLoops = -1
                            self.audioBackground.volume = 0.3
                        }
                        }
                    }
    
                /// BALLOON ELEMENTS
                Group{
                Image(uiImage: UIImage(named: "Balloon")!)
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit )
                    .frame(width: 300)
                    .position(x: 270 , y: 190)
                    .opacity(balloon ? 1 : 0)
                    .animation(.easeInOut(duration: 0.5),value: balloon)
                
                Image(uiImage: UIImage(named: "Monkey_Ambassador")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 65)
                    .position(x: 380, y: 150)
                    .opacity(ambassador ? 1 : 0)
                    .scaleEffect(scale, anchor: .topTrailing)
                    .animation(.easeInOut(duration: 0.5),value: ambassador)
                    .animation(.easeIn(duration: 1),value: scale)
                
                Image(uiImage: UIImage(named: "Paper")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 225)
                    .position(x: 303 , y: 254)
                    .opacity(paper ? 1 : 0)
                    .animation(.easeIn(duration: 0.3), value: paper)
                }
                
                /// KING IMAGE
                Group {
                Image(uiImage: UIImage(named: "King_1")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit )
                    .frame(width: 110)
                    .position(x: 100, y: 400)
                    .offset(x : king ? 0 : -200)
                    .onAppear{DispatchQueue.main.asyncAfter(deadline: .now()){
                        withAnimation(.easeInOut(duration: 2.5)){
                            king.toggle()}}
                    }
                    .offset(x : exit ? 0 : -200)
                    .animation(.easeInOut(duration: 2).delay(1.5), value: exit)
                    
                if speech == true{
                    Image(uiImage: UIImage(named: "King_2")!)
                        .resizable()
                        .aspectRatio(contentMode: .fit )
                        .frame(width: 110)
                        .position(x: 100, y: 400)
                        .opacity(kingSpeak ? 0: 1)
                        .onAppear{DispatchQueue.main.asyncAfter(deadline: .now() + 1 ){
                            withAnimation(.easeInOut (duration: 0.5)
                                            .repeatForever()){
                                kingSpeak.toggle()}}
                        }
                }
                
                Image(uiImage: UIImage(named: "King_3")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit )
                    .frame(width: 143)
                    .position(x: 116, y: 400)
                    .opacity(kingHand ? 1 : 0)
                    .animation(.easeIn(duration: 0), value: kingHand)
                    
                    if speechHand == true{
                        Image(uiImage: UIImage(named: "King_4")!)
                        .resizable()
                        .aspectRatio(contentMode: .fit )
                        .frame(width: 143)
                        .position(x: 116, y: 400)
                        .opacity(kingHandSpeak ? 0: 1)
                        .onAppear{
                            DispatchQueue.main.asyncAfter(deadline: .now() ){
                            withAnimation(.easeInOut (duration: 0.5)
                                            .repeatForever()){
                                kingHandSpeak.toggle()
                                }
                            }}
                    }
                    
                }

                ///  MONKEY
                Image(uiImage: UIImage(named: "Monkey")!)
                .resizable()
                .aspectRatio(contentMode: .fit )
                .frame(width: 200)
                .position(x: 300, y: 460)
                .offset(x : monkey ? 0 : 380)
                .animation(.easeInOut(duration: 2.5),value: monkey)
                .offset(x : exit ? 0 : -400)
                .animation(.easeInOut(duration: 2.5).delay(1.5), value: exit)
                
                ///  TEXT ELEMENTS
                Image(uiImage: UIImage(named: "Dialogue")!)
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit )
                    .frame(width: 580)
                    .position(x: 300, y: 530)
                    .opacity(dialogue ? 1 : 0)
                    .animation(.easeIn(duration: 1.2), value: dialogue)
                    .onAppear{DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                        dialogue.toggle()}
                    }
                
                Text(textArray[textElement])
                    .bold()
                    .frame(width: 530)
                    .position(x: 300, y: 530)
//                    .foregroundColor(Color(red: 117 / 255, green: 76 / 255, blue: 37 / 255))
                    .foregroundColor(Color(red: 83 / 255, green: 55 / 255, blue: 25 / 255))
                    .multilineTextAlignment(.center)
                    .opacity(text ? 1 : 0)
                    .animation(.easeIn(duration: 0.5).delay(0.5), value: text)
                    .onAppear{DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                        text.toggle()
                        blockTap.toggle()
                        
                        let soundText1 = Bundle.main.path(forResource: "Sound_Text1", ofType: "mp3")
                        self.audioText = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundText1!))
                        self.audioText.play()
                    }
                    }

            }.onTapGesture {
                if textElement < textArray.count - 1{
                    textElement = textElement + 1

                    if textElement == 1 {
                        monkey.toggle()
                        let soundText2 = Bundle.main.path(forResource: "Sound_Text2", ofType: "mp3")
                        self.audioText = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundText2!))
                        self.audioText.play()
                    }
                    
                    if textElement == 2 {
                        speech.toggle()
                        balloon.toggle()
                        ambassador.toggle()
                        let soundText3 = Bundle.main.path(forResource: "Sound_Text3", ofType: "mp3")
                        self.audioText = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundText3!))
                        self.audioText.play()
                    }
                    
                    if textElement == 3 {
                        scale = 1.10
                        paper.toggle()
                        king.toggle()
                        speech.toggle()
                        speechHand.toggle()
                        kingHand.toggle()
                        let soundText4 = Bundle.main.path(forResource: "Sound_Text4", ofType: "mp3")
                        self.audioText = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundText4!))
                        self.audioText.play()
                    }
                    
                    if textElement == 4 {
                        balloon.toggle()
                        ambassador.toggle()
                        paper.toggle()
                        king.toggle()
                        speechHand.toggle()
                        kingHand.toggle()
                        let soundText5 = Bundle.main.path(forResource: "Sound_Text5", ofType: "mp3")
                        self.audioText = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundText5!))
                        self.audioText.play()
                    }
                    
                } else{
                    exit.toggle()
                    dialogue.toggle()
                    text.toggle()
                    blockTap.toggle()
                }
                }.allowsHitTesting(blockTap)
    }
}


PlaygroundPage.current.setLiveView(ContentView1())
