use Mer7;
select Tickwt.num_factuta, Tickwt.dat, Empleats.cognom
from Tickwt, Empleats, producte,Linia_Ticket
where producte.ID=Linia_Ticket.producte_ID and
Tickwt.ID = Linia_Ticket.Tickwt_Num and
Empleats.ID=Tickwt.Empleats_ID AND
producte.nom="ProducteA";