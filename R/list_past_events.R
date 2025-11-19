#' List past events
#'
#' @description
#' List past events on Sportity.
#'
#'
#' @param api An API key from Sportity.
#'
#' @return A data frame.
#' @export
#'
list_past_events <- function(
    api
) {
  httr2::request(
    "https://admin.sportity.com/api/events/past/flat"
  ) |>
    httr2::req_headers(
      "X-Sportity-ApiKey" = api
    ) |>
    httr2::req_perform() |>
    httr2::resp_body_json() |>
    purrr::map_df(~
      data.frame(
        event_id = .x$id,
        name = .x$name,
        start_date = if (!is.null(.x$start_date)) .x$start_date else NA,
        end_date = .x$end_date,
        cover = if (!is.null(.x$cover)) .x$cover else NA,
        place = if (!is.null(.x$place)) .x$place else NA,
        timezone = if (!is.null(.x$timezone)) .x$timezone else NA,
        serie_id = if (!is.null(.x$serie_id)) .x$serie_id else NA,
        password = if (!is.null(.x$passwords)) .x$passwords[[1]] else NA,
        stringsAsFactors = FALSE
      )
    )
}
