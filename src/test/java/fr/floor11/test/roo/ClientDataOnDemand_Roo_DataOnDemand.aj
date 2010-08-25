package fr.floor11.test.roo;

import fr.floor11.test.roo.Client;
import java.util.List;
import java.util.Random;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ClientDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ClientDataOnDemand: @Component;
    
    private Random ClientDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<Client> ClientDataOnDemand.data;
    
    public Client ClientDataOnDemand.getNewTransientClient(int index) {
        fr.floor11.test.roo.Client obj = new fr.floor11.test.roo.Client();
        obj.setEmail("email_" + index);
        obj.setNom("nom_" + index);
        obj.setNumPortable("numPortable_" + index);
        obj.setNumTelephone("numTelephone_" + index);
        obj.setPrenom("prenom_" + index);
        return obj;
    }
    
    public Client ClientDataOnDemand.getSpecificClient(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        Client obj = data.get(index);
        return Client.findClient(obj.getId());
    }
    
    public Client ClientDataOnDemand.getRandomClient() {
        init();
        Client obj = data.get(rnd.nextInt(data.size()));
        return Client.findClient(obj.getId());
    }
    
    public boolean ClientDataOnDemand.modifyClient(Client obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void ClientDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = fr.floor11.test.roo.Client.findClientEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Client' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<fr.floor11.test.roo.Client>();
        for (int i = 0; i < 10; i++) {
            fr.floor11.test.roo.Client obj = getNewTransientClient(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
