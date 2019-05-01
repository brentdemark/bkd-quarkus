package idx.model;

import io.quarkus.hibernate.orm.panache.PanacheEntity;

import javax.persistence.Entity;
import java.time.LocalDate;

@Entity
public class Oem extends PanacheEntity {
    public String name;
    public String website;
    public LocalDate lastCrawled;

    public static Oem findByName(String name){
        return find("name", name).firstResult();
    }

//    public LocalDate getLastCrawled() {
//        return LocalDate.of(1910, Month.FEBRUARY, 1);
//    }
}
