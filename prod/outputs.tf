output "function_app_url" {
    description = "URL of the Azure Function App"
    value = "https://${module.function_app.hostname}/api/hello"
}