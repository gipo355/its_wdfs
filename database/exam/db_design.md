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
- Departure: Varchar(50)
- Destination: Varchar(50)
- Distance: Int
- Duration

#### table: drivers

- Id: Guid
- Name: Varchar(50)
- Surname: Varchar(50)
- License: Varchar(50)

#### table: vehicles

- Id: Guid
- Name: Varchar(50)
- Seats: Int

#### table: Trips_Vehicles_Drivers

- Id: Guid
- Trip_id: Guid
- Vehicle_id: Guid
- Driver_id: Guid
- Departure_date: Date
- Departure_time: Date
- Duration: default duration
