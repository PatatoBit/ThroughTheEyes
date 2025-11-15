//
//  Dyslexia.swift
//  through the eyes
//
//  Created by Patato on 12/11/25.
//

import SwiftUI
internal import Combine

struct Dyslexia: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack (alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("Dyslexia").font(.largeTitle).bold()
                        Text("is a learning disorder that involves difficulty reading due to problems identifying speech sounds and learning how they relate to letters and words")
                    }
                    
                    Divider()
                    
                    DyslexiaSimulator()
                }
                .frame(maxHeight: .infinity)
                .padding()
            }
        }
    }
}


struct DyslexiaSimulator: View {
    @State private var intensity: Double = 0.5  // controls update frequency (0 to 1)
    @State private var displayedText: String = ""
    @State private var sheetOpened = true
    
    let sampleText = """
    Dyslexia is a common learning disorder that primarily affects reading skills. Individuals with dyslexia often experience difficulty in recognizing speech sounds and connecting them to corresponding letters and words.
    
    This disorder is neurological in origin and is not related to intelligence; many people with dyslexia have average or above-average intelligence but struggle with reading fluency and comprehension.
    
    People with dyslexia tend to experience challenges such as letter movement illusions, word recognition difficulties, and slower reading pace. These symptoms arise because the brain processes written language differently, making it harder to decode words quickly and accurately.
    """
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Test yourself!")
                .font(.title)
            
            Text(displayedText)
                .font(.body)
                .fixedSize(horizontal: false, vertical: true)
                .animation(.default, value: displayedText)
        }
        .frame(maxHeight: .infinity)
        .padding(EdgeInsets(top: 30, leading: 0, bottom: 300, trailing: 0))
        .onAppear {
            displayedText = sampleText
        }
        .onReceive(timer) { _ in
            let reshuffleChance = intensity
            if Double.random(in: 0...1) < reshuffleChance {
                displayedText = jumbleTextByParagraphs(sampleText)
            }
        }
        .sheet(isPresented: $sheetOpened) {
            VStack {
                VStack(alignment: .leading) {
                    Text("Adjust Intensity")
                    Slider(value: $intensity, in: 0...1)
                    
                    Spacer()
                }
                .padding(EdgeInsets(top: 40, leading: 25, bottom: 25, trailing: 25))
            }
            .presentationDetents([.fraction(0.3), .medium])
            .presentationBackgroundInteraction(.enabled)
            .interactiveDismissDisabled(true)
        }
    }
    
    func jumbleTextByParagraphs(_ text: String) -> String {
        let paragraphs = text.components(separatedBy: "\n\n")
        let jumbledParagraphs = paragraphs.map { paragraph in
            jumbleParagraph(paragraph, chance: 0.3)
        }
        return jumbledParagraphs.joined(separator: "\n\n")
    }
    
    func jumbleParagraph(_ paragraph: String, chance: Double) -> String {
        let words = paragraph.components(separatedBy: .whitespacesAndNewlines)
        let jumbledWords = words.map { word -> String in
            if Double.random(in: 0...1) < chance {
                return jumbleWord(word: word)
            } else {
                return word
            }
        }
        return jumbledWords.joined(separator: " ")
    }
    
    func jumbleWord(word: String) -> String {
        guard word.count > 3 else { return word }
        
        let first = word.first!
        let last = word.last!
        let middleChars = Array(word.dropFirst().dropLast())
        let shuffledMiddle = middleChars.shuffled()
        
        return String(first) + String(shuffledMiddle) + String(last)
    }
}



#Preview {
    Dyslexia()
}
