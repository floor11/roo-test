package fr.floor11.test.roo;

import java.lang.String;

privileged aspect Client_Roo_JavaBean {
    
    public String Client.getNom() {
        return this.nom;
    }
    
    public void Client.setNom(String nom) {
        this.nom = nom;
    }
    
    public String Client.getPrenom() {
        return this.prenom;
    }
    
    public void Client.setPrenom(String prenom) {
        this.prenom = prenom;
    }
    
    public String Client.getNumTelephone() {
        return this.numTelephone;
    }
    
    public void Client.setNumTelephone(String numTelephone) {
        this.numTelephone = numTelephone;
    }
    
    public String Client.getNumPortable() {
        return this.numPortable;
    }
    
    public void Client.setNumPortable(String numPortable) {
        this.numPortable = numPortable;
    }
    
    public String Client.getEmail() {
        return this.email;
    }
    
    public void Client.setEmail(String email) {
        this.email = email;
    }
    
}
