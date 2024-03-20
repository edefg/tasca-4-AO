use Mer7;
select producte.nom, producte.descripccio, producte.IVA, producte.preu_unitari
from producte
where producte.IVA="10%";