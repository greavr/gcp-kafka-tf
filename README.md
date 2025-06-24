# GCP Managed Kafka (A Terraform Story)

Requirement: **GCP PROJECT INTO WHICH TO DEPLOY**

# Tool Setup Guide

[Tool Install Guide](tools/ReadMe.md)

# Environment Setup
* Install tools
* Run the following commands to login to gcloud:
```
gcloud auth login
gcloud auth application-default login
```

This will set up your permissions for Terraform to run.

# Deploy guide

This Terraform configuration deploys a new Google Cloud Managed Service for Apache Kafka cluster into a newly created Virtual Private Cloud (VPC) network. It requires an existing Google Cloud Project that is linked to an active billing account.

Google Cloud Managed Service for Apache Kafka is a fully managed, scalable, and highly available service for Apache Kafka. It abstracts away the operational complexities of running Kafka, such as broker resizing, storage management, and version updates, allowing you to focus on building your data-intensive applications. Key features include:

* **Fully Managed:** Handles cluster creation, automatic broker sizing and rebalancing, and automatic version updates.
* **High Availability:** Deployments are highly available by default with data replication across multiple zones.
* **Security:** Integrated with Google Cloud IAM for authentication and authorization, supports Customer-Managed Encryption Keys (CMEK), and offers resource isolation within private VPCs.
* **Compatibility:** Works with your existing Kafka applications and supports the open-source Kafka wire protocol.
* **Integration:** Seamlessly integrates with other Google Cloud services like Cloud Monitoring, Cloud Logging, and Kafka Connect for data integration with BigQuery, Cloud Storage, and other systems.

For more information on Google Cloud Managed Service for Apache Kafka, refer to the official documentation:
* [Google Cloud Managed Service for Apache Kafka Overview](https://cloud.google.com/managed-service-for-apache-kafka/docs/overview)
* [Google Cloud Managed Service for Apache Kafka Documentation](https://cloud.google.com/managed-service-for-apache-kafka/docs)
* [Google Cloud Managed Service for Apache Kafka Pricing](https://cloud.google.com/managed-service-for-apache-kafka/pricing)


# Deploy guide
```
cd terraform
terraform init
terraform plan
terraform apply
```