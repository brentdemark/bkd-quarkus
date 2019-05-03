#
# Development
#
run-dev-h2: ; ./mvnw compile quarkus\:dev \
    -Dquarkus.datasource.url=jdbc\:h2\:mem\:bkd \
    -Dquarkus.datasource.driver=org.h2.Driver

run-dev-postgres: ; ./mvnw compile quarkus\:dev \
    -Dquarkus.datasource.url=jdbc\:postgresql\://localhost\:5432/bkd \
    -Dquarkus.datasource.driver=org.postgresql.Driver \
    -Dquarkus.datasource.username=bkd \
    -Dquarkus.datasource.password=postgres

run-dev-mariadb: ; ./mvnw compile quarkus\:dev \
    -Dquarkus.datasource.url=jdbc:mariadb://localhost:3306/bkd \
    -Dquarkus.datasource.driver=org.mariadb.jdbc.Driver \
    -Dquarkus.hibernate-orm.dialect=org.hibernate.dialect.MariaDBDialect \
    -Dquarkus.datasource.username=root \
    -Dquarkus.datasource.password=mariadb

#
# java jar
#
run-jar-h2: ; java \
    -Dquarkus.datasource.url=jdbc\:h2\:mem\:bkd \
    -Dquarkus.datasource.driver=org.h2.Driver \
    -jar ./target/bkd-quarkus-1.0-SNAPSHOT-runner.jar

run-jar-postgres: ; java \
    -Dquarkus.datasource.url=jdbc\:postgresql\://localhost\:5432/bkd \
    -Dquarkus.datasource.driver=org.postgresql.Driver \
    -Dquarkus.datasource.username=bkd \
    -Dquarkus.datasource.password=postgres \
    -jar ./target/bkd-quarkus-1.0-SNAPSHOT-runner.jar

run-jar-mariadb: ; java \
    -Dquarkus.datasource.url=jdbc:mariadb://localhost:3306/bkd \
    -Dquarkus.datasource.driver=org.mariadb.jdbc.Driver \
    -Dquarkus.hibernate-orm.dialect=org.hibernate.dialect.MariaDBDialect \
    -Dquarkus.datasource.username=root \
    -Dquarkus.datasource.password=mariadb \
    -jar ./target/bkd-quarkus-1.0-SNAPSHOT-runner.jar

#
# local native
#
run-native-postgres: ; ./target/bkd-quarkus-1.0-SNAPSHOT-runner \
    -Dquarkus.datasource.url=jdbc\:postgresql\://localhost\:5432/bkd \
    -Dquarkus.datasource.driver=org.postgresql.Driver \
    -Dquarkus.datasource.username=bkd \
    -Dquarkus.datasource.password=postgres

#
# docker native
#
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
