data "kubernetes_ingress" "ingress" {
  metadata {
    name = "static-app"
  }
}

data "google_dns_managed_zone" "eharriett-zone" {
  name    = "eharriet-challenge"
  project = var.project_id
}

resource "google_dns_record_set" "a" {
  name         = "eharriet.challenges.octoml.ai."
  project      = var.project_id
  managed_zone = data.google_dns_managed_zone.eharriett-zone.name
  type         = "A"
  ttl          = 300

  rrdatas = [data.kubernetes_ingress.ingress.load_balancer_ingress.0.ip,"34.117.9.8"]
}

resource "google_dns_record_set" "cname" {
  name         = "www.eharriet.challenges.octoml.ai."
  project      = var.project_id
  managed_zone = data.google_dns_managed_zone.eharriett-zone.name

  type    = "CNAME"
  ttl     = 300
  rrdatas = ["eharriet.challenges.octoml.ai."]
}
 