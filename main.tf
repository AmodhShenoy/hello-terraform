provider "oci" {
  auth = "ResourcePrincipal"
  region = "us-ashburn-1"
}

resource "oci_devops_project" "test_project" {
  #Required
  compartment_id = var.compartment_ocid
  name = join("", [
    "A",
    "tf_test_project"])
  notification_config {
    #Required
    topic_id = "ocid1.onstopic.oc1.iad.aaaaaaaa55zand7mmlurmb525cf2ei6y43urg2avo43l4wp44wsukiiot3cq"
  }
}
resource "oci_devops_build_pipeline" "test_build_pipeline" {
  #Required
  project_id = oci_devops_project.test_project.id
  description   = "description"
  display_name  = "tf_test_build_pipeline"
}
resource "oci_devops_trigger" "test_bitbucket_cloud_trigger" {
  #Required
  actions {
    #Required
    build_pipeline_id = oci_devops_build_pipeline.test_build_pipeline.id
    type              = "TRIGGER_BUILD_PIPELINE"
    #Optional
    filter {
      #Required
      trigger_source = "BITBUCKET_CLOUD"
      #Optional
      events = ["PUSH"]
    }
  }
  project_id     = oci_devops_project.test_project.id
  trigger_source = "BITBUCKET_CLOUD"
  #Optional
  description   = "description"
  display_name  = "amodh_tf_bitbucket_cloud_trigger"
}
