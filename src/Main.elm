module Main exposing (init, main, subscriptions, update, view)

import Browser exposing (Document)
import Css
import Css.Global
import Html.Styled as Html
import Html.Styled.Attributes as Attr
import Json.Decode as De
import Tailwind.Breakpoints as Breakpoints
import Tailwind.Utilities as Tw


type Msg
    = NoOp


type alias Model =
    { mesg : String
    }


main : Program De.Value Model Msg
main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : De.Value -> ( Model, Cmd Msg )
init flags =
    ( { mesg = "hello, world" }
    , Cmd.none
    )


view : Model -> Document Msg
view model =
    { title = "playgame"
    , body =
        [ Html.toUnstyled <|
            Html.div [ Attr.css [ Tw.bg_gray_50 ] ]
                [ -- This will give us the standard tailwind style-reset as well as the fonts
                  Css.Global.global Tw.globalStyles
                , Html.div
                    [ Attr.css
                        [ Tw.mt_8
                        , Tw.flex

                        -- We use breakpoints like this
                        -- However, you need to order your breakpoints from high to low :/
                        , Breakpoints.lg [ Tw.mt_0, Tw.flex_shrink_0 ]
                        ]
                    ]
                    [ Html.div [ Attr.css [ Tw.inline_flex, Tw.rounded_md, Tw.shadow ] ]
                        [ Html.a
                            [ Attr.css
                                [ Tw.inline_flex
                                , Tw.items_center
                                , Tw.justify_center
                                , Tw.px_5
                                , Tw.py_3
                                , Tw.border
                                , Tw.border_transparent
                                , Tw.text_base
                                , Tw.font_medium
                                , Tw.rounded_md
                                , Tw.text_white
                                , Tw.bg_indigo_600

                                -- We can use hover styles via elm-css :)
                                , Css.hover [ Tw.bg_indigo_700 ]
                                ]
                            , Attr.href "#"
                            ]
                            [ Html.text "Get started" ]
                        ]
                    ]
                ]
        ]
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.batch <|
        []
