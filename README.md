
<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
      </ul>
    </li>
    <li><a href="#rest-endpoints">ReST Endpoints</a></li>

  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project
You are a back-end developer working on a team that is building an application to plan road trips. This app will allow users to see the current weather as well as the forecasted weather at the destination.

Your team is working in a service-oriented architecture. The front-end will communicate with your back-end through an API. Your job is to expose that API that satisfies the front-end team’s requirements.


### Built With

* [Ruby on Rails](https://rubyonrails.org/)
* [PostgreSQL](https://www.postgresql.org/)

<!-- GETTING STARTED -->
## Getting Started

1. Clone this repo
2. Install gem packages: `bundle install`
4. Local development needs API keys from 
```
https://openweathermap.org/api/one-call-api
https://developer.mapquest.com/documentation/
https://www.pexels.com/api/documentation/#guidelines
```
5. Install figaro
```
 $bundle exec figaro install
```
6. Configure `config/application.yml`
```
MAPQUEST_API: 'your token'
MAPQUEST_API_SECRET: 'your token'
WEATHER_API: 'your token'
PEXELS_API: 'your token'

```
7. Start your server
```
$rails s
```


### Prerequisites

* Ruby 2.5.3
* Rails 5.2.5

<!-- USAGE EXAMPLES -->

<details open>
<summary>ReST Endpoints</summary>
<br>
 
 *POST* Endpoints require:
 
```
 Content-Type: application/json
 Accept: application/json
```
 

### Create User: `POST /api/v1/users`
* Returns `api_key` generated and `email` 
> Required Body: 

```
 {
  "email": "example@email.com",
  "password": "password",
  "password_confirmation": "password"
 }
```

### Login User: `POST /api/v1/sessions`
* Returns logged in user
> Required Body:
```
{
  "email": "whatever@example.com",
  "password": "password"
}
```

### Get Forecast: `GET /api/v1/forecast`
* Returns weather forecast for a given city
> Required Parameters: `:location`

<details closed>
  <summary>Sample Response</summary>
  
```
GET /api/v1/forecast?location=denver,co

{
  "data": {
    "id": null,
    "type": "forecast",
    "attributes": {
      "current_weather": {
        "datetime": "2020-09-30 13:27:03 -0600",
        "temperature": 79.4,
        etc
      },
      "daily_weather": [
        {
          "date": "2020-10-01",
          "sunrise": "2020-10-01 06:10:43 -0600",
          etc
        },
        {...} etc
      ],
      "hourly_weather": [
        {
          "time": "14:00:00",
          "conditions": "cloudy with a chance of meatballs",
          etc
        },
        {...} etc
      ]
    }
  }
}

```
</details>

### Get Image: `GET /api/v1/backgrounds`
* Returns background image for given city
> Required Parameters: `:location`

Sample Response

```
GET /api/v1/backgrounds?location=denver,co

{
  "data": {
    "id": null,
    "type": "image",
    "attributes": {
      "id": null,
      "location": "denver,co",
      "image_url": "https://www.pexels.com/photo/city-buildings-at-dusk-7316857/",
      "credit": {
        "source": "https://www.pexels.com",
        "author": "MART PRODUCTION",
        "logo": "https://theme.zdassets.com/theme_assets/9028340/1e73e5cb95b89f1dce8b59c5236ca1fc28c7113b.png"
      }
    }
  }
}
```

### Create Road Trip: `POST /api/v1/road_trip`
* Returns duration of trip and arrival weather forecast
> Required Body: 

```
{
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```

<details closed>
  <summary>Sample Response</summary>
  
```

{
  "data": {
    "id": null,
    "type": "road_trip",
    "attributes": {
      "start_city": "Denver,CO",
      "end_city": "Pueblo,CO",
      "weather_at_eta": {
        "tempterature": 54.93,
        "condition": "few clouds"
      },
      "travel_time": "1 hours and 44 minutes"
    }
  }
}

```
</details>

</details>

