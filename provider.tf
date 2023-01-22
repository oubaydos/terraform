provider "google" {
    credentials = file("credentials.json")
    project="temp-368015"
    region="europe-west9"
    zone="europe-west9-a"
}
