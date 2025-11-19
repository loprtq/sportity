#' List all events
#'
#' @description
#' List all events on Sportity - active, past and deleted.
#'
#'
#' @param api An API key from Sportity.
#'
#' @return A data frame.
#' @export
#'

list_all_events <- function(
    api
) {
  dplyr::bind_rows(
    list_active_events(api = api),
    list_past_events(api = api),
    list_deleted_events(api = api)
  )
}
