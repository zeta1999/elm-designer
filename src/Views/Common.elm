module Views.Common exposing (canDropInto, canDropSibling, fieldId, none)

import Document exposing (DragId(..))
import Html as H exposing (Html)
import Html5.DragDrop as DragDrop
import Model exposing (Field(..))
import Tree as T exposing (Tree)


canDropInto container dragDrop =
    case DragDrop.getDragId dragDrop of
        Just dragId ->
            case dragId of
                Move node ->
                    Document.canDropInto container node

                Insert template ->
                    Document.canDropInto container (T.label template)

        Nothing ->
            False


canDropSibling sibling dragDrop =
    case DragDrop.getDragId dragDrop of
        Just dragId ->
            case dragId of
                Move node ->
                    Document.canDropSibling sibling node

                Insert template ->
                    Document.canDropSibling sibling (T.label template)

        Nothing ->
            False


fieldId : Field -> String
fieldId field =
    case field of
        FontSizeField ->
            "font-size"

        FontColorField ->
            "font-color-hex"

        LetterSpacingField ->
            "letter-spacing"

        WordSpacingField ->
            "word-spacing"

        BackgroundColorField ->
            "background-color-hex"

        PaddingTopField ->
            "padding-top"

        PaddingRightField ->
            "padding-right"

        PaddingBottomField ->
            "padding-bottom"

        PaddingLeftField ->
            "padding-left"

        SpacingXField ->
            "spacing-x"

        SpacingYField ->
            "spacing-y"

        ImageSrcField ->
            "image-src"

        BackgroundImageField ->
            "background-image"

        BorderColorField ->
            "border-color-hex"

        BorderTopLeftCornerField ->
            "border-top-left-corner"

        BorderTopRightCornerField ->
            "border-top-right-corner"

        BorderBottomRightCornerField ->
            "border-bottom-right-corner"

        BorderBottomLeftCornerField ->
            "border-bottom-left-corner"

        BorderTopWidthField ->
            "border-top-width"

        BorderRightWidthField ->
            "border-right-width"

        BorderBottomWidthField ->
            "border-bottom-width"

        BorderLeftWidthField ->
            "border-left-width"

        LabelField ->
            "label"

        OffsetXField ->
            "offset-x"

        OffsetYField ->
            "offset-y"

        WidthMinField ->
            "width-min"

        WidthMaxField ->
            "width-max"

        WidthPxField ->
            "width-px"

        WidthPortionField ->
            "width-portion"

        HeightMinField ->
            "height-min"

        HeightMaxField ->
            "height-max"

        HeightPxField ->
            "height-px"

        HeightPortionField ->
            "height-portion"


none =
    H.div [] []
