run-h2: ; ./mvnw compile quarkus\:dev \
    -Dquarkus.datasource.url=jdbc\:h2\:mem\:bkd \
    -Dquarkus.datasource.driver=org.h2.Driver

run-local-postgres: ; ./mvnw compile quarkus\:dev \
    -Dquarkus.datasource.url=jdbc\:postgresql\://localhost\:5432/bkd \
    -Dquarkus.datasource.driver=org.postgresql.Driver \
    -Dquarkus.datasource.username=bkd \
    -Dquarkus.datasource.password=postgres

run-docker-local-postgres: ; docker run -i --rm -p 8080\:8080 \
    --env GREETING_MESSAGE=stuff \
    --env QUARKUS_DATASOURCE_DRIVER=org.postgresql.Driver \
    --env QUARKUS_DATASOURCE_URL=jdbc\:postgresql\://10.55.49.177\:5432/bkd \
    --env QUARKUS_DATASOURCE_USERNAME=bkd \
    --env QUARKUS_DATASOURCE_PASSWORD=postgres \
    harbor-docker-registry-dev.gp2.axadmin.net/identifix_cms/bkd-quarkus\:latest

run-docker-pcf-postgres: ; docker run -i --rm -p 8080\:8080 \
    --env GREETING_MESSAGE=stuff \
    --env QUARKUS_DATASOURCE_DRIVER=org.postgresql.Driver \
    --env QUARKUS_DATASOURCE_URL=jdbc\:postgresql\://10.55.49.177\:65432/sb_c9ce2008-de13-4720-b191-f135358791b4 \
    --env QUARKUS_DATASOURCE_USERNAME=sb_bac29270-1a21-4dc4-a21e-0a704a0aaaed \
    --env QUARKUS_DATASOURCE_PASSWORD=83T601ZG9wW27duI5L4V \
    harbor-docker-registry-dev.gp2.axadmin.net/identifix_cms/bkd-quarkus\:latest
