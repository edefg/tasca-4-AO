use mer4;
select CLIENT.nom, CLIENT.cognom, Venedor.nom, Venedor.cognom, POLISSA.num_polissa, TIPUS_POLISSA.nom
from  CLIENT, Venedor, POLISSA, TIPUS_POLISSA
where CLIENT.DNI = POLISSA.CLIENT_DNI and Venedor.DNI=POLISSA.Venedor_DNI and
		TIPUS_POLISSA.ID = POLISSA.TIPUS_POLISSA_ID;