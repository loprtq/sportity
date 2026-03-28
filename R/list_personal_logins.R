#' List personal logins
#'
#' @description
#' List personal logins for an event or series.
#'
#' @param api An API key from Sportity.
#' @param password The event/series password.
#'
#' @return A data frame.
#' @export
#'
#' @examples
#' \dontrun{
#' list_personal_logins(
#'  api = "your_api_key",
#'  password = "your_password"
#' )
#' }

list_personal_logins <- function(
  api,
  password
) {
  # HTTP request
  httr2::request(
    glue::glue("https://admin.sportity.com/api/logins/{password}")
  ) |>
    httr2::req_headers(
      "X-Sportity-ApiKey" = api
    ) |>
    httr2::req_perform() |>
    httr2::resp_body_json()
}
