use Mer7;
select count(*)
from Linia_Ticket, Tickwt, Empleats
where Tickwt.ID=Linia_Ticket.Tickwt_Num and
Empleats.ID=Tickwt.Empleats_ID and
Empleats.cognom	LIKE "0%";