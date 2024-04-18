# Example of a non conform Kubernetes resource
{
  apiVersion = "v1",
  kind = "ReplicationController",
  metadata = { labels = { app = "redis", role = "master", }, name = "redis-master", },
  spec = {
    replicas = 1,
    selector = { app = "redis", role = "master", },
    template = {
      metadata = { labels = { app = "redis", role = "master", }, },
      spec = {
        containers = [
          {
            image = "registry.k8s.io/redis:e2e",
            name = "redis-master",
            ports = [
              {
                # the error is here: containerPort is a string, but it should be
                # an integer 
                containerPort = "200",
                name = "redis-server",
              }
            ],
          }
        ],
      },
    },
  },
} | (import "../kubernetes-contracts/v1.29.3/replicationcontroller-v1.ncl")
