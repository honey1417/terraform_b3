#create a 2 users in gcp IAM
#project,role,member are mandatory

#TO CREATE USERS USING FOR_EACH (set of strings)

# define a set of users and roles
variable "users" {
  default = {
    "user1@example.com" = "roles/viewer"
    "user2@example.com" = "roles/viewer"
  }
}

#IAM members using for each
resource "google_project_iam_member" "tf-usr-1" {
  project = "authentic-host-441701-i5"
  for_each = var.users
  role = each.value #assigns role from map
  member = "user:${each.key}" #format for assigning individual users in iam roles
}










#TO CREATE USERS USING IAM_MEMBER

resource "google_project_iam_member" "tf-user-1" {
  project = "authentic-host-441701-i5"
  role = "roles/editor"
  member = "user:jane@example.com"
}
resource "google_project_iam_member" "tf-user-2" {
  project = "authentic-host-441701-i5"
  role = "roles/viewer"
  member = "user:honey@example.com"
}

#TO ASSIGN SAME ROLE TO DIFF USERS using IAM_MEMBERS

resource "google_project_iam_members" "assign_multiple_members" {
  project = "<your-gcp-project-id>"
  role    = "roles/viewer"
  members = [
    "user:user1@example.com",
    "user:user2@example.com",
    "group:group1@example.com"
  ]
}