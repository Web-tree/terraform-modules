module "ses_templates" {
  source = "../"
  templates_dir = "${path.module}/email-templates"
}