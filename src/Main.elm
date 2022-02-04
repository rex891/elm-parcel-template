module Main exposing (init, main, subscriptions, update, view)

import Browser exposing (Document)
import Html exposing (div, text)
import Html.Attributes exposing (class)
import Json.Decode as De


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
        [ div [ class "body" ]
            [ text "Hello World" ]
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
