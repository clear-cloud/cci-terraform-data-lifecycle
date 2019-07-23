#
# Lifecycle policy
#
resource "aws_dlm_lifecycle_policy" "this" {
  description        = "DLM lifecycle policy"
  execution_role_arn = "${aws_iam_role.dlm_lifecycle_role.arn}"
  state              = "${var.state}"

  policy_details {
    resource_types = ["INSTANCE"] 

    schedule {
      name = "${var.name}"

      create_rule {
        interval      = "${var.interval}"
        interval_unit = "HOURS"           #HOURS is the only option currently
        times         = ["${var.times}"]
      }

      retain_rule {
        count = "${var.retention}"
      }

      tags_to_add = [{
        instance-id     = "$$(instance-id)"
        timestamp       = "$$(timestamp)"
        SnapshotCreator = "Data lifecycle manager"
      }]

      copy_tags = "${var.copy_tags}"
    }

    target_tags = "${var.target_tags_map}"
  }
}
