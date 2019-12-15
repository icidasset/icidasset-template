module Common exposing (..)

import Json.Decode


jsonErrorsDecoder : Json.Decode.Decoder String
jsonErrorsDecoder =
    Json.Decode.field "message" Json.Decode.string
        |> Json.Decode.index 0
        |> Json.Decode.field "errors"


decodeJsonError : String -> String
decodeJsonError response =
    case Json.Decode.decodeString jsonErrorsDecoder response of
        Ok err ->
            err

        Err _ ->
            "Improper error response"
