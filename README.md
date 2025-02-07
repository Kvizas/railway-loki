# Loki Railway Configuration
![Github Repository Header](https://github.com/user-attachments/assets/3ff89d5a-0a0d-4af1-a444-b963dc6da090)

Loki is a horizontally scalable, multi-tenant log aggregation system created by Grafana Labs. It is designed for efficient and cost-effective log storage and retrieval and is often used alongside Grafana for visualization.

> [!WARNING]
> The default configuration is not secured in any way, if you'd like authentication, you should Eject the template (in railway) and modify the configuration.

**If you've read the above disclaimer and understand it, click to deploy:**

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/template/0zMnS-?referralCode=A6ij-A)

## Configuration
This [Loki configuration](loki-config.yaml) sets up a single-node instance with filesystem-based storage, storing logs in `/tmp/loki`. Authentication is disabled, and the server listens on port `3100` (HTTP) and `9096` (gRPC). It uses an in-memory key-value store for the ring, meaning it does not persist across restarts. Logs are stored using the v13 schema with a TSDB-backed index, rotated every 24 hours. A 100MB embedded cache is enabled for query results to improve performance. Structured metadata is allowed, and pattern-based ingestion is turned on. The ruler is configured to send alerts to Alertmanager (port 9093), and frontend encoding is set to protobuf. Anonymous usage analytics are enabled by default but can be disabled.

## Loki's Key Features
- Index-Free Logging: Unlike traditional logging systems like Elasticsearch, Loki does not index the contents of logs. Instead, it indexes only the metadata (labels), making it much cheaper and faster for ingestion.
- Label-Based Log Searching: Logs are identified using labels (like job, instance, namespace), making queries efficient without the complexity of full-text indexing.
- Integration with Prometheus: Loki follows a design philosophy similar to Prometheus, using labels and supporting queries via LogQL (similar to PromQL for metrics).
- Efficient Storage: Loki compresses logs and stores them in chunks, often using object storage like S3, GCS, or Azure Blob Storage to reduce costs.
- Multi-Tenant & Scalable: Loki supports multi-tenancy and horizontally scales, meaning it can handle large volumes of logs across distributed systems.
