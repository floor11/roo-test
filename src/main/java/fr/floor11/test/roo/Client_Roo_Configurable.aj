package fr.floor11.test.roo;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect Client_Roo_Configurable {
    
    declare @type: Client: @Configurable;
    
}
