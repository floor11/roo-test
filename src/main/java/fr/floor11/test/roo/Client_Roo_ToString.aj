package fr.floor11.test.roo;

import java.lang.String;

privileged aspect Client_Roo_ToString {
    
    public String Client.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Nom: ").append(getNom()).append(", ");
        sb.append("Prenom: ").append(getPrenom()).append(", ");
        sb.append("NumTelephone: ").append(getNumTelephone()).append(", ");
        sb.append("NumPortable: ").append(getNumPortable()).append(", ");
        sb.append("Email: ").append(getEmail());
        return sb.toString();
    }
    
}
