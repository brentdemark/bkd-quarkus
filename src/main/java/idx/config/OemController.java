package idx.config;

import idx.model.Oem;

import javax.enterprise.context.ApplicationScoped;
import javax.json.Json;
import javax.transaction.Transactional;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.ext.ExceptionMapper;
import javax.ws.rs.ext.Provider;
import java.util.List;

@Path("/oem")
@ApplicationScoped
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class OemController {

    @GET
    public List<Oem> list() {
        return Oem.listAll();
    }

    @GET
    @Path("{id}")
    public Oem getSingle(@PathParam("id") Long id) {
        Oem oem = Oem.findById(id);
        if (oem == null) {
            throw new WebApplicationException("Oem with id of " + id + " does not exist.", 404);
        }
        return oem;
    }

    @GET
    @Path("/search")
    public Oem findByName(@QueryParam("name") String name) {
        Oem oem = Oem.findByName(name);
        if (oem == null) {
            throw new WebApplicationException("Oem with id of " + name + " does not exist.", 404);
        }
        return oem;
    }

    @POST
    @Transactional
    public Response create(Oem oem) {
        if (oem.id != null) {
            throw new WebApplicationException("Id was invalidly set on request.", 422);
        }
        oem.persist();
        return Response.ok(oem).status(201).build();
    }

    @Provider
    public static class ErrorMapper implements ExceptionMapper<Exception> {

        @Override
        public Response toResponse(Exception exception) {
            int code = 500;
            if (exception instanceof WebApplicationException) {
                code = ((WebApplicationException) exception).getResponse().getStatus();
            }
            return Response.status(code)
                    .entity(Json.createObjectBuilder().add("error", exception.getMessage()).add("code", code).build())
                    .build();
        }

    }
}