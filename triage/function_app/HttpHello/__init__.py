import azure.functions as func

def main(req: func.HttpRequest) -> func.HttpResponse:
    """""
    This function responds to HTTP request and returns 'Hello World!' message.
    """""
    return func.HttpResponse(
        "Hello World!",
        status_code=200
    )