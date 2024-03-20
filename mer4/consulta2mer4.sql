use mer4;
select POLISSA.num_polissa as "Numero de la polissa", TIPUS_POLISSA.nom as "Nom Polissa",  
		CLIENT.DNI, CLIENT.nom as "Nom client", CLIENT.cognom as "Cognom del client"
from CLIENT, POLISSA, TIPUS_POLISSA
where CLIENT.DNI = POLISSA.client_DNI and
		TIPUS_POLISSA.ID = POLISSA.TIPUS_POLISSA_ID and
        TIPUS_POLISSA.nom = "Viatge";