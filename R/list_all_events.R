#' List all events
#'
#' Lists all events of your account: active, past and deleted. Combines
#' [list_active_events()], [list_past_events()] and [list_deleted_events()].
#'
#' @inheritParams create_text
#'
#' @inherit list_active_events return
#' @family event functions
#' @export
#'
#' @examples
#' \dontrun{
#' list_all_events(api = Sys.getenv("SPORTITY_API"))
#' }

list_all_events <- function(
  api
) {
  dplyr::bind_rows(
    list_active_events(api = api),
    list_past_events(api = api),
    list_deleted_events(api = api)
  )
}
