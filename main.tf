provider "oci" {
  auth = "ResourcePrincipal"
  region = "us-ashburn-1"
}

resource "oci_devops_trigger" "test_bitbucket_cloud_trigger" {
  #Required
  actions {
    #Required
    build_pipeline_id = "ocid1.devopsbuildpipeline.oc1.iad.amaaaaaa34lgq7aavylkp2p6upn27jqtuerzfjagkdovobni4n26notpkcua"
    type              = "TRIGGER_BUILD_PIPELINE"
    #Optional
    filter {
      #Required
      trigger_source = "BITBUCKET_CLOUD"
      #Optional
      events = ["PUSH"]
    }
  }
  project_id     = "ocid1.devopsproject.oc1.iad.amaaaaaa34lgq7aanq74w2k4n2kimdcagqrmofpdhpgcbmwyitcfow5s3ssq"
  trigger_source = "BITBUCKET_CLOUD"
  #Optional
  description   = "description"
  display_name  = "amodh-tf-trigger-yo"
}
