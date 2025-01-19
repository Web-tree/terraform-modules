data "local_file" "html_files" {
  for_each = fileset(var.templates_dir, "*.html")
  filename = "${var.templates_dir}/${each.value}"
}

resource "aws_ses_template" "email_templates" {
  for_each = data.local_file.html_files

  // replace .html with empty string, everything to lower case and spaces with underscores
  name    = replace(replace(lower(each.key), ".html", ""), " ", "_")
  html    = each.value.content
  // remove .html from the subject
  subject = replace(each.key, ".html", "")
}