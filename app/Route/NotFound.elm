module Route.NotFound exposing (ActionData, Data, Model, Msg, route)

import BackendTask exposing (BackendTask)
import Content.Blogpost exposing (Metadata)
import Date
import FatalError exposing (FatalError)
import Head
import Head.Seo as Seo
import Html
import Html.Attributes as Attrs
import Layout.Blogpost
import Pages.Url
import PagesMsg exposing (PagesMsg)
import Route
import RouteBuilder exposing (App, StatelessRoute)
import Settings
import Shared
import UrlPath
import View exposing (View)


type alias Model =
    {}


type alias Msg =
    ()


type alias RouteParams =
    {}


type alias Data =
    {}


type alias ActionData =
    {}


route : StatelessRoute RouteParams Data ActionData
route =
    RouteBuilder.single
        { head = head
        , data = data
        }
        |> RouteBuilder.buildNoState { view = view }


data : BackendTask FatalError Data
data =
    BackendTask.succeed {}


head :
    App Data ActionData RouteParams
    -> List Head.Tag
head app =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = Settings.title
        , image =
            { url = [ "logo.svg" ] |> UrlPath.join |> Pages.Url.fromPath
            , alt = "logo"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = Settings.subtitle
        , locale = Nothing
        , title = Settings.title
        }
        |> Seo.website


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View (PagesMsg Msg)
view app shared =
    { title = Settings.title
    , body =
        --TODO  style error page accordingly
        [ Html.div [ Attrs.class "space-y-2 pb-8 pt-6 md:space-y-5" ]
            [ Html.h1 [ Attrs.class "text-3xl font-extrabold leading-9 tracking-tight text-gray-900 dark:text-gray-100 sm:text-4xl sm:leading-10 md:text-6xl md:leading-14" ] [ Html.text "Page not found" ]
            ]
        ]
    }
