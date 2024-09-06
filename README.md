# README

# Wildlife Sightings API
## Overview

The Wildlife Sightings API is designed to help manage and report wildlife sightings in a forest conservancy area. This API allows users to interact with data related to animals and their sightings within the specified area. The API supports CRUD (Create, Read, Update, Delete) operations for both animals and sightings, and provides endpoints for querying sightings within a specific time period.

## Features
- Animal Management
  - Create, update, and delete animal records.
  - Each animal record includes information such as common name, Latin name, and kingdom.

- Sighting Management
  - Create, update, and delete sightings for animals.
  - Each sighting includes a date, latitude, and longitude.

- Animal-Sighting Association
  - Each animal can have multiple sightings.
  - Retrieve all sightings associated with a specific animal.

- Sighting Reporting
  - Query and list all sightings within a given time period.

## API Endpoints
### Animals
  GET /animals
    Retrieve a list of all animals.

  POST /animals
    Create a new animal record.

  GET /animals/
    Retrieve details of a specific animal, including its associated sightings.

  PUT/PATCH /animals/
    Update an existing animal record.

  DELETE /animals/
    Delete a specific animal record.

### Sightings
  GET /sightings
    Retrieve a list of all sightings within a given time period (using start_date and end_date query parameters).

  POST /sightings
    reate a new sighting record for an animal.

  PUT/PATCH /sightings/
        Update an existing sighting record.

  DELETE /sightings/
    Delete a specific sighting record.

## Data Models
  Animal
    common_name: String, required.
    latin_name: String, required, unique, and cannot be the same as common_name.
    kingdom: String.

  Sighting
    date: DateTime, required.
    latitude: Float, required.
    longitude: Float, required.
    animal_id: Integer, required, references the Animal model.

## Validation Rules

    Animals must have a common name and Latin name.
    The Latin name must be unique and different from the common name.
    Sightings must include a date, latitude, and longitude.
    Proper validation errors are returned for failed validations.

## Setup
  - Clone the repository.
  - Install dependencies with bundle install.
  - Set up the database with rails db:create and rails db:migrate.
  - Seed the database with rails db:seed (optional, for initial data).

## Usage
You can interact with the API using tools like Postman or cURL. Refer to the API endpoints listed above for available operations.
