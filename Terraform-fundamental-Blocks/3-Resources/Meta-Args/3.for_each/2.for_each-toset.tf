#create a 2 users in gcp IAM
#project,role,member are mandatory

#TO ASSIGN SAME ROLE TO DIFF USERS using IAM_MEMBERS
#possible to assign only for existing users 

resource "google_project_iam_member" "tf-usr" {
  project = "authentic-host-441701-i5"
  for_each = {
    user1@example.com
    tanmayeebasa28@gmail.com
  }
  role = "roles/viewer 
  member = "user:${each.value}" #format for assigning individual users in iam roles
}


# Define a set of users and their roles
locals {
  users = toset([
    "user1@example.com",
    "user2@example.com"
  ])
}

# Assign roles to users using for_each
resource "google_project_iam_member" "user" {
  for_each = local.users

  project = "<your-gcp-project-id>"
  role    = "roles/editor" # You can assign the same role to all users, or make it dynamic
  member  = "user:${each.value}" # Use each.value to access the email
}


##alternative
resource "google_project_iam_members" "assign_multiple_members" {
  project = "<your-gcp-project-id>"
  role    = "roles/viewer"
  members = [
    "user:user1@example.com",
    "user:user2@example.com",
    "group:group1@example.com"
  ]
}