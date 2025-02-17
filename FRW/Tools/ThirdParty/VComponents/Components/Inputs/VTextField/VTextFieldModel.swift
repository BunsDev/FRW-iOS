//
//  VTextFieldModel.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 1/19/21.
//

import SwiftUI

// MARK: - V Text Field Model

/// Model that describes UI.
public struct VTextFieldModel {
    // MARK: Lifecycle

    /// Initializes model with default values.
    public init() {}

    // MARK: Public

    // MARK: Layout

    /// Sub-model containing layout properties.
    public struct Layout {
        // MARK: Lifecycle

        // MARK: Initializers

        /// Initializes sub-model with default values.
        public init() {}

        // MARK: Public

        // MARK: Text Alignment

        /// Enum that describes text alignment, such as `leading`, `center`, `trailing`, or `auto`.
        public typealias TextAlignment = VBaseTextFieldModel.Layout.TextAlignment

        // MARK: Properties

        /// Textfield height. Defaults to `50`.
        public var height: CGFloat = 50

        /// Textfield corner radius. Defaults to `10`.
        public var cornerRadius: CGFloat = 10

        /// Textfield text alignment. Defaults to `default`.
        public var textAlignment: TextAlignment = .default

        /// Textfield border width. Defaults to `1.5`.
        public var borderWidth: CGFloat = 1.5

        /// Content horizontal margin. Defaults to `15`.
        public var contentMarginHorizontal: CGFloat = 15

        /// Search icon dimension. Defaults to `15`.
        public var searchIconDimension: CGFloat = 15

        /// Clear button dimension. Defaults to `22`.
        public var clearButtonDimension: CGFloat = 22

        /// Clear button  icon dimension. Defaults to `8`.
        public var clearButtonIconDimension: CGFloat = 8

        /// Visibility button dimension. Defaults to `22`.
        public var visibilityButtonDimension: CGFloat = 22

        /// Visibility button  icon dimension. Defaults to `8`.
        public var visibilityButtonIconDimension: CGFloat = 20

        /// Spacing between text and buttons. Defaults to `10`.
        public var contentSpacing: CGFloat = 10

        /// Spacing between header and picker, and picker and footer. Defaults to `3`.
        public var headerFooterSpacing: CGFloat = segmentedPickerReference.layout
            .headerFooterSpacing

        /// Header and footer horizontal margin. Defaults to `10`.
        public var headerFooterMarginHorizontal: CGFloat = segmentedPickerReference.layout
            .headerFooterMarginHorizontal
    }

    // MARK: Colors

    /// Sub-model containing color properties.
    public struct Colors {
        // MARK: Lifecycle

        // MARK: Initializers

        /// Initializes sub-model with default values.
        public init() {}

        // MARK: Public

        // MARK: State Colors

        /// Sub-model containing colors for component states.
        public typealias StateColors = StateColors_EFD

        // MARK: State Opacities

        /// Sub-model containing opacities for component states.
        public typealias StateOpacities = StateOpacities_D

        // MARK: State Colors and Opacities

        /// Sub-model containing colors and opacities for component states.
        public typealias StateColorsAndOpacities = StateColorsAndOpacities_EPD_PD

        // MARK: State Colors Highlighted

        /// Sub-model containing colors for component states.
        public typealias StateColorsHighlighted = StateColors_EFSED

        // MARK: Button State Colors Highlighted

        /// Sub-model containing colors for component states.
        public typealias ButtonStateColorsHighlighted = StateColors_EFSEPD

        // MARK: Button State Colors and Opacities Highlighted

        /// Sub-model containing colors and opacities for component states.
        public typealias ButtonStateColorsAndOpacitiesHighlighted =
            StateColorsAndOpacities_EFSEPD_PD

        // MARK: Properties

        /// Content opacitis.
        public var content: StateOpacities = .init(
            disabledOpacity: 0.5
        )

        /// Text content colors.
        public var textContent: StateColors = .init(
            enabled: ColorBook.primary,
            focused: ColorBook.primary,
            disabled: ColorBook.primary
        )

        /// Background colors.
        public var background: StateColorsHighlighted = .init(
            enabled: segmentedPickerReference.colors.background.enabled,
            focused: .init(componentAsset: "TextField.Background.focused"),
            success: .init(componentAsset: "TextField.Background.success"),
            error: .init(componentAsset: "TextField.Background.error"),
            disabled: segmentedPickerReference.colors.background.disabled
        )

        /// Border colors.
        public var border: StateColorsHighlighted = .init(
            enabled: .clear,
            focused: .clear,
            success: .init(componentAsset: "TextField.Border.success"),
            error: .init(componentAsset: "TextField.Border.error"),
            disabled: .clear
        )

        /// Header colors.
        public var header: StateColorsHighlighted = .init(
            enabled: segmentedPickerReference.colors.header.enabled,
            focused: segmentedPickerReference.colors.header.enabled,
            success: .init(componentAsset: "TextField.Border.success"),
            error: .init(componentAsset: "TextField.Border.error"),
            disabled: segmentedPickerReference.colors.header.disabled
        )

        /// Footer colors.
        public var footer: StateColorsHighlighted = .init(
            enabled: segmentedPickerReference.colors.footer.enabled,
            focused: segmentedPickerReference.colors.footer.enabled,
            success: .init(componentAsset: "TextField.Border.success"),
            error: .init(componentAsset: "TextField.Border.error"),
            disabled: segmentedPickerReference.colors.footer.disabled
        )

        /// Search icon colors.
        public var searchIcon: StateColorsHighlighted = .init(
            enabled: segmentedPickerReference.colors.header.enabled,
            focused: segmentedPickerReference.colors.header.enabled,
            success: .init(componentAsset: "TextField.Border.success"),
            error: .init(componentAsset: "TextField.Border.error"),
            disabled: segmentedPickerReference.colors.header.disabled
        )

        /// Visiblity button icon colors.
        public var visibilityButtonIcon: ButtonStateColorsAndOpacitiesHighlighted = .init(
            enabled: segmentedPickerReference.colors.header.enabled,
            focused: segmentedPickerReference.colors.header.enabled,
            success: .init(componentAsset: "TextField.Border.success"),
            error: .init(componentAsset: "TextField.Border.error"),
            pressedEnabled: segmentedPickerReference.colors.header.enabled,
            pressedFocused: segmentedPickerReference.colors.header.enabled,
            pressedSuccess: .init(componentAsset: "TextField.Border.success"),
            pressedError: .init(componentAsset: "TextField.Border.error"),
            disabled: segmentedPickerReference.colors.header.disabled,
            pressedOpacity: squareButtonReference.colors.content.pressedOpacity,
            disabledOpacity: squareButtonReference.colors.content.disabledOpacity
        )

        /// Clear button background colors.
        public var clearButtonBackground: ButtonStateColorsHighlighted = .init(
            enabled: .init(componentAsset: "TextField.ClearButton.Background.enabled"),
            focused: .init(componentAsset: "TextField.ClearButton.Background.enabled"),
            success: .init(componentAsset: "TextField.Border.success"),
            error: .init(componentAsset: "TextField.Border.error"),
            pressedEnabled: .init(componentAsset: "TextField.ClearButton.Background.pressed"),
            pressedFocused: .init(componentAsset: "TextField.ClearButton.Background.pressed"),
            pressedSuccess: .init(componentAsset: "TextField.Border.success"),
            pressedError: .init(componentAsset: "TextField.Border.error"),
            disabled: .init(componentAsset: "TextField.ClearButton.Background.disabled")
        )

        /// Clear button icon colors.
        public var clearButtonIcon: ButtonStateColorsAndOpacitiesHighlighted = .init(
            enabled: .init(componentAsset: "TextField.ClearButton.Icon"),
            focused: .init(componentAsset: "TextField.ClearButton.Icon"),
            success: .init(componentAsset: "TextField.ClearButton.Icon"),
            error: .init(componentAsset: "TextField.ClearButton.Icon"),
            pressedEnabled: .init(componentAsset: "TextField.ClearButton.Icon"),
            pressedFocused: .init(componentAsset: "TextField.ClearButton.Icon"),
            pressedSuccess: .init(componentAsset: "TextField.ClearButton.Icon"),
            pressedError: .init(componentAsset: "TextField.ClearButton.Icon"),
            disabled: .init(componentAsset: "TextField.ClearButton.Icon"),
            pressedOpacity: closeButtonReference.colors.content.pressedOpacity,
            disabledOpacity: closeButtonReference.colors.content.disabledOpacity
        )

        /// Cancel button colors and opacities.
        public var cancelButton: StateColorsAndOpacities = .init(
            enabled: ColorBook.primary,
            pressed: ColorBook.primary,
            disabled: ColorBook.primary,
            pressedOpacity: plainButtonReference.colors.content.pressedOpacity,
            disabledOpacity: plainButtonReference.colors.content.disabledOpacity
        )
    }

    // MARK: Fonts

    /// Sub-model containing font properties.
    public struct Fonts {
        // MARK: Lifecycle

        // MARK: Initializers

        /// Initializes sub-model with default values.
        public init() {}

        // MARK: Public

        // MARK: Properties

        /// Text font. Defaults to system font of size `16`.
        public var text: UIFont = baseTextFieldReference.fonts.text

        /// Placeholder font. Defaults to system font of size `13`.
        public var placeholder: Font = segmentedPickerReference.fonts.footer

        /// Header font. Defaults to system font of size `14`.
        public var header: Font = segmentedPickerReference.fonts.header

        /// Footer font. Defaults to system font of size `13`.
        public var footer: Font = segmentedPickerReference.fonts.footer

        /// Cancel button font. Defaults to system font of size `14` with `semibold` weight.
        public var cancelButton: Font = plainButtonReference.fonts.title
    }

    // MARK: Animations

    /// Sub-model containing animation properties.
    public struct Animations {
        // MARK: Lifecycle

        // MARK: Initializers

        /// Initializes sub-model with default values.
        public init() {}

        // MARK: Public

        // MARK: Properties

        /// Clear, cancel, and visibility button appear and dissapear animation. Defaults to `easeInOut`.
        public var buttonsAppearDisappear: Animation? = .easeInOut

        // MARK: Internal

        let delayToAnimateButtons: TimeInterval =
            0.5 // Must be more than keyboard or modal duration
    }

    // MARK: Misc

    /// Sub-model containing misc properties.
    public struct Misc {
        // MARK: Lifecycle

        // MARK: Initializers

        /// Initializes sub-model with default values.
        public init() {}

        // MARK: Public

        // MARK: Properties

        /// Keyboard type. Defaults to `default`.
        public var keyboardType: UIKeyboardType = baseTextFieldReference.misc.keyboardType

        /// Text content type. Defaults to `nil`.
        public var textContentType: UITextContentType?

        /// Spell check type. Defaults to `default`.
        public var spellCheck: UITextSpellCheckingType = baseTextFieldReference.misc.spellCheck

        /// Auto correct type. Defaults to `default`.
        public var autoCorrect: UITextAutocorrectionType = baseTextFieldReference.misc.autoCorrect

        /// Auto-capitalization type. Defaults to `sentences`.
        public var autoCapitalization: UITextAutocapitalizationType = baseTextFieldReference.misc
            .autoCapitalization

        /// Default button type. Defaults to `default`.
        public var returnButton: UIReturnKeyType = baseTextFieldReference.misc.returnButton

        /// Indicates if clear button is present. Defaults to `true`.
        public var clearButton: Bool = true

        /// Cancel button title. Defaults to `nil`.
        ///
        /// If property is set to `nil`, button will be hidden.
        public var cancelButton: String?
    }

    // MARK: Properties

    /// Reference to `VBaseTextFieldModel`.
    public static let baseTextFieldReference: VBaseTextFieldModel = .init()

    /// Reference to `VSquareButtonModel`.
    public static let squareButtonReference: VSquareButtonModel = .init()

    /// Reference to `VPlainButtonModel`.
    public static let plainButtonReference: VPlainButtonModel = .init()

    /// Reference to `VCloseButtonModel`.
    public static let closeButtonReference: VCloseButtonModel = .init()

    /// Reference to `VSegmentedPickerModel`.
    public static let segmentedPickerReference: VSegmentedPickerModel = .init()

    /// Sub-model containing layout properties.
    public var layout: Layout = .init()

    /// Sub-model containing color properties.
    public var colors: Colors = .init()

    /// Sub-model containing font properties.
    public var fonts: Fonts = .init()

    /// Sub-model containing animation properties.
    public var animations: Animations = .init()

    /// Sub-model containing misc properties.
    public var misc: Misc = .init()

    // MARK: Internal

    var cancelButtonSubModel: VPlainButtonModel {
        var model: VPlainButtonModel = .init()

        model.layout.hitBox.horizontal = 0
        model.layout.hitBox.vertical = 0

        model.colors.content = .init(
            pressedOpacity: colors.cancelButton.pressedOpacity,
            disabledOpacity: colors.cancelButton.disabledOpacity
        )

        model.colors.textContent = .init(
            enabled: colors.cancelButton.enabled,
            pressed: colors.cancelButton.pressed,
            disabled: colors.cancelButton.disabled
        )

        model.fonts.title = fonts.cancelButton

        return model
    }

    // MARK: Sub-Models

    func baseTextFieldSubModel(
        state: VTextFieldState,
        isSecureTextEntry: Bool
    ) -> VBaseTextFieldModel {
        var model: VBaseTextFieldModel = .init()

        model.layout.textAlignment = layout.textAlignment

        model.colors.text = .init(
            enabled: colors.textContent.for(state), // .disabled wouldn't matter
            disabled: colors.textContent.disabled,
            disabledOpacity: colors.content.disabledOpacity
        )

        model.fonts.text = fonts.text

        model.misc.isSecureTextEntry = isSecureTextEntry

        model.misc.keyboardType = misc.keyboardType
        model.misc.textContentType = misc.textContentType

        model.misc.spellCheck = misc.spellCheck
        model.misc.autoCorrect = misc.autoCorrect
        model.misc.autoCapitalization = misc.autoCapitalization

        model.misc.returnButton = misc.returnButton

        return model
    }

    func clearSubButtonModel(
        state: VTextFieldState,
        highlight: VTextFieldHighlight
    ) -> VCloseButtonModel {
        var model: VCloseButtonModel = .init()

        model.layout.dimension = layout.clearButtonDimension
        model.layout.iconDimension = layout.clearButtonIconDimension
        model.layout.hitBox.horizontal = 0
        model.layout.hitBox.vertical = 0

        model.colors.background = .init(
            enabled: colors.clearButtonBackground.for(state, highlight: highlight),
            // .disabled wouldn't matter
            pressed: colors.clearButtonBackground.for(highlight: highlight),
            disabled: colors.clearButtonBackground.disabled
        )

        model.colors.content = .clear
//            .init(
//            enabled: colors.clearButtonIcon.for(state, highlight: highlight),       // .disabled wouldn't matter
//            pressed: colors.clearButtonIcon.for(highlight: highlight),
//            disabled: colors.clearButtonIcon.disabled,
//            pressedOpacity: colors.clearButtonIcon.pressedOpacity,
//            disabledOpacity: colors.clearButtonIcon.disabledOpacity
//        )

        return model
    }

    func visibilityButtonSubModel(
        state _: VTextFieldState,
        highlight _: VTextFieldHighlight
    ) -> VSquareButtonModel {
        var model: VSquareButtonModel = .init()

        model.layout.dimension = layout.visibilityButtonDimension
        model.layout.cornerRadius = layout.visibilityButtonDimension / 2
        model.layout.contentMargins.horizontal = 0
        model.layout.contentMargins.vertical = 0
        model.layout.hitBox.horizontal = 0
        model.layout.hitBox.vertical = 0

        model.colors.background = .init(
            enabled: .clear,
            pressed: .clear,
            disabled: .clear
        )

        model.colors.content = .init(
            pressedOpacity: colors.visibilityButtonIcon.pressedOpacity,
            disabledOpacity: colors.visibilityButtonIcon.disabledOpacity
        )

        return model
    }
}
