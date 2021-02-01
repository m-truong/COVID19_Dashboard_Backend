# COVID-19 Information Portal

---

![COVID-19 Dashboard App](https://www.cbp.gov/sites/default/files/covidimage2.png)

---

### Motivation:

The COVID-19 global pandemic is one of the worst health crises in history, and it has infected and killed millions of people. I wanted to build a COVID-19 Dashboard App to visually display real-time cases, deaths, and recovered data using React-Chartjs-2, React-Leaflet, and the Disease.sh COVID-19 API database. My COVID-19 Dashboard is inspired by the John Hopkins COVID-19 Map (https://coronavirus.jhu.edu/map.html), as well as CNN's news coverage of daily COVID-19 cases. I'm a fan of the Resident Evil video game series (https://www.residentevil.com/), so my COVID-19 dashboard app also takes visual inspiration from the series to convey the severity and horror of the global COVID-19 crisis.

### Project Summary:

My COVID-19 Dashboard has two dashboard pages that renders a React-Leaflet interactive map that visitors can zoom, drag, and click on to display the total cases, deaths, and recovered statistics for Worldwide and United States COVID-19 data. The dashboard pages also render stats tables that display the total cumulative cases, deaths, and recovered data for every country and state. The graphs page renders two line graphs using React-Chartjs-2 displaying the rise in daily new COVID-19 cases in the past 120 days. The videos page displays playable YouTube videos with information on COVID-19 biology, vaccine research, and best practices on staying safe during the pandemic. Visitors can also register and login using a username and password that comunicates with my RubyOnRails backend server using JWT authentication.

**Link to site:** ()

### Features:

- I fetched the COVID-19 data from the Disease.sh third-party global disease API (https://disease.sh/). I was able to dynamically draw interactable React-Leaflet Circle components using the total cases data for every country and state. I also was able to render a dark-themed map TileLayer in React-Leaflet.
- I used React-Chartjs-2 to draw line graphs of daily new cases worldwide and in the United States. React-Chartjs-2's Line-graph component allowed me to pass down custom options and data rendering the rise in daily new cases.
- My COVID-19 dashboard app also uses RubyOnRails as the backend with JWT authentication for visitors to regiser and login with a username and password.
- I used React-Player to display playable YouTube videos with additional information on the global COVID-19 pandemic.
- I added an animated video background of the coronavirus strain that plays while visitors are browsing my app. 

### Code Example:

For my WorldDashboard and StatesDashboard page, I utilized React-Bootstrap to help display my react components using Bootstrap's Container, Row, and Col components. This helped better organize my react components very cleanly without having to add a lot of CSS styling rules. React-Bootstrap's grid layout helped me to focus on building reusable and scalable components, such as my DataCard and StatsTable components, that I could render consistently across all my React-Router pages. 

```
<Container fluid>
    <Title>COVID-19 Worldwide Dashboard </Title>
    <Row className="justify-content-around">
        <Col className="col-margin-top" md={2}>
            <DataCard title={"Cases"} stat={worldData.cases} />
            <StatsTable name="Countries" region={casesTableData} type="Cases" />
        </Col>
        <Col md={6}>
            <CovidLiveMap covidCircleData={countriesData} type="Worldwide" />
        </Col>
        <Col className="col-margin-top" md={2}>
            <DataCard title={"Deaths"} stat={worldData.deaths} />
            <StatsTable name="Countries" region={deathsTableData} type="Deaths" />
        </Col>
        <Col className="col-margin-top" md={2}>
            <DataCard title={"Recovered"} stat={worldData.recovered} />
            <StatsTable name="Countries" region={recoveredTableData} type="Recovered" />
        </Col>
    </Row>
</Container>
```

### API Reference:

(https://disease.sh/docs/)

### Technologies used:

- Disease.sh API Library (https://disease.sh/docs/)
- React-Leaflet and Leaflet (https://react-leaflet.js.org/)
- React-Chartjs-2 and Chart.js (https://www.npmjs.com/package/react-chartjs-2)
- LatLong.net (https://www.latlong.net/category/states-236-14.html)
- React-Player (https://www.npmjs.com/package/react-player)
- React-Router-DOM (https://reactrouter.com/)
- React-Bootstrap (https://react-bootstrap.github.io/)
- GitLFS package (https://git-lfs.github.com/)
- COVID-19 Animated Background Video (https://www.youtube.com/watch?v=WNG7X3-_HJE)
- Heroku (https://www.heroku.com/)

---

## Lessons/Ongoing Issues:

### Rendering more COVID-19 Chart.js graphs 

- I originally hoped to use React-Chartjs-2 to render graphs to display trends in COVID-19 cases based on different factors such as socioeconomic status, access to healthcare, and exposure to the virus based on occupation, travel, etc.
- But the Disease.sh third-party COVID-19 API database didn't have special populations data based on these criteria

## Future Game Improvements:

1. Add a Twitter API that fetches tweets fro CDCgov and CNN with updates and information on COVID-19
2. Add more Chart.js graphs that render different trends in COVID-19 data for different age and socio-economic groups
3. Add a dropdown to select a specific country or state and render it's total cases, deaths, and recovered on the datacards and change the zoom of the map to the region's latitude and longitude on the Leaflet map

## Credits:
- John Hopkins COVID-19 Map (https://coronavirus.jhu.edu/map.html)
- CNN COVID-19 Cases Dashboard (https://www.cnn.com/interactive/2020/health/coronavirus-us-maps-and-cases/)
- COVID-19 Tracker YouTube Inspiration (https://www.youtube.com/watch?v=cF3pIMJUZxM)

## Issues and Resolutions

#### List of Errors.....

**ERROR**:
Failed to load resource: net::ERR_BLOCKED_BY_CLIENT

**RESOLUTION**:
This error seems to be due to a browser extension blocking the request to render the YouTube videos on my videos page. Visitors with an ad blocker extension will encounter this error. 