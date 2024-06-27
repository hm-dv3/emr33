# [Random string for resource]
resource "random_string" "suffix" {
  length  = 10
  special = false
  upper   = false
}

# [Default region]
variable "region" {
  default = "europe-west2"
}

# [Default zone]
variable "zone" {
  default = "europe-west2-a"
}

# [Default location]
variable "location" {
  default = "EU"
}

# [Get the project information]
data "google_project" "project" {
}

# [Create a bucket in default region]
resource "google_storage_bucket" "default" {
  name                        = "omr-stream-${random_string.suffix.result}"
  location                    = var.region
  uniform_bucket_level_access = true
  storage_class               = "STANDARD"
  # [delete bucket and contents on destroy]
  force_destroy = true
}

# [Upload dataflow python file to bucket]
resource "google_storage_bucket_object" "dataflow-python-file" {
  name   = "dataflow/udfbiac.py"
  source = "udfbiac.py"
  bucket = google_storage_bucket.default.name
}

# [Create Bigquery dataset in default location]
resource "google_bigquery_dataset" "default" {
  dataset_id = "omr_uk_${random_string.suffix.result}"
  location   = var.location
}

# [Create table on Bigquery dataset]
resource "google_bigquery_table" "biac_grant" {
  dataset_id          = google_bigquery_dataset.default.dataset_id
  table_id            = "biac_grant"
  deletion_protection = false
  schema              = file("schema/biac_grant.json")
}

# [Create table on Bigquery dataset]
resource "google_bigquery_table" "biac_grant_no_schema" {
  dataset_id          = google_bigquery_dataset.default.dataset_id
  table_id            = "biac_grant_no_schema"
  deletion_protection = false
  schema              = file("schema/no_schema.json")
}

# [Create table on Bigquery dataset]
resource "google_bigquery_table" "biac_grant_raw" {
  dataset_id          = google_bigquery_dataset.default.dataset_id
  table_id            = "biac_grant_raw"
  deletion_protection = false
  schema              = file("schema/biac_grant_raw.json")
}

# [Create table on Bigquery dataset]
resource "google_bigquery_table" "completed_queries" {
  dataset_id          = google_bigquery_dataset.default.dataset_id
  table_id            = "completed_queries"
  deletion_protection = false
  schema              = file("schema/completed_queries.json")
}

# [Create table on Bigquery dataset]
resource "google_bigquery_table" "completed_queries_no_schema" {
  dataset_id          = google_bigquery_dataset.default.dataset_id
  table_id            = "completed_queries_no_schema"
  deletion_protection = false
  schema              = file("schema/no_schema.json")
}

# [Create table on Bigquery dataset]
resource "google_bigquery_table" "query_tables" {
  dataset_id          = google_bigquery_dataset.default.dataset_id
  table_id            = "query_tables"
  deletion_protection = false
  schema              = file("schema/query_tables.json")
}

# [Create table on Bigquery dataset]
resource "google_bigquery_table" "query_tables_no_schema" {
  dataset_id          = google_bigquery_dataset.default.dataset_id
  table_id            = "query_tables_no_schema"
  deletion_protection = false
  schema              = file("schema/no_schema.json")
}

# [Create table on Bigquery dataset]
resource "google_bigquery_table" "query_user_group" {
  dataset_id          = google_bigquery_dataset.default.dataset_id
  table_id            = "query_user_group"
  deletion_protection = false
  schema              = file("schema/query_user_group.json")
}

# [Create table on Bigquery dataset]
resource "google_bigquery_table" "query_user_group_no_schema" {
  dataset_id          = google_bigquery_dataset.default.dataset_id
  table_id            = "query_user_group_no_schema"
  deletion_protection = false
  schema              = file("schema/no_schema.json")
}

# [Create table on Bigquery dataset]
resource "google_bigquery_table" "wsdsw_request" {
  dataset_id          = google_bigquery_dataset.default.dataset_id
  table_id            = "wsdsw_request"
  deletion_protection = false
  schema              = file("schema/wsdsw_request.json")
}

# [Create table on Bigquery dataset]
resource "google_bigquery_table" "wsdsw_request_no_schema" {
  dataset_id          = google_bigquery_dataset.default.dataset_id
  table_id            = "wsdsw_request_no_schema"
  deletion_protection = false
  schema              = file("schema/no_schema.json")
}

# [Create table on Bigquery dataset]
resource "google_bigquery_table" "wsdsw_usecase_req_info" {
  dataset_id          = google_bigquery_dataset.default.dataset_id
  table_id            = "wsdsw_usecase_req_info"
  deletion_protection = false
  schema              = file("schema/wsdsw_usecase_req_info.json")
}

# [Create table on Bigquery dataset]
resource "google_bigquery_table" "wsdsw_usecase_req_info_no_schema" {
  dataset_id          = google_bigquery_dataset.default.dataset_id
  table_id            = "wsdsw_usecase_req_info_no_schema"
  deletion_protection = false
  schema              = file("schema/no_schema.json")
}

# [Create table on Bigquery dataset]
resource "google_bigquery_table" "wsdsw_usecase_resources" {
  dataset_id          = google_bigquery_dataset.default.dataset_id
  table_id            = "wsdsw_usecase_resources"
  deletion_protection = false
  schema              = file("schema/wsdsw_usecase_resources.json")
}

# [Create table on Bigquery dataset]
resource "google_bigquery_table" "wsdsw_usecase_resources_no_schema" {
  dataset_id          = google_bigquery_dataset.default.dataset_id
  table_id            = "wsdsw_usecase_resources_no_schema"
  deletion_protection = false
  schema              = file("schema/no_schema.json")
}

# [Create table on Bigquery dataset]
resource "google_bigquery_table" "wsdsw_user_list" {
  dataset_id          = google_bigquery_dataset.default.dataset_id
  table_id            = "wsdsw_user_list"
  deletion_protection = false
  schema              = file("schema/wsdsw_user_list.json")
}

# [Create table on Bigquery dataset]
resource "google_bigquery_table" "wsdsw_user_list_no_schema" {
  dataset_id          = google_bigquery_dataset.default.dataset_id
  table_id            = "wsdsw_user_list_no_schema"
  deletion_protection = false
  schema              = file("schema/no_schema.json")
}

# [Create table on Bigquery dataset]
resource "google_bigquery_table" "wsdsw_user_req_info" {
  dataset_id          = google_bigquery_dataset.default.dataset_id
  table_id            = "wsdsw_user_req_info"
  deletion_protection = false
  schema              = file("schema/wsdsw_user_req_info.json")
}

# [Create table on Bigquery dataset]
resource "google_bigquery_table" "wsdsw_user_req_info_no_schema" {
  dataset_id          = google_bigquery_dataset.default.dataset_id
  table_id            = "wsdsw_user_req_info_no_schema"
  deletion_protection = false
  schema              = file("schema/no_schema.json")
}

# [Create Table debezium_heartbeat_tp_no_schema on Bigquery Dataset]
resource "google_bigquery_table" "debezium_heartbeat_tp_no_schema" {
  dataset_id          = google_bigquery_dataset.default.dataset_id
  table_id            = "debezium_heartbeat_tp_no_schema"
  deletion_protection = false
  schema              = file("schema/no_schema.json")
}

# [Create Table debezium_heartbeat_no_schema on Bigquery Dataset]
resource "google_bigquery_table" "debezium_heartbeat_no_schema" {
  dataset_id          = google_bigquery_dataset.default.dataset_id
  table_id            = "debezium_heartbeat_no_schema"
  deletion_protection = false
  schema              = file("schema/no_schema.json")
}

# [Create Table debezium_heartbeat on Bigquery Dataset]
resource "google_bigquery_table" "debezium_heartbeat" {
  dataset_id          = google_bigquery_dataset.default.dataset_id
  table_id            = "debezium_heartbeat"
  deletion_protection = false
  schema              = file("schema/debezium_heartbeat.json")
}

# [Create Topic hearbeat]
resource "google_pubsub_topic" "heartbeat" {
  name = "heartbeat.topic"
}

# [Create Topic starburst_prd.debezium_heartbeat]
resource "google_pubsub_topic" "debezium_heartbeat" {
  name = "topic.starburst_prd.debezium_heartbeat"
}

# [Create Subscription for heartbeat.topic]
resource "google_pubsub_subscription" "heartbeat-noschema" {
  name  = "sub-heartbeat-noschema"
  topic = google_pubsub_topic.heartbeat.id

  bigquery_config {
    table = "${google_bigquery_table.debezium_heartbeat_tp_no_schema.project}.${google_bigquery_table.debezium_heartbeat_tp_no_schema.dataset_id}.${google_bigquery_table.debezium_heartbeat_tp_no_schema.table_id}"
  }

  depends_on = [google_project_iam_member.viewer, google_project_iam_member.editor]
}

# [Create Subscription no schema for topic.starburst_prd.debezium_heartbeat]
resource "google_pubsub_subscription" "tp-debezium-noschema" {
  name  = "sub-tp-debezium-noschema"
  topic = google_pubsub_topic.debezium_heartbeat.id

  bigquery_config {
    table = "${google_bigquery_table.debezium_heartbeat_no_schema.project}.${google_bigquery_table.debezium_heartbeat_no_schema.dataset_id}.${google_bigquery_table.debezium_heartbeat_no_schema.table_id}"
  }

  depends_on = [google_project_iam_member.viewer, google_project_iam_member.editor]
}

# [Create Subscription no schema for topic.starburst_prd.debezium_heartbeat]
resource "google_pubsub_subscription" "tp-debezium_heartbeat" {
  name  = "sub-tp-debezium_heartbeat"
  topic = google_pubsub_topic.debezium_heartbeat.id

  bigquery_config {
    table               = "${google_bigquery_table.debezium_heartbeat.project}.${google_bigquery_table.debezium_heartbeat.dataset_id}.${google_bigquery_table.debezium_heartbeat.table_id}"
    use_table_schema    = true
    drop_unknown_fields = true
  }

  depends_on = [google_project_iam_member.viewer, google_project_iam_member.editor]
}

# [Create topic]
resource "google_pubsub_topic" "biac_grant" {
  name = "topic.inventory.biac_grant"
}

resource "google_pubsub_subscription" "biac_grant_no_schema" {
  name  = "sub-omr-biac_grant_noschema"
  topic = google_pubsub_topic.biac_grant.id

  bigquery_config {
    table = "${google_bigquery_table.biac_grant_no_schema.project}.${google_bigquery_table.biac_grant_no_schema.dataset_id}.${google_bigquery_table.biac_grant_no_schema.table_id}"
  }

  depends_on = [google_project_iam_member.viewer, google_project_iam_member.editor]
}

resource "google_pubsub_subscription" "biac_grant_raw" {
  name  = "sub-omr-biac_grant_raw"
  topic = google_pubsub_topic.biac_grant.id

  bigquery_config {
    table            = "${google_bigquery_table.biac_grant_raw.project}.${google_bigquery_table.biac_grant_raw.dataset_id}.${google_bigquery_table.biac_grant_raw.table_id}"
    use_table_schema = true
  }

  depends_on = [google_project_iam_member.viewer, google_project_iam_member.editor]
}

resource "google_pubsub_topic" "wsdsw_request" {
  name = "topic.protaldswb_dev.wsdsw_request"
}

resource "google_pubsub_subscription" "wsdsw_request_no_schema" {
  name  = "sub-omr-wsdsw_request_no_schema"
  topic = google_pubsub_topic.wsdsw_request.id

  bigquery_config {
    table = "${google_bigquery_table.wsdsw_request_no_schema.project}.${google_bigquery_table.wsdsw_request_no_schema.dataset_id}.${google_bigquery_table.wsdsw_request_no_schema.table_id}"
  }

  depends_on = [google_project_iam_member.viewer, google_project_iam_member.editor]
}

resource "google_pubsub_subscription" "wsdsw_request" {
  name  = "sub-omr-wsdsw_request"
  topic = google_pubsub_topic.wsdsw_request.id

  bigquery_config {
    table            = "${google_bigquery_table.wsdsw_request.project}.${google_bigquery_table.wsdsw_request.dataset_id}.${google_bigquery_table.wsdsw_request.table_id}"
    use_table_schema = true
  }

  depends_on = [google_project_iam_member.viewer, google_project_iam_member.editor]
}

resource "google_pubsub_topic" "wsdsw_usecase_req_info" {
  name = "topic.protaldswb_dev.wsdsw_usecase_req_info"
}

resource "google_pubsub_subscription" "wsdsw_usecase_req_info_no_schema" {
  name  = "sub-omr-wsdsw_usecase_req_info_no_schema"
  topic = google_pubsub_topic.wsdsw_usecase_req_info.id

  bigquery_config {
    table = "${google_bigquery_table.wsdsw_usecase_req_info_no_schema.project}.${google_bigquery_table.wsdsw_usecase_req_info_no_schema.dataset_id}.${google_bigquery_table.wsdsw_usecase_req_info_no_schema.table_id}"
  }

  depends_on = [google_project_iam_member.viewer, google_project_iam_member.editor]
}

resource "google_pubsub_subscription" "wsdsw_usecase_req_info" {
  name  = "sub-omr-wsdsw_usecase_req_info"
  topic = google_pubsub_topic.wsdsw_usecase_req_info.id

  bigquery_config {
    table            = "${google_bigquery_table.wsdsw_usecase_req_info.project}.${google_bigquery_table.wsdsw_usecase_req_info.dataset_id}.${google_bigquery_table.wsdsw_usecase_req_info.table_id}"
    use_table_schema = true
  }

  depends_on = [google_project_iam_member.viewer, google_project_iam_member.editor]
}

resource "google_pubsub_topic" "wsdsw_usecase_resources" {
  name = "topic.protaldswb_dev.wsdsw_usecase_resources"
}

resource "google_pubsub_subscription" "wsdsw_usecase_resources_no_schema" {
  name  = "sub-omr-wsdsw_usecase_resources_no_schema"
  topic = google_pubsub_topic.wsdsw_usecase_resources.id

  bigquery_config {
    table = "${google_bigquery_table.wsdsw_usecase_resources_no_schema.project}.${google_bigquery_table.wsdsw_usecase_resources_no_schema.dataset_id}.${google_bigquery_table.wsdsw_usecase_resources_no_schema.table_id}"
  }

  depends_on = [google_project_iam_member.viewer, google_project_iam_member.editor]
}

resource "google_pubsub_subscription" "wsdsw_usecase_resources" {
  name  = "sub-omr-wsdsw_usecase_resources"
  topic = google_pubsub_topic.wsdsw_usecase_resources.id

  bigquery_config {
    table            = "${google_bigquery_table.wsdsw_usecase_resources.project}.${google_bigquery_table.wsdsw_usecase_resources.dataset_id}.${google_bigquery_table.wsdsw_usecase_resources.table_id}"
    use_table_schema = true
  }

  depends_on = [google_project_iam_member.viewer, google_project_iam_member.editor]
}

resource "google_pubsub_topic" "wsdsw_user_list" {
  name = "topic.protaldswb_dev.wsdsw_user_list"
}

resource "google_pubsub_subscription" "wsdsw_user_list_no_schema" {
  name  = "sub-omr-wsdsw_user_list_no_schema"
  topic = google_pubsub_topic.wsdsw_user_list.id

  bigquery_config {
    table = "${google_bigquery_table.wsdsw_user_list_no_schema.project}.${google_bigquery_table.wsdsw_user_list_no_schema.dataset_id}.${google_bigquery_table.wsdsw_user_list_no_schema.table_id}"
  }

  depends_on = [google_project_iam_member.viewer, google_project_iam_member.editor]
}

resource "google_pubsub_subscription" "wsdsw_user_list" {
  name  = "sub-omr-wsdsw_user_list"
  topic = google_pubsub_topic.wsdsw_user_list.id

  bigquery_config {
    table            = "${google_bigquery_table.wsdsw_user_list.project}.${google_bigquery_table.wsdsw_user_list.dataset_id}.${google_bigquery_table.wsdsw_user_list.table_id}"
    use_table_schema = true
  }

  depends_on = [google_project_iam_member.viewer, google_project_iam_member.editor]
}

resource "google_pubsub_topic" "wsdsw_user_req_info" {
  name = "topic.protaldswb_dev.wsdsw_user_req_info"
}

resource "google_pubsub_subscription" "wsdsw_user_req_info_no_schema" {
  name  = "sub-omr-wsdsw_user_req_info_no_schema"
  topic = google_pubsub_topic.wsdsw_user_req_info.id

  bigquery_config {
    table = "${google_bigquery_table.wsdsw_user_req_info_no_schema.project}.${google_bigquery_table.wsdsw_user_req_info_no_schema.dataset_id}.${google_bigquery_table.wsdsw_user_req_info_no_schema.table_id}"
  }

  depends_on = [google_project_iam_member.viewer, google_project_iam_member.editor]
}

resource "google_pubsub_subscription" "wsdsw_user_req_info" {
  name  = "sub-omr-wsdsw_user_req_info"
  topic = google_pubsub_topic.wsdsw_user_req_info.id

  bigquery_config {
    table            = "${google_bigquery_table.wsdsw_user_req_info.project}.${google_bigquery_table.wsdsw_user_req_info.dataset_id}.${google_bigquery_table.wsdsw_user_req_info.table_id}"
    use_table_schema = true
  }

  depends_on = [google_project_iam_member.viewer, google_project_iam_member.editor]
}

resource "google_pubsub_topic" "completed_queries" {
  name = "topic.starburst_prd.completed_queries"
}

resource "google_pubsub_subscription" "completed_queries_no_schema" {
  name  = "sub-omr-completed_queries_no_schema"
  topic = google_pubsub_topic.completed_queries.id

  bigquery_config {
    table = "${google_bigquery_table.completed_queries_no_schema.project}.${google_bigquery_table.completed_queries_no_schema.dataset_id}.${google_bigquery_table.completed_queries_no_schema.table_id}"
  }

  depends_on = [google_project_iam_member.viewer, google_project_iam_member.editor]
}

resource "google_pubsub_subscription" "completed_queries" {
  name  = "sub-omr-completed_queries"
  topic = google_pubsub_topic.completed_queries.id

  bigquery_config {
    table            = "${google_bigquery_table.completed_queries.project}.${google_bigquery_table.completed_queries.dataset_id}.${google_bigquery_table.completed_queries.table_id}"
    use_table_schema = true
  }

  depends_on = [google_project_iam_member.viewer, google_project_iam_member.editor]
}

resource "google_pubsub_topic" "query_tables" {
  name = "topic.starburst_prd.query_tables"
}

resource "google_pubsub_subscription" "query_tables_no_schema" {
  name  = "sub-omr-query_tables_no_schema"
  topic = google_pubsub_topic.query_tables.id

  bigquery_config {
    table = "${google_bigquery_table.query_tables_no_schema.project}.${google_bigquery_table.query_tables_no_schema.dataset_id}.${google_bigquery_table.query_tables_no_schema.table_id}"
  }

  depends_on = [google_project_iam_member.viewer, google_project_iam_member.editor]
}

resource "google_pubsub_subscription" "query_tables" {
  name  = "sub-omr-query_tables"
  topic = google_pubsub_topic.query_tables.id

  bigquery_config {
    table            = "${google_bigquery_table.query_tables.project}.${google_bigquery_table.query_tables.dataset_id}.${google_bigquery_table.query_tables.table_id}"
    use_table_schema = true
  }

  depends_on = [google_project_iam_member.viewer, google_project_iam_member.editor]
}

resource "google_pubsub_topic" "query_user_group" {
  name = "topic.starburst_prd.query_user_group"
}

resource "google_pubsub_subscription" "query_user_group_no_schema" {
  name  = "sub-omr-query_user_group_no_schema"
  topic = google_pubsub_topic.query_user_group.id

  bigquery_config {
    table = "${google_bigquery_table.query_user_group_no_schema.project}.${google_bigquery_table.query_user_group_no_schema.dataset_id}.${google_bigquery_table.query_user_group_no_schema.table_id}"
  }

  depends_on = [google_project_iam_member.viewer, google_project_iam_member.editor]
}

resource "google_pubsub_subscription" "query_user_group" {
  name  = "sub-omr-query_user_group"
  topic = google_pubsub_topic.query_user_group.id

  bigquery_config {
    table            = "${google_bigquery_table.query_user_group.project}.${google_bigquery_table.query_user_group.dataset_id}.${google_bigquery_table.query_user_group.table_id}"
    use_table_schema = true
  }

  depends_on = [google_project_iam_member.viewer, google_project_iam_member.editor]
}

resource "google_data_pipeline_pipeline" "biac_grant" {
  name   = "pipeline-omr-biac-grant-uk"
  type   = "PIPELINE_TYPE_STREAMING"
  region = var.region
  state  = "STATE_ACTIVE"

  workload {
    dataflow_flex_template_request {
      project_id = data.google_project.project.project_id
      location   = var.region
      launch_parameter {
        job_name                = "job-omr-biac-grant-${random_string.suffix.result}"
        container_spec_gcs_path = "gs://dataflow-templates-europe-west2/latest/flex/PubSub_to_BigQuery_Xlang"
        parameters = {
          outputTableSpec                         = "${google_bigquery_table.biac_grant.project}.${google_bigquery_table.biac_grant.dataset_id}.${google_bigquery_table.biac_grant.table_id}"
          inputTopic                              = "${google_pubsub_topic.biac_grant.id}"
          pythonExternalTextTransformGcsPath      = "${google_storage_bucket.default.url}/${google_storage_bucket_object.dataflow-python-file.name}"
          pythonExternalTextTransformFunctionName = "process"
          useStorageWriteApi                      = "false"
        }
        environment {
          temp_location           = "${google_storage_bucket.default.url}/temp"
          enable_streaming_engine = "true"
          additional_experiments  = ["streaming_mode_exactly_once"]
        }
      }
    }
  }
}

resource "google_project_iam_member" "df_worker" {
  project = data.google_project.project.project_id
  role    = "roles/dataflow.worker"
  member  = "serviceAccount:${data.google_project.project.number}-compute@developer.gserviceaccount.com"
}

resource "google_project_iam_member" "df_admin" {
  project = data.google_project.project.project_id
  role    = "roles/dataflow.admin"
  member  = "serviceAccount:${data.google_project.project.number}-compute@developer.gserviceaccount.com"
}

resource "google_project_iam_member" "ps_editor" {
  project = data.google_project.project.project_id
  role    = "roles/pubsub.editor"
  member  = "serviceAccount:${data.google_project.project.number}-compute@developer.gserviceaccount.com"
}

resource "google_project_iam_member" "gcs_admin" {
  project = data.google_project.project.project_id
  role    = "roles/storage.objectAdmin"
  member  = "serviceAccount:${data.google_project.project.number}-compute@developer.gserviceaccount.com"
}

resource "google_project_iam_member" "bq_editor" {
  project = data.google_project.project.project_id
  role    = "roles/bigquery.dataEditor"
  member  = "serviceAccount:${data.google_project.project.number}-compute@developer.gserviceaccount.com"
}

resource "google_project_iam_member" "viewer" {
  project = data.google_project.project.project_id
  role    = "roles/bigquery.metadataViewer"
  member  = "serviceAccount:service-${data.google_project.project.number}@gcp-sa-pubsub.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "editor" {
  project = data.google_project.project.project_id
  role    = "roles/bigquery.dataEditor"
  member  = "serviceAccount:service-${data.google_project.project.number}@gcp-sa-pubsub.iam.gserviceaccount.com"
}
