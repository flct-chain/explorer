POSTGRES_PORT_ID = "postgres"
POSTGRES_DB = "db"
POSTGRES_USER = "postgres"
POSTGRES_PASSWORD = "pass"

REDIS_PORT_ID = "redis"

LITTLE_BIGTABLE_PORT_ID = "littlebigtable"


def run(plan):

    db_services = plan.add_services(
        configs={
            # Add a Postgres server
            "postgres": ServiceConfig(
                image="postgres:15.2-alpine",
                ports={
                    POSTGRES_PORT_ID: PortSpec(5432, application_protocol="postgresql"),
                },
                env_vars={
                    "POSTGRES_DB": POSTGRES_DB,
                    "POSTGRES_USER": POSTGRES_USER,
                    "POSTGRES_PASSWORD": POSTGRES_PASSWORD,
                },
            ),
            # Add a Redis server
            "redis": ServiceConfig(
                image="redis:7",
                ports={
                    REDIS_PORT_ID: PortSpec(6379, application_protocol="tcp"),
                },
            ),
            # Add a Bigtable Emulator server
            "littlebigtable": ServiceConfig(
                image="gobitfly/little_bigtable:latest",
                ports={
                    LITTLE_BIGTABLE_PORT_ID: PortSpec(9000, application_protocol="tcp"),
                },
            ),
        }
    )