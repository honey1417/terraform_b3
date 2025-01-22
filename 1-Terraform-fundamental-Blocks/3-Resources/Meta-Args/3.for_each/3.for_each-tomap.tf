#TO CREATE USERS USING FOR_EACH

#IAM members using for each
#possible to assign only for existing users 

resource "google_project_iam_member" "tf-usr" {
  project = "authentic-host-441701-i5"
  for_each = {
    "user1@example.com" = "roles/editor"
    "tanmayeebasa28@gmail.com" = "roles/viewer"
  }
  role = each.value #assigns role from map
  member = "user:${each.key}" #format for assigning individual users in iam roles
}

 
#TO ASSIGN USERS USING IAM_MEMBER individually

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

# define a set of users and roles
variable "users" {
  default = {
    "user1@example.com" = "roles/viewer"
    "user2@example.com" = "roles/editor"
  }
}

#IAM members using for each
resource "google_project_iam_member" "tf-usr-1" {
  project = "authentic-host-441701-i5"
  for_each = var.users
  role = each.value #assigns role from map
  member = "user:${each.key}" #format for assigning individual users in iam roles
}