//
//  VTabNavigationView.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 12/26/20.
//

import SwiftUI

// MARK: - VTabNavigationView

/// Navigation component that switches between multiple views using interactive user interface elements.
///
/// Model can be passed as parameter.
///
/// Usage example:
///
///     @State var selection: Int = 0
///
///     var body: some View {
///         VTabNavigationView(
///             selection: $selection,
///             pageOne: VTabNavigationViewPage(
///                 item: .withAssetIcon(title: "Red", name: "Red"),
///                 content: Color.red
///             ),
///             pageTwo: VTabNavigationViewPage(
///                 item: .withAssetIcon(title: "Green", name: "Green"),
///                 content: Color.green
///             ),
///             pageThree: VTabNavigationViewPage(
///                 item: .withAssetIcon(title: "Blue", name: "Blue"),
///                 content: Color.blue
///             ),
///             pageFour: VTabNavigationViewPage(
///                 item: .withAssetIcon(title: "Pink", name: "Pink"),
///                 content: Color.pink
///             ),
///             pageFive: VTabNavigationViewPage(
///                 item: .withAssetIcon(title: "Orange", name: "Orange"),
///                 content: Color.orange
///             )
///         )
///     }
///
public struct VTabNavigationView<C0, C1, C2, C3, C4, C5>: View
    where
    C0: View,
    C1: View,
    C2: View,
    C3: View,
    C4: View,
    C5: View {
    // MARK: Lifecycle

    // MARK: Initializers

    /// Initializes component with selected index and six pages.
    public init(
        model: VTabNavigationViewModel = .init(),
        selection: Binding<Int>,
        pageOne: VTabNavigationViewPage<C0>,
        pageTwo: VTabNavigationViewPage<C1>,
        pageThree: VTabNavigationViewPage<C2>,
        pageFour: VTabNavigationViewPage<C3>,
        pageFive: VTabNavigationViewPage<C4>,
        pageSix: VTabNavigationViewPage<C5>
    ) {
        self.model = model
        _selection = selection
        self.pageOne = pageOne
        self.pageTwo = pageTwo
        self.pageThree = pageThree
        self.pageFour = pageFour
        self.pageFive = pageFive
        self.pageSix = pageSix
    }

    /// Initializes component with selected index and five pages.
    public init(
        model: VTabNavigationViewModel = .init(),
        selection: Binding<Int>,
        pageOne: VTabNavigationViewPage<C0>,
        pageTwo: VTabNavigationViewPage<C1>,
        pageThree: VTabNavigationViewPage<C2>,
        pageFour: VTabNavigationViewPage<C3>,
        pageFive: VTabNavigationViewPage<C4>
    )
        where C5 == Never {
        self.model = model
        _selection = selection
        self.pageOne = pageOne
        self.pageTwo = pageTwo
        self.pageThree = pageThree
        self.pageFour = pageFour
        self.pageFive = pageFive
        self.pageSix = nil
    }

    /// Initializes component with selected index and four pages.
    public init(
        model: VTabNavigationViewModel = .init(),
        selection: Binding<Int>,
        pageOne: VTabNavigationViewPage<C0>,
        pageTwo: VTabNavigationViewPage<C1>,
        pageThree: VTabNavigationViewPage<C2>,
        pageFour: VTabNavigationViewPage<C3>
    )
        where
        C4 == Never,
        C5 == Never {
        self.model = model
        _selection = selection
        self.pageOne = pageOne
        self.pageTwo = pageTwo
        self.pageThree = pageThree
        self.pageFour = pageFour
        self.pageFive = nil
        self.pageSix = nil
    }

    /// Initializes component with selected index and three pages.
    public init(
        model: VTabNavigationViewModel = .init(),
        selection: Binding<Int>,
        pageOne: VTabNavigationViewPage<C0>,
        pageTwo: VTabNavigationViewPage<C1>,
        pageThree: VTabNavigationViewPage<C2>
    )
        where
        C3 == Never,
        C4 == Never,
        C5 == Never {
        self.model = model
        _selection = selection
        self.pageOne = pageOne
        self.pageTwo = pageTwo
        self.pageThree = pageThree
        self.pageFour = nil
        self.pageFive = nil
        self.pageSix = nil
    }

    /// Initializes component with selected index and four pages.
    public init(
        model: VTabNavigationViewModel = .init(),
        selection: Binding<Int>,
        pageOne: VTabNavigationViewPage<C0>,
        pageTwo: VTabNavigationViewPage<C1>
    )
        where
        C2 == Never,
        C3 == Never,
        C4 == Never,
        C5 == Never {
        self.model = model
        _selection = selection
        self.pageOne = pageOne
        self.pageTwo = pageTwo
        self.pageThree = nil
        self.pageFour = nil
        self.pageFive = nil
        self.pageSix = nil
    }

    // MARK: Public

    // MARK: Body

    public var body: some View {
        TabView(selection: $selection, content: {
            if let page = pageOne { pageContent(page).tag(0) }
            if let page = pageTwo { pageContent(page).tag(1) }
            if let page = pageThree { pageContent(page).tag(2) }
            if let page = pageFour { pageContent(page).tag(3) }
            if let page = pageFive { pageContent(page).tag(4) }
            if let page = pageSix { pageContent(page).tag(5) }
        })
        .setUpTabNavigationViewAppearance(model: model)
    }

    // MARK: Private

    // MARK: Properties

    private let model: VTabNavigationViewModel

    @Binding
    private var selection: Int

    private let pageOne: VTabNavigationViewPage<C0>?
    private let pageTwo: VTabNavigationViewPage<C1>?
    private let pageThree: VTabNavigationViewPage<C2>?
    private let pageFour: VTabNavigationViewPage<C3>?
    private let pageFive: VTabNavigationViewPage<C4>?
    private let pageSix: VTabNavigationViewPage<C5>?

    private func pageContent<PageContent>(
        _ page: VTabNavigationViewPage<PageContent>
    ) -> some View
        where PageContent: View {
        let originalAccentColor = Color(UIColor(Color.accentColor).cgColor)

        return page.content
            .accentColor(originalAccentColor)
            .tabItem {
                switch page.item {
                case let .titled(title):
                    Text(title)

                case let .systemIcon(name):
                    Image(systemName: name).renderingMode(.template)

                case let .assetIcon(name, bundle):
                    Image(name, bundle: bundle).renderingMode(.template)

                case let .titledSystemIcon(title, name):
                    Text(title)
                    Image(systemName: name).renderingMode(.template)

                case let .titledAssetIcon(title, name, bundle):
                    Text(title)
                    Image(name, bundle: bundle).renderingMode(.template)
                }
            }
    }
}

// MARK: - VTabNavigationView_Previews

struct VTabNavigationView_Previews: PreviewProvider {
    // MARK: Internal

    static var previews: some View {
        VTabNavigationView<Color, Color, Color, Never, Never, Never>(
            model: .init(),
            selection: .constant(0),
            pageOne: pageOne,
            pageTwo: pageTwo,
            pageThree: pageThree
        )
    }

    // MARK: Private

    private static var pageOne: VTabNavigationViewPage<Color> { .init(
        item: .titled(title: "Red"),
        content: Color.red
    ) }
    private static var pageTwo: VTabNavigationViewPage<Color> { .init(
        item: .titled(title: "Green"),
        content: Color.green
    ) }
    private static var pageThree: VTabNavigationViewPage<Color> { .init(
        item: .titled(title: "Blue"),
        content: Color.blue
    ) }
}
