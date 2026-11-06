#' List personal logins
#'
#' Lists the personal logins of a series or event.
#'
#' @inheritParams create_text
#'
#' @return A list with one element per login, as returned by the API.
#' @family event functions
#' @export
#'
#' @examples
#' \dontrun{
#' list_personal_logins(
#'   api = Sys.getenv("SPORTITY_API"),
#'   password = "my_password"
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
