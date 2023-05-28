//
//  ContentView.swift
//  Africa
//
//  Created by anduser on 03.05.2023.
//

import SwiftUI

struct ContentView: View {

    // MARK: - Properties

    let animals: [AnimalModel] = Bundle.main.decode(FileType.animals.filename)
    let haptics: UIImpactFeedbackGenerator = .init(style: .medium)

    @State private var gridLayout: [GridItem] = [ GridItem(.flexible()) ]
    @State private var grigColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"

    @State private var isGridViewActive: Bool = false

    // MARK: - Functions

    func gridSwitch() {
        withAnimation(.easeIn) {
            gridLayout = Array(
                repeating: .init(.flexible()),
                count: gridLayout.count % 3 + 1
            )
            grigColumn = gridLayout.count
        }
        switch grigColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"

        case 2:
            toolbarIcon = "square.grid.3x2"

        case 3:
            toolbarIcon = "rectangle.grid.1x2"

        default:
            toolbarIcon = "square.grid.2x2"
        }
    }

    // MARK: - Body

    var body: some View {
        VStack {
            NavigationView {
                Group {
                    if !isGridViewActive {
                        List {
                            CoverImageView()
                                .frame(height: 300)
                                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))

                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalListItemView(animal: animal)
                                } //: Nav Link
                            } //: Repeat
                        } //: List
                    } else {
                        ScrollView(.vertical, showsIndicators: false) {
                            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                                ForEach(animals) { animal in
                                    NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                        AnimalGridItemView(animal: animal)
                                    } //: Link
                                } //: Repeat
                            } //: VGrid
                            .padding()
                        } // Scroll
                    } //: Condition
                } //: Group
                .listStyle(.plain)
                .navigationTitle("Africa")
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack(spacing: 16) {
                            Button {
                                isGridViewActive = false
                                haptics.impactOccurred()
                            } label: {
                                Image(systemName: "square.fill.text.grid.1x2")
                                    .font(.title2)
                                    .foregroundColor(isGridViewActive ? .primary : .accentColor)
                            } // ListButton
                            Button {
                                isGridViewActive = true
                                haptics.impactOccurred()
                                gridSwitch()
                            } label: {
                                Image(systemName: toolbarIcon)
                                    .font(.title2)
                                    .foregroundColor(isGridViewActive ? .accentColor : .primary)
                            } // Grid Button
                        }
                    }
                } //: ToolBar
            } //: Nav
        } //: VStack
        .padding()
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
