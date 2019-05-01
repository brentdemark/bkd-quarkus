package idx.config;

import static io.restassured.RestAssured.given;
import static org.hamcrest.CoreMatchers.is;

import io.quarkus.test.common.QuarkusTestResource;
import io.quarkus.test.h2.H2DatabaseTestResource;
import io.quarkus.test.junit.QuarkusTest;
import org.junit.jupiter.api.Test;

@QuarkusTest
@QuarkusTestResource(H2DatabaseTestResource.class)
public class OemControllerTest {

    public void testOemEndpoint() {
        given()
          .when().get("/oem")
          .then()
             .statusCode(200)
             .body(is("[]"));
    }

}