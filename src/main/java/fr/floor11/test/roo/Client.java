package fr.floor11.test.roo;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import javax.validation.constraints.NotNull;

@Entity
@RooJavaBean
@RooToString
@RooEntity
public class Client {

    @NotNull
    private String nom;

    @NotNull
    private String prenom;

    @NotNull
    private String numTelephone;

    @NotNull
    private String numPortable;

    @NotNull
    private String email;
}
