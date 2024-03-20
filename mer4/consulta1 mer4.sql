use mer4;
select CLIENT.nom as "Nom client", CLIENT.cognom as "Cognom del client" , POLISSA.num_polissa as "Numero de la polissa"
from CLIENT, POLISSA
where CLIENT.DNI = POLISSA.CLIENT_DNI and CLIENT.nom="Pepe" and CLIENT.cognom="Xoc";
