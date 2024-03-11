# designing the db

<!--toc:start-->

- [designing the db](#designing-the-db)

  - [Database: transport_company](#database-transportcompany)

    - [table: trips](#table-trips)
    - [table: drivers](#table-drivers)
    - [table: vehicles](#table-vehicles)
    - [table: Trips_Vehicles_Drivers](#table-tripsvehiclesdrivers)

  <!--toc:end-->

### Database: transport_company

How to handle repeating trips?

#### table: trips

- Id: Guid
- Departure_location: Varchar(255)
- Destination_location: Varchar(255)
- Distance: Int (km)
- Duration: Int (mins)
- Price (per person): Decimal

#### table: drivers

- Id: Guid
- Name: Varchar(255)
- Surname: Varchar(255)
- License: Varchar(255)

#### table: vehicles

- Id: Guid
- Name: Varchar(255)
- Color: Varchar(255)
- Seats: Int
- Plate: Varchar(155)

#### table: Trips_Vehicles_Drivers

- Id: Guid
- Trip_id: Guid
- Vehicle_id: Guid
- Driver_id: Guid
- Departure: DateTime
- Duration: Int (mins)
- Price
