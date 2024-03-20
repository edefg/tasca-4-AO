use Ex5;
select client.nom, Vehicle.marca ,Tipus_vehicle.nom, cita.data, cita.lloc, CLIENT_VEHICLE.data_darrera_revisio
from client, Vehicle, Tipus_vehicle, cita, CLIENT_VEHICLE
where client.DNI = CLIENT_VEHICLE.Vehicle_num_bastidor and
	Vehicle_num_bastidor = CLIENT_VEHICLE.Vehicle_num_bastidor and
    Tipus_vehicle.ID = Vehicle.Tipus_vehicle_ID and
    CLIENT_VEHICLE.ID = cita.CLIENT_VEHICLE_ID and
    cita.data>"2022-03-09";